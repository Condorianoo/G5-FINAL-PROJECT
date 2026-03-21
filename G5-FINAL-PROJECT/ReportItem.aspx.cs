using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace G5_FINAL_PROJECT
{
    public partial class ReportItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            string savedPath = "";

            if (fuMedia.HasFile)
            {
                try
                {
                    savedPath = BlobStorageHelper.Upload(fuMedia.FileContent, fuMedia.PostedFile.ContentType, "items", fuMedia.FileName);
                }
                catch (Exception ex)
                {
                    lblError.Text = "UPLOAD ERROR: " + ex.Message;
                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "INSERT INTO Items (Title, Description, Type, Status, ReportedByID, ImagePath) " +
                               "VALUES (@Title, @Desc, @Type, 'Pending', @UID, @Img)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", txtName.Text);

                    string statusPrefix = rblStatus.SelectedIndex == 0 ? "[User has item] " : "[Surrendered to Authorities] ";
                    cmd.Parameters.AddWithValue("@Desc", statusPrefix + txtContact.Text);

                    cmd.Parameters.AddWithValue("@Type", ddlCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@UID", Session["UserID"].ToString());

                    cmd.Parameters.AddWithValue("@Img", string.IsNullOrEmpty(savedPath) ? (object)DBNull.Value : savedPath);

                    try
                    {
                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();
                        conn.Close();

                        if (rows > 0)
                        {
                            Response.Redirect("Menu.aspx?status=submitted");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "DATABASE ERROR: " + ex.Message;
                    }
                }
            }
        }
    }
}
