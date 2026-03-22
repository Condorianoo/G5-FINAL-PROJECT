<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageNews.aspx.cs" Inherits="G5_FINAL_PROJECT.ManageNews" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage News - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
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
            color: white;
        }

        .manage-container {
            width: 90%;
            max-width: 1000px;
            margin: 100px auto 60px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
            color: #333;
        }

        .manage-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .manage-table th {
            background-color: var(--cabuyao-green);
            color: white;
            padding: 15px;
            text-align: left;
            text-transform: uppercase;
            font-size: 0.85rem;
        }

        .manage-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-delete:hover { background-color: #a71d2a; transform: scale(1.05); }
        
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: var(--cabuyao-green);
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <div class="manage-container">
            <a href="NewsEvents.aspx" class="back-link"> Back to News Feed</a>
            <h2 style="color: var(--cabuyao-green); border-bottom: 3px solid var(--cabuyao-yellow); padding-bottom: 10px;">
                Manage News Articles
            </h2>
            
            <asp:Label ID="lblStatus" runat="server" style="display:block; margin-top:10px; font-weight:bold;"></asp:Label>

            <table class="manage-table">
                <thead>
                    <tr>
                        <th style="width: 20%;">Date</th>
                        <th style="width: 50%;">Headline</th>
                        <th style="width: 30%;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptManageNews" runat="server" OnItemCommand="rptManageNews_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PublishDate", "{0:MMM dd, yyyy}") %></td>
                                <td style="font-weight: bold;"><%# Eval("Title") %></td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete Article" 
                                        CssClass="btn-delete" 
                                        CommandName="DeleteNews" 
                                        CommandArgument='<%# Eval("NewsID") %>' 
                                        OnClientClick="return confirm('Are you sure you want to permanently delete this article?');" />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>

            <% if (rptManageNews.Items.Count == 0) { %>
                <p style="text-align:center; padding: 40px; color: #999;">No articles found.</p>
            <% } %>
        </div>

        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>
