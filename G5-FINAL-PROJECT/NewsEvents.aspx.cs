using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace G5_FINAL_PROJECT
{
    public partial class NewsEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
            {
                AdminControlsPanel.Visible = true;
            }
            else
            {
                AdminControlsPanel.Visible = false;
            }

            if (!IsPostBack)
            {
                LoadNews();
            }
        }

        private void LoadNews()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT NewsID, Title, Content, PublishDate, ImagePath FROM News ORDER BY PublishDate DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {
                        var path = row["ImagePath"] as string;
                        var resolved = BlobStorageHelper.GetPublicUrl(path);
                        row["ImagePath"] = resolved ?? "";
                    }

                    NewsRepeater.DataSource = dt;
                    NewsRepeater.DataBind();
                }
            }
        }

        protected void btnSaveNews_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewsTitle.Text) || string.IsNullOrWhiteSpace(txtNewsContent.Text))
            {
                return;
            }

            string imagePath = string.Empty;

            if (fuNewsImage.HasFile)
            {
                try
                {
                    imagePath = BlobStorageHelper.Upload(fuNewsImage.FileContent, fuNewsImage.PostedFile.ContentType, "news", fuNewsImage.FileName);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(GetType(), "uploadError", $"alert('Image upload failed: {ex.Message}');", true);
                    return;
                }
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO News (Title, Content, AuthorID, PublishDate, ImagePath) VALUES (@Title, @Content, @AuthorID, GETDATE(), @Img)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", txtNewsTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Content", txtNewsContent.Text.Trim());
                    cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"]);
                    cmd.Parameters.AddWithValue("@Img", string.IsNullOrEmpty(imagePath) ? (object)DBNull.Value : imagePath);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            txtNewsTitle.Text = "";
            txtNewsContent.Text = "";
            LoadNews();
        }
    }
}
