using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace G5_FINAL_PROJECT
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (txtPassword.Text != txtConfirm.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Users (FullName, Email, PasswordHash, Role) VALUES (@Name, @Email, @Pass, 'User')";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {

                    cmd.Parameters.AddWithValue("@Name", txtFullName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Pass", txtPassword.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            Response.Redirect("Login.aspx");
        }
    }
}

