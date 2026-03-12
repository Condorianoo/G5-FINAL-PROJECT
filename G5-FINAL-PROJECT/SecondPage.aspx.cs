using System;
using System.Collections.Generic;
using System.Data;

namespace G5_FINAL_PROJECT
{
    public partial class SecondPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No LoadItems() here!
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}