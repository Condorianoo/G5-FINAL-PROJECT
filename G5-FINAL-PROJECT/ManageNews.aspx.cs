using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace G5_FINAL_PROJECT
{
    public partial class ManageNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("NewsEvents.aspx");
            }

            if (!IsPostBack)
            {
                LoadAllNews();
            }
        }

        private void LoadAllNews()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT NewsID, Title, PublishDate FROM News ORDER BY PublishDate DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    rptManageNews.DataSource = dt;
                    rptManageNews.DataBind();
                }
            }
        }

        protected void rptManageNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteNews")
            {
                int newsID = Convert.ToInt32(e.CommandArgument);
                DeleteArticle(newsID);
            }
        }

        private void DeleteArticle(int id)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM News WHERE NewsID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    lblStatus.Text = "Article deleted successfully.";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }

            LoadAllNews();
        }
    }
}
