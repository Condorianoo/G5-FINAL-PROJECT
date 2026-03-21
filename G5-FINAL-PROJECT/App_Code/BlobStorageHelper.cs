using System;
using System.Configuration;
using System.IO;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using Azure.Storage.Sas;

namespace G5_FINAL_PROJECT
{
    public static class BlobStorageHelper
    {
        private static string ConnectionString => ConfigurationManager.AppSettings["BlobConnectionString"];
        private static string ContainerName => ConfigurationManager.AppSettings["BlobContainerName"] ?? "cabuyaolnf-item-images";

        private static int MaxBytes
        {
            get
            {
                int.TryParse(ConfigurationManager.AppSettings["UploadMaxBytes"], out var val);
                return val > 0 ? val : 5 * 1024 * 1024; // default 5MB
            }
        }

        private static int RetentionDays
        {
            get
            {
                int.TryParse(ConfigurationManager.AppSettings["UploadRetentionDays"], out var val);
                return val > 0 ? val : 30;
            }
        }

        /// <summary>
        /// Uploads a stream to blob storage and returns the blob name (not SAS).
        /// </summary>
        public static string Upload(Stream content, string contentType, string folder, string fileName)
        {
            if (content == null) throw new ArgumentNullException(nameof(content));
            if (content.Length > MaxBytes) throw new InvalidOperationException($"File exceeds {MaxBytes / 1024 / 1024} MB limit.");

            var containerClient = new BlobContainerClient(ConnectionString, ContainerName);
            containerClient.CreateIfNotExists(PublicAccessType.None);

            var blobName = $"{folder.TrimEnd('/')}/{Guid.NewGuid():N}{Path.GetExtension(fileName)}";
            var blobClient = containerClient.GetBlobClient(blobName);

            var headers = new BlobHttpHeaders();
            if (!string.IsNullOrWhiteSpace(contentType))
            {
                headers.ContentType = contentType;
            }

            // Upload and set headers
            content.Position = 0;
            blobClient.Upload(content, new BlobUploadOptions { HttpHeaders = headers });

            return blobName;
        }

        /// <summary>
        /// Returns a URL usable in the UI. Generates a long-lived read SAS for private blobs.
        /// Also supports legacy local paths and absolute URLs.
        /// </summary>
        public static string GetPublicUrl(string storedPath)
        {
            if (string.IsNullOrWhiteSpace(storedPath)) return null;

            // Already absolute URL
            if (storedPath.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                storedPath.StartsWith("https://", StringComparison.OrdinalIgnoreCase))
            {
                return storedPath;
            }

            // Legacy local relative path
            if (storedPath.StartsWith("uploads/", StringComparison.OrdinalIgnoreCase) ||
                storedPath.StartsWith("images/", StringComparison.OrdinalIgnoreCase))
            {
                return "~/" + storedPath.TrimStart('~', '/');
            }

            // Treat as blob name
            var containerClient = new BlobContainerClient(ConnectionString, ContainerName);
            var blobClient = containerClient.GetBlobClient(storedPath);

            if (blobClient.CanGenerateSasUri)
            {
                var sasBuilder = new BlobSasBuilder
                {
                    BlobContainerName = containerClient.Name,
                    BlobName = storedPath,
                    Resource = "b",
                    ExpiresOn = DateTimeOffset.UtcNow.AddDays(365) // 1 year read token
                };
                sasBuilder.SetPermissions(BlobSasPermissions.Read);
                return blobClient.GenerateSasUri(sasBuilder).ToString();
            }

            // Fallback to public blob URL (requires container public access)
            return blobClient.Uri.ToString();
        }
    }
}
