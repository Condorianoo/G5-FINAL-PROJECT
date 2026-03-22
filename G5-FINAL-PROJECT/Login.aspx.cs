using System;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

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

                string query = "SELECT UserID, Role, FullName, PasswordHash FROM Users WHERE Email=@Email";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedHash = reader["PasswordHash"].ToString();
                            var passwordHasher = new PasswordHasher();
                            var verificationResult = passwordHasher.VerifyHashedPassword(storedHash, txtPassword.Text);

                            if (verificationResult == PasswordVerificationResult.Success || verificationResult == PasswordVerificationResult.SuccessRehashNeeded)
                            {
                                Session["UserID"] = reader["UserID"].ToString();
                                Session["Role"] = reader["Role"].ToString();
                                Session["FullName"] = reader["FullName"].ToString();

                                Response.Redirect("Menu.aspx");
                            }
                            else
                            {
                                lblError.Text = "Invalid email or password.";
                            }
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
