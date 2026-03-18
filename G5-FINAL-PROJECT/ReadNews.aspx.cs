using System;
using System.Configuration;
using System.Data.SqlClient;

namespace G5_FINAL_PROJECT
{
    public partial class ReadNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string newsID = Request.QueryString["id"];

            if (string.IsNullOrEmpty(newsID))
            {
                Response.Redirect("NewsEvents.aspx");
            }

            if (!IsPostBack)
            {
                LoadFullArticle(newsID);
            }
        }

        private void LoadFullArticle(string id)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Title, Content, PublishDate, ImagePath FROM News WHERE NewsID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTitle.Text = reader["Title"].ToString();
                            lblDate.Text = Convert.ToDateTime(reader["PublishDate"]).ToString("MMMM dd, yyyy");
                            litContent.Text = reader["Content"].ToString();

                            string imgPath = reader["ImagePath"].ToString();
                            imgFullNews.ImageUrl = !string.IsNullOrEmpty(imgPath) ? "~/" + imgPath : "~/images/Cabuyao_Portal.jpg";
                        }
                        else
                        {

                            Response.Redirect("NewsEvents.aspx");
                        }
                    }
                }
            }
        }
    }
}
