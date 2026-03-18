using System;
using System.Configuration;
using System.Data.SqlClient;

namespace G5_FINAL_PROJECT
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSuccess.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtEmail.Text) || string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblSuccess.Text = "Please fill in all fields before sending.";
                lblSuccess.CssClass = "alert-success"; // You can change this to a red style if you wish
                lblSuccess.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {

                    string query = "INSERT INTO Inquiries (UserName, UserEmail, MessageContent, DateSent, Status) " +
                                   "VALUES (@Name, @Email, @Msg, GETDATE(), 'Unread')";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Msg", txtMessage.Text.Trim());

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblSuccess.Text = "Thank you! Your message has been sent to the Cabuyao Portal administration.";
                lblSuccess.CssClass = "alert-success";
                lblSuccess.Visible = true;

                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblSuccess.Text = "Sorry, there was an error sending your message. Please try again later.";
                lblSuccess.Visible = true;
            }
        }
    }
}
