using System;
using System.Configuration;
using System.Data.SqlClient;

namespace G5_FINAL_PROJECT
{
    public partial class ClaimItem : System.Web.UI.Page
    {
        string itemID;

        private static bool HasProofImageColumn(SqlConnection conn)
        {
            const string query = "SELECT COUNT(1) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Claims' AND COLUMN_NAME = 'ProofImagePath'";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            itemID = Request.QueryString["id"];

            if (string.IsNullOrEmpty(itemID) || Session["UserID"] == null)
            {
                Response.Redirect("FindItem.aspx");
            }

            if (!IsPostBack)
            {
                LoadItemDetails();
            }
        }

        private void LoadItemDetails()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Description, ImagePath FROM Items WHERE ItemID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", itemID);

                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblItemTitle.Text = reader["Title"].ToString();
                                litItemName.Text = reader["Title"].ToString();
                                lblItemDesc.Text = reader["Description"].ToString();

                                string imgPath = reader["ImagePath"].ToString();
                                var resolved = BlobStorageHelper.GetPublicUrl(imgPath);
                                imgItem.ImageUrl = !string.IsNullOrEmpty(resolved) ? resolved : "~/images/no-image.png";
                            }
                            else
                            {
                                Response.Redirect("FindItem.aspx");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Error loading details: " + ex.Message;
                    }
                }
            }
        }

        protected void btnSubmitClaim_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtProof.Text))
            {
                lblError.Text = "Please provide proof of ownership.";
                return;
            }

            string proofImagePath = string.Empty;
            if (fuProofImage.HasFile)
            {
                try
                {
                    proofImagePath = BlobStorageHelper.Upload(
                        fuProofImage.FileContent,
                        fuProofImage.PostedFile.ContentType,
                        "claim-proofs",
                        fuProofImage.FileName);
                }
                catch (Exception ex)
                {
                    lblError.Text = "Image upload failed: " + ex.Message;
                    return;
                }
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    bool hasProofImageColumn = HasProofImageColumn(conn);
                    if (!hasProofImageColumn && !string.IsNullOrEmpty(proofImagePath))
                    {
                        lblError.Text = "Claim proof image upload requires the ProofImagePath database column. Run Claims_ProofImage_Migration.sql first.";
                        return;
                    }

                    string query = hasProofImageColumn
                        ? "INSERT INTO Claims (ItemID, ClaimantID, ProofDetails, ProofImagePath, ClaimDate) VALUES (@ItemID, @UID, @Proof, @ProofImagePath, GETDATE())"
                        : "INSERT INTO Claims (ItemID, ClaimantID, ProofDetails, ClaimDate) VALUES (@ItemID, @UID, @Proof, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ItemID", itemID);
                        cmd.Parameters.AddWithValue("@UID", Session["UserID"]);
                        cmd.Parameters.AddWithValue("@Proof", txtProof.Text);
                        if (hasProofImageColumn)
                        {
                            cmd.Parameters.AddWithValue("@ProofImagePath", string.IsNullOrEmpty(proofImagePath) ? (object)DBNull.Value : proofImagePath);
                        }

                        cmd.ExecuteNonQuery();

                        pnlClaimForm.Visible = false;
                        pnlSuccess.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Database Error: " + ex.Message;
                }
            }
        }
    }
}
