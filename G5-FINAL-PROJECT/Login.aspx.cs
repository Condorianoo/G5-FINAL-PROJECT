using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace G5_FINAL_PROJECT
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "SELECT UserID, Role, FullName FROM Users WHERE Email=@Email AND PasswordHash=@Pass";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {

                            Session["UserID"] = reader["UserID"].ToString();
                            Session["Role"] = reader["Role"].ToString();
                            Session["FullName"] = reader["FullName"].ToString(); // This passes the name to the header!

                            Response.Redirect("Menu.aspx");
                        }
                        else
                        {
                            lblError.Text = "Invalid email or password.";
                        }
                    }
                }
            }
        }
    }
}
