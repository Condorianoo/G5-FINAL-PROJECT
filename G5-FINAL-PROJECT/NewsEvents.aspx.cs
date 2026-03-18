using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

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

            string imagePath = ""; // Default empty

            if (fuNewsImage.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuNewsImage.FileName);
                    string uniqueName = Guid.NewGuid().ToString() + "_" + fileName;
                    string folderPath = Server.MapPath("~/images/News/");

                    if (!Directory.Exists(folderPath)) { Directory.CreateDirectory(folderPath); }

                    fuNewsImage.SaveAs(Path.Combine(folderPath, uniqueName));
                    imagePath = "images/News/" + uniqueName;
                }
                catch {  }
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
                    cmd.Parameters.AddWithValue("@Img", (object)imagePath ?? DBNull.Value);

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
