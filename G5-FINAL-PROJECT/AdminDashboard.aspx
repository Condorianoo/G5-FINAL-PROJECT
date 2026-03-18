<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="G5_FINAL_PROJECT.AdminDashboard" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard - Cabuyao Portal</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
        }

        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(rgba(0, 104, 55, 0.78), rgba(0, 104, 55, 0.78)), url('images/CabuyaoCityHalljf7175_10.JPG') center/cover fixed;
        }

        .dashboard-container {
            width: 95%; max-width: 1200px; margin: 100px auto 60px auto; 
            background: rgba(255, 255, 255, 0.95); padding: 40px; border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4); box-sizing: border-box;
        }

        .admin-table { width: 100%; border-collapse: collapse; margin-top: 25px; color: #333; }
        .admin-table th { background-color: var(--cabuyao-green); color: white; padding: 18px 15px; text-align: left; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px; }
        .admin-table td { padding: 15px; border-bottom: 1px solid #eee; font-size: 0.95rem; line-height: 1.4; }
        .admin-table tr:hover td { background-color: #fcfcfc; }

        .btn-approve { background-color: #28a745; color: white; border: none; padding: 8px 15px; border-radius: 8px; cursor: pointer; font-weight: bold; }
        .btn-reject { background-color: #dc3545; color: white; border: none; padding: 8px 15px; border-radius: 8px; cursor: pointer; font-weight: bold; }
        .status-msg { display: block; margin-bottom: 20px; padding: 10px; border-radius: 5px; font-weight: bold; text-align: center; }

        .section-title { color: var(--cabuyao-green); border-bottom: 3px solid var(--cabuyao-yellow); padding-bottom: 15px; margin-top: 40px; font-weight: 800; }
        .section-title:first-child { margin-top: 0; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <div class="dashboard-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="status-msg"></asp:Label>

            <h2 class="section-title">New Item Reports (Pending Approval)</h2>
            <table class="admin-table">
                <thead>
                    <tr>
                        <th style="width: 15%;">Type</th><th style="width: 25%;">Item Title</th><th style="width: 40%;">Description</th><th style="width: 20%;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptPendingItems" runat="server" OnItemCommand="rptPendingItems_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><span style="background: #e8f5e9; color: #2e7d32; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: bold;"><%# Eval("Type") %></span></td>
                                <td style="font-weight: 700; color: #006837;"><%# Eval("Title") %></td>
                                <td style="color: #666;"><%# Eval("Description") %></td>
                                <td>
                                    <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn-approve" CommandName="Approve" CommandArgument='<%# Eval("ItemID") %>' />
                                    <asp:Button ID="btnReject" runat="server" Text="Delete" CssClass="btn-reject" CommandName="Reject" CommandArgument='<%# Eval("ItemID") %>' OnClientClick="return confirm('Delete this report?');" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <h2 class="section-title" style="color: #0056b3;">User Claim Requests</h2>
            <table class="admin-table">
                <thead>
                    <tr>
                        <th style="width: 15%;">Claimant</th><th style="width: 15%;">Item</th><th style="width: 40%;">Proof Provided</th><th style="width: 10%;">Date Sent</th><th style="width: 20%;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptClaims" runat="server" OnItemCommand="rptClaims_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td style="font-weight: bold;"><%# Eval("ClaimerName") %></td>
                                <td style="color: #006837;"><%# Eval("ItemName") %></td>
                                <td style="font-size: 0.85rem; color: #444;"><%# Eval("ProofDetails") %></td>
                                <td style="font-size: 0.8rem;"><%# Eval("ClaimDate", "{0:MMM dd, yyyy}") %></td>
                                <td>
                                    <asp:Button ID="btnApproveClaim" runat="server" Text="Approve" CssClass="btn-approve" CommandName="ApproveClaim" CommandArgument='<%# Eval("ClaimID") + "|" + Eval("ItemID") %>' />
                                    <asp:Button ID="btnRejectClaim" runat="server" Text="Reject" CssClass="btn-reject" CommandName="RejectClaim" CommandArgument='<%# Eval("ClaimID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <h2 class="section-title" style="color: #6f42c1; border-bottom: 3px solid #e0cffc;">User Inquiries (Contact Form)</h2>
            <table class="admin-table">
                <thead>
                    <tr>
                        <th style="width: 20%;">Sender</th><th style="width: 20%;">Email</th><th style="width: 40%;">Message</th><th style="width: 20%;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptInquiries" runat="server" OnItemCommand="rptInquiries_ItemCommand">
                        <ItemTemplate>
                            <tr style='<%# Eval("Status").ToString() == "Unread" ? "background-color: #fff9db;" : "" %>'>
                                <td><strong><%# Eval("UserName") %></strong><br /><small><%# Eval("DateSent", "{0:MMM dd, HH:mm}") %></small></td>
                                <td><%# Eval("UserEmail") %></td>
                                <td style="font-size: 0.9rem;"><%# Eval("MessageContent") %></td>
                                <td>
                                    <asp:Button ID="btnRead" runat="server" Text="Mark Read" CssClass="btn-approve" CommandName="MarkRead" CommandArgument='<%# Eval("InquiryID") %>' Visible='<%# Eval("Status").ToString() == "Unread" %>' />
                                    <asp:Button ID="btnDeleteInquiry" runat="server" Text="Delete" CssClass="btn-reject" CommandName="DeleteInquiry" CommandArgument='<%# Eval("InquiryID") %>' OnClientClick="return confirm('Delete message?');" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>
