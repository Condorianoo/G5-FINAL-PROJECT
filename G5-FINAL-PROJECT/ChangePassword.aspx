<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="G5_FINAL_PROJECT.ChangePassword" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Change Password - Cabuyao Portal</title>
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <link rel="stylesheet" type="text/css" href="styles/forms.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 104, 55, 0.78);
        }

        body {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        .glass-auth {
            max-width: 520px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:Header runat="server" ID="ctrlHeader" />
            <div class="page-content auth-page">
                <div class="auth-wrapper">
                    <div class="glass-auth">
                        <h2>Change Password</h2>

                        <div class="input-group">
                            <label>New Password</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Enter a new password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
                                ControlToValidate="txtNewPassword" ErrorMessage="* Required"
                                ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Confirm New Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConfirm" runat="server"
                                ControlToValidate="txtConfirmPassword" ErrorMessage="* Required"
                                ForeColor="Red" Display="Dynamic" />
                            <asp:CompareValidator ID="cvMatch" runat="server"
                                ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"
                                ErrorMessage="Passwords do not match." ForeColor="Red" Display="Dynamic" />
                        </div>

                        <asp:Label ID="lblMessage" runat="server" ForeColor="#ff6b6b" Font-Bold="true"></asp:Label>
                        <br /><br />

                        <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" CssClass="btn-auth" OnClick="btnChangePassword_Click" />

                        <div class="switch-auth">
                            Remembered your password? <a href="Menu.aspx">Return to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="ctrlFooter" />
    </form>
</body>
</html>
