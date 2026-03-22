using System;

namespace G5_FINAL_PROJECT
{
    public partial class Landing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
    }
}

