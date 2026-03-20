using System;

namespace G5_FINAL_PROJECT
{
    public partial class SiteHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserStatus();
            }
        }

        private void CheckUserStatus()
        {
            if (Session["UserID"] != null && Session["Role"] != null)
            {
                pnlGuest.Visible = false;
                pnlLoggedIn.Visible = true;

                string role = Session["Role"].ToString();
                string name = Session["FullName"] != null ? Session["FullName"].ToString() : "User";

                lblDisplayName.Text = name.ToUpper();

                if (role == "Admin")
                {
                    lblRoleBadge.Text = "ADMIN";
                    lblRoleBadge.Visible = true;
                    lnkDashboard.Visible = true;
                }
                else
                {
                    lblRoleBadge.Visible = false;
                    lnkDashboard.Visible = false;
                }
            }
            else
            {
                pnlGuest.Visible = true;
                pnlLoggedIn.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}
