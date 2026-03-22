<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="G5_FINAL_PROJECT.Login" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - Cabuyao Portal</title>
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
            max-width: 460px;
        }

        .input-group {
            margin-bottom: 22px;
            text-align: left;
        }

        .show-pwd-container {
            margin-top: 8px;
            font-size: 0.85rem;
            color: white;
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function togglePassword() {
            var pwdBox = document.getElementById('<%= txtPassword.ClientID %>');
            var chk = document.getElementById('chkShow');
            if (chk.checked) {
                pwdBox.type = "text";
            } else {
                pwdBox.type = "password";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:Header runat="server" ID="ctrlHeader" />
            <div class="page-content auth-page">
                <div class="auth-wrapper">
                    <div class="glass-auth">
                        <h2>Sign In</h2>
                        
                        <div class="input-group">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="login-input" placeholder="name@email.com"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />

                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                                ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="login-input" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                            
                            <label class="show-pwd-container">
                                <input type="checkbox" id="chkShow" onclick="togglePassword()" /> Show Password
                            </label>

                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />
                                
                            <asp:Label ID="lblError" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label>
                        </div>

                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

                        <div class="switch-auth">
                            Don't have an account? <a href="Register.aspx">Create Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <uc:Footer runat="server" ID="ctrlFooter" />
    </form>
</body>
</html>
