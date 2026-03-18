<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="G5_FINAL_PROJECT.Register" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/SiteFooter.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Create Account - Cabuyao Portal</title>
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

        /* Auth page override to prevent white outline from scaled layout */
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
            max-width: 520px;
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
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            font-size: 0.9rem;
            color: rgba(255,255,255,0.85);
        }

        .auth-input {
            width: 100%;
            padding: 14px;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.95);
            color: #333;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .btn-auth {
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

        .btn-auth:hover {
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
                        <h2>Create Account</h2>
                        
                        <div class="input-group">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="auth-input" placeholder="Your name"></asp:TextBox>
                        </div>

                        <div class="input-group">
                            <label>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="auth-input" placeholder="name@email.com"></asp:TextBox>
                        </div>

                        <div class="input-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Create a password"></asp:TextBox>
                        </div>

                        <div class="input-group">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="txtConfirm" runat="server" CssClass="auth-input" TextMode="Password" placeholder="Re-enter password"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-auth" />

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
