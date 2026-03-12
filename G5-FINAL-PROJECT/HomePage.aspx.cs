using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace G5_FINAL_PROJECT
{
    // Make sure this says 'HomePage' so it matches your file name
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the specific method the error is complaining about
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("SecondPage.aspx");
        }
    }
}