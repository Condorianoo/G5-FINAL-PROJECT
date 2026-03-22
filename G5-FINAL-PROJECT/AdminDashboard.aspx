<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="G5_FINAL_PROJECT.AdminDashboard" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <link rel="stylesheet" type="text/css" href="styles/image-viewer.css" />
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

        .table-wrapper { width: 100%; overflow-x: auto; }
        .admin-table { width: 100%; min-width: 900px; border-collapse: collapse; margin-top: 25px; color: #333; display: table; table-layout: fixed; }
        .admin-table th { background-color: var(--cabuyao-green); color: white; padding: 18px 15px; text-align: left; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px; }
        .admin-table td { padding: 15px; border-bottom: 1px solid #eee; font-size: 0.95rem; line-height: 1.4; word-break: break-word; vertical-align: middle; }
        .admin-table tr:hover td { background-color: #fcfcfc; }
        .item-preview-cell { width: 120px; }
        .item-preview-img {
            width: 88px;
            height: 88px;
            object-fit: cover;
            display: block;
            border-radius: 12px;
            border: 2px solid rgba(0, 104, 55, 0.18);
            background: #f3f3f3;
        }
        .item-preview-fallback {
            width: 88px;
            height: 88px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #f3f3f3;
            color: #888;
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            text-align: center;
            padding: 8px;
            box-sizing: border-box;
        }
        .proofs-cell { min-width: 260px; }
        .proofs-layout {
            display: grid;
            grid-template-columns: 88px 1fr;
            gap: 14px;
            align-items: center;
        }
        .proofs-text {
            font-size: 0.85rem;
            color: #444;
            line-height: 1.5;
            white-space: pre-wrap;
            word-break: break-word;
        }

        .btn-approve { background-color: #28a745; color: white; border: none; padding: 8px 15px; border-radius: 8px; cursor: pointer; font-weight: bold; }
        .btn-reject { background-color: #dc3545; color: white; border: none; padding: 8px 15px; border-radius: 8px; cursor: pointer; font-weight: bold; }
        .actions-cell { display: flex; justify-content: center; align-items: center; gap: 10px; flex-wrap: wrap; min-height: 44px; }
        .actions-cell .btn-approve, .actions-cell .btn-reject { min-width: 110px; text-align: center; }
        .actions-header { text-align: center; }
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
            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th style="width: 12%;">Type</th><th style="width: 23%;">Item Title</th><th style="width: 15%;">Image</th><th style="width: 30%;">Description</th><th class="actions-header" style="width: 20%;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptPendingItems" runat="server" OnItemCommand="rptPendingItems_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><span style="background: #e8f5e9; color: #2e7d32; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: bold;"><%# Eval("Type") %></span></td>
                                    <td style="font-weight: 700; color: #006837;"><%# Eval("Title") %></td>
                                    <td class="item-preview-cell">
                                        <%# string.IsNullOrEmpty(Convert.ToString(Eval("ImagePath")))
                                            ? "<div class='item-preview-fallback'>No Image</div>"
                                            : "<img src='" + Eval("ImagePath") + "' alt='Item image' class='item-preview-img zoomable-image' data-viewer='true' />" %>
                                    </td>
                                    <td style="color: #666;"><%# Eval("Description") %></td>
                                    <td class="actions-cell">
                                        <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="btn-approve" CommandName="Approve" CommandArgument='<%# Eval("ItemID") %>' />
                                        <asp:Button ID="btnReject" runat="server" Text="Delete" CssClass="btn-reject" CommandName="Reject" CommandArgument='<%# Eval("ItemID") %>' OnClientClick="return confirm('Delete this report?');" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <h2 class="section-title" style="color: #0056b3;">User Claim Requests</h2>
            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th style="width: 15%;">Claimant</th><th style="width: 15%;">Item</th><th style="width: 40%;">Proofs Provided</th><th style="width: 10%;">Date Sent</th><th class="actions-header" style="width: 20%;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptClaims" runat="server" OnItemCommand="rptClaims_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td style="font-weight: bold;"><%# Eval("ClaimerName") %></td>
                                    <td style="color: #006837;"><%# Eval("ItemName") %></td>
                                    <td class="proofs-cell">
                                        <div class="proofs-layout">
                                            <%# string.IsNullOrEmpty(Convert.ToString(Eval("ProofImagePath")))
                                                ? "<div class='item-preview-fallback'>No Image</div>"
                                                : "<img src='" + Eval("ProofImagePath") + "' alt='Proof image' class='item-preview-img zoomable-image' data-viewer='true' />" %>
                                            <div class="proofs-text"><%# Eval("ProofDetails") %></div>
                                        </div>
                                    </td>
                                    <td style="font-size: 0.8rem;"><%# Eval("ClaimDate", "{0:MMM dd, yyyy}") %></td>
                                    <td class="actions-cell">
                                        <asp:Button ID="btnApproveClaim" runat="server" Text="Approve" CssClass="btn-approve" CommandName="ApproveClaim" CommandArgument='<%# Eval("ClaimID") + "|" + Eval("ItemID") %>' />
                                        <asp:Button ID="btnRejectClaim" runat="server" Text="Reject" CssClass="btn-reject" CommandName="RejectClaim" CommandArgument='<%# Eval("ClaimID") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <h2 class="section-title" style="color: #6f42c1; border-bottom: 3px solid #e0cffc;">User Inquiries (Contact Form)</h2>
            <div class="table-wrapper">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th style="width: 20%;">Sender</th><th style="width: 20%;">Email</th><th style="width: 40%;">Message</th><th class="actions-header" style="width: 20%;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptInquiries" runat="server" OnItemCommand="rptInquiries_ItemCommand">
                            <ItemTemplate>
                                <tr style='<%# Eval("Status").ToString() == "Unread" ? "background-color: #fff9db;" : "" %>'>
                                    <td><strong><%# Eval("UserName") %></strong><br /><small><%# Eval("DateSent", "{0:MMM dd, HH:mm}") %></small></td>
                                    <td><%# Eval("UserEmail") %></td>
                                    <td style="font-size: 0.9rem;"><%# Eval("MessageContent") %></td>
                                    <td class="actions-cell">
                                        <asp:Button ID="btnRead" runat="server" Text="Mark Read" CssClass="btn-approve" CommandName="MarkRead" CommandArgument='<%# Eval("InquiryID") %>' Visible='<%# Eval("Status").ToString() == "Unread" %>' />
                                        <asp:Button ID="btnDeleteInquiry" runat="server" Text="Delete" CssClass="btn-reject" CommandName="DeleteInquiry" CommandArgument='<%# Eval("InquiryID") %>' OnClientClick="return confirm('Delete message?');" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
    <script src="scripts/image-viewer.js"></script>
</body>
</html>
