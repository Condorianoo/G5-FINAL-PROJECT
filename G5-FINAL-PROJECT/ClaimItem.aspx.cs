using System;
using System.Configuration;
using System.Data.SqlClient;

namespace G5_FINAL_PROJECT
{
    public partial class ClaimItem : System.Web.UI.Page
    {
        string itemID;

        protected void Page_Load(object sender, EventArgs e)
        {
            itemID = Request.QueryString["id"];

            if (string.IsNullOrEmpty(itemID) || Session["UserID"] == null)
            {
                Response.Redirect("FindItem.aspx");
            }

            if (!IsPostBack)
            {
                LoadItemDetails();
            }
        }

        private void LoadItemDetails()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "SELECT Title, Description, ImagePath FROM Items WHERE ItemID = @ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", itemID);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        lblItemTitle.Text = reader["Title"].ToString();
                        litItemName.Text = reader["Title"].ToString(); // For the success message
                        lblItemDesc.Text = reader["Description"].ToString();

                        string imgPath = reader["ImagePath"].ToString();
                        imgItem.ImageUrl = !string.IsNullOrEmpty(imgPath) ? "~/" + imgPath : "~/images/no-image.png";
                    }
                    else
                    {
                        Response.Redirect("FindItem.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error loading details: " + ex.Message;
                }
            }
        }

        protected void btnSubmitClaim_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtProof.Text))
            {
                lblError.Text = "Please provide proof of ownership.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {

                string query = "INSERT INTO Claims (ItemID, ClaimantID, ProofDetails, ClaimDate) " +
                               "VALUES (@ItemID, @UID, @Proof, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ItemID", itemID);
                cmd.Parameters.AddWithValue("@UID", Session["UserID"]);
                cmd.Parameters.AddWithValue("@Proof", txtProof.Text);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    pnlClaimForm.Visible = false; // Hide the input form
                    pnlSuccess.Visible = true;    // Show the success message
                }
                catch (Exception ex)
                {
                    lblError.Text = "Database Error: " + ex.Message;
                }
            }
        }
    }
}
