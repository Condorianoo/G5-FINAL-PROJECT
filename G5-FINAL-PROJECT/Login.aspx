<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="G5_FINAL_PROJECT.Login" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Login - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 104, 55, 0.78);
        }

        body, .auth-wrapper, .glass-auth {
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        
        .auth-page {
            transform: none !important;
            max-width: 100% !important;
            width: 100% !important;
            background: linear-gradient(var(--dark-overlay), var(--dark-overlay)), url('images/CabuyaoCityHalljf7175_10.JPG') !important;
            background-size: cover !important;
            background-attachment: fixed !important;
            background-position: center !important;
        }

        .auth-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 60px 20px;
        }

        .glass-auth {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: none;
            border-radius: 30px;
            width: 100%;
            max-width: 460px;
            padding: 48px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
            text-align: center;
            color: #fff;
        }

        .glass-auth h2 {
            color: var(--cabuyao-yellow);
            font-size: 2.2rem;
            margin-bottom: 30px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .input-group {
            margin-bottom: 22px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            color: rgba(255,255,255,0.85);
        }

        .login-input {
            width: 100%;
            padding: 14px;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.95);
            color: #333;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .btn-login {
            width: 100%;
            background: var(--cabuyao-green);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 10px;
        }

        .btn-login:hover {
            background: #008a49;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 104, 55, 0.4);
            border: 1px solid var(--cabuyao-yellow);
        }

        .switch-auth {
            margin-top: 22px;
            font-size: 0.92rem;
            color: rgba(255,255,255,0.75);
        }

        .switch-auth a {
            color: var(--cabuyao-yellow);
            text-decoration: none;
            font-weight: 700;
        }

        .switch-auth a:hover {
            text-decoration: underline;
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
                        <h2>Sign In</h2>
                        
                        <div class="input-group">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="login-input" placeholder="name@email.com"></asp:TextBox>
                            
                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />

                            <!-- Checks if email in correct format -->
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                                ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" />
                        </div>

                        <div class="input-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="login-input" TextMode="Password" placeholder=""></asp:TextBox>

                            <!-- Makes sure there's an input -->
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="* Required" 
                                ForeColor="Red" Display="Dynamic" />
                                
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
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

