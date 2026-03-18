using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace G5_FINAL_PROJECT
{
    public partial class FindItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                BindItems();
            }
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            BindItems();
        }

        private void BindItems()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "SELECT ItemID, Title, Description, Type, ImagePath FROM Items WHERE Status = 'Published'";


                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    query += " AND (Title LIKE @Search OR Description LIKE @Search)";
                }

                if (ddlCategory.SelectedValue != "All")
                {
                    query += " AND Type = @Category";
                }

                query += " ORDER BY ItemID DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(txtSearch.Text))
                        cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");

                    if (ddlCategory.SelectedValue != "All")
                        cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);

                    conn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    rptItems.DataSource = dt;
                    rptItems.DataBind();
                }
            }
        }
    }
}
