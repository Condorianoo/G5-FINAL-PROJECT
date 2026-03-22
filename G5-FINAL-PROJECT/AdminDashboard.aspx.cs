using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace G5_FINAL_PROJECT
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private static bool HasProofImageColumn(SqlConnection conn)
        {
            const string query = "SELECT COUNT(1) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Claims' AND COLUMN_NAME = 'ProofImagePath'";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                return Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Menu.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            LoadPendingItems();
            LoadClaimRequests();
            LoadInquiries();
        }

        private void LoadPendingItems()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ItemID, Title, Description, Type, ImagePath FROM Items WHERE Status = 'Pending' ORDER BY ItemID DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {
                        var path = row["ImagePath"] as string;
                        var resolved = BlobStorageHelper.GetPublicUrl(path);
                        row["ImagePath"] = resolved ?? string.Empty;
                    }

                    rptPendingItems.DataSource = dt;
                    rptPendingItems.DataBind();
                }
            }
        }

        private void LoadClaimRequests()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                bool hasProofImageColumn = HasProofImageColumn(conn);
                string query = hasProofImageColumn
                    ? @"SELECT C.ClaimID, C.ItemID, I.Title AS ItemName, U.FullName AS ClaimerName,
                                 C.ProofDetails, C.ProofImagePath, C.ClaimDate FROM Claims C
                                 JOIN Items I ON C.ItemID = I.ItemID
                                 JOIN Users U ON C.ClaimantID = U.UserID ORDER BY C.ClaimDate DESC"
                    : @"SELECT C.ClaimID, C.ItemID, I.Title AS ItemName, U.FullName AS ClaimerName,
                                 C.ProofDetails, CAST(NULL AS NVARCHAR(500)) AS ProofImagePath, C.ClaimDate FROM Claims C
                                 JOIN Items I ON C.ItemID = I.ItemID
                                 JOIN Users U ON C.ClaimantID = U.UserID ORDER BY C.ClaimDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    foreach (DataRow row in dt.Rows)
                    {
                        var path = row["ProofImagePath"] as string;
                        var resolved = BlobStorageHelper.GetPublicUrl(path);
                        row["ProofImagePath"] = resolved ?? string.Empty;
                    }

                    rptClaims.DataSource = dt;
                    rptClaims.DataBind();
                }
            }
        }

        private void LoadInquiries()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT InquiryID, UserName, UserEmail, MessageContent, DateSent, Status FROM Inquiries ORDER BY Status DESC, DateSent DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    rptInquiries.DataSource = cmd.ExecuteReader();
                    rptInquiries.DataBind();
                }
            }
        }

        protected void rptPendingItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int itemID = Convert.ToInt32(e.CommandArgument);
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = e.CommandName == "Approve" ? "UPDATE Items SET Status = 'Published' WHERE ItemID = @ID" : "DELETE FROM Items WHERE ItemID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", itemID);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadData();
        }

        protected void rptClaims_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                if (e.CommandName == "ApproveClaim")
                {
                    string[] args = e.CommandArgument.ToString().Split('|');
                    string q1 = "UPDATE Items SET Status = 'Claimed' WHERE ItemID = @ItemID";
                    using (SqlCommand cmd = new SqlCommand(q1, conn)) { cmd.Parameters.AddWithValue("@ItemID", args[1]); cmd.ExecuteNonQuery(); }
                    string q2 = "DELETE FROM Claims WHERE ClaimID = @ClaimID";
                    using (SqlCommand cmd = new SqlCommand(q2, conn)) { cmd.Parameters.AddWithValue("@ClaimID", args[0]); cmd.ExecuteNonQuery(); }
                }
                else if (e.CommandName == "RejectClaim")
                {
                    string q3 = "DELETE FROM Claims WHERE ClaimID = @ClaimID";
                    using (SqlCommand cmd = new SqlCommand(q3, conn)) { cmd.Parameters.AddWithValue("@ClaimID", e.CommandArgument); cmd.ExecuteNonQuery(); }
                }
            }
            LoadData();
        }

        protected void rptInquiries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            string connStr = ConfigurationManager.ConnectionStrings["CabuyaoDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = e.CommandName == "MarkRead" ? "UPDATE Inquiries SET Status = 'Read' WHERE InquiryID = @ID" : "DELETE FROM Inquiries WHERE InquiryID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.ExecuteNonQuery();
                }
            }
            LoadData();
        }
    }
}
