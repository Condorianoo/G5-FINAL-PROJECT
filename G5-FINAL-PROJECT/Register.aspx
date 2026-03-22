<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="G5_FINAL_PROJECT.Register" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Create Account - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                        <h2>Create Account</h2>
                        
                        <div class="input-group">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="auth-input" placeholder="Your name"></asp:TextBox>

                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                                ControlToValidate="txtFullName" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="auth-input" placeholder="name@email.com"></asp:TextBox>

                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />

                            <!-- Makes sure the email is in a valid format -->
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                                ErrorMessage="Invalid email format." ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Create a password"></asp:TextBox>

                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="txtConfirm" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>

                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" 
                                ControlToValidate="txtConfirm" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />

                            <!-- Makes sure the passwords are the same -->
                            <asp:CompareValidator ID="cvPasswords" runat="server" 
                                ControlToCompare="txtPassword" ControlToValidate="txtConfirm" 
                                ErrorMessage=" Passwords do not match." ForeColor="Red" Display="Dynamic" />
                        </div>

                        <asp:Label ID="lblMessage" runat="server" ForeColor="#ff6b6b" Font-Bold="true"></asp:Label>
                        <br /><br />

                        <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-auth" OnClick="btnRegister_Click" />

                        <div class="switch-auth">
                            Already have an account? <a href="Login.aspx">Sign In</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="ctrlFooter" />
    </form>
</body>
</html>
