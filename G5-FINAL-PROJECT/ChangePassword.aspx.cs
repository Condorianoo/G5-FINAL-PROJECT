using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using Microsoft.AspNet.Identity;

namespace G5_FINAL_PROJECT
{
    public partial class ChangePassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            var hasher = new PasswordHasher();
            string hashedPassword = hasher.HashPassword(txtNewPassword.Text);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Users SET PasswordHash=@Pass WHERE UserID=@UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Pass", hashedPassword);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserID"]);

                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rows > 0)
                    {
                        lblMessage.ForeColor = Color.LightGreen;
                        lblMessage.Text = "Password updated successfully.";
                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Unable to update password. Please try again.";
                    }
                }
            }
        }
    }
}
