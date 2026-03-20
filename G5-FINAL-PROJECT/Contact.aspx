<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="G5_FINAL_PROJECT.Contact" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Contact - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #d4a000;
            --text-dark: #333333;
            --text-light: #666666;
            --bg-light: #f9f9f9;
        }

        body, html {
            margin: 0; padding: 0; 
            font-family: 'Segoe UI', Arial, sans-serif; 
            background: linear-gradient(rgba(0, 104, 55, 0.78), rgba(0, 104, 55, 0.78)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: var(--text-dark);
        }

        .contact-hero {
            height: 220px; 
            text-align: center;
            padding-top: 35px; 
            color: white;
            box-sizing: border-box;
        }

        .contact-hero h1 {
            font-size: 3.5rem;
            font-weight: 900;
            letter-spacing: 2px;
            margin: 0;
            text-transform: uppercase;
        }

        .contact-container {
            max-width: 1200px;
            margin: -70px auto 60px auto; 
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            overflow: hidden; 
            position: relative;
            z-index: 5;
            min-height: 520px;
        }

        .form-section { padding: 50px; }
        .form-section h2 { margin-top: 0; color: var(--cabuyao-green); font-size: 1.8rem; margin-bottom: 25px; display: flex; align-items: center; gap: 10px; }

        .input-group { margin-bottom: 20px; }
        .input-control {
            width: 100%; padding: 15px; border: 1px solid #e0e0e0; border-radius: 6px;
            background: var(--bg-light); font-size: 1rem; font-family: inherit; box-sizing: border-box; transition: 0.3s;
        }
        .input-control:focus { outline: none; border-color: var(--cabuyao-green); background: white; box-shadow: 0 0 8px rgba(0, 104, 55, 0.1); }

        .btn-submit {
            background: var(--cabuyao-green); color: white; border: none; padding: 16px 30px;
            font-size: 1rem; font-weight: bold; border-radius: 6px; cursor: pointer; transition: 0.3s;
            display: inline-flex; align-items: center; gap: 10px; text-decoration: none; 
        }
        .btn-submit:hover { background: var(--cabuyao-yellow); color: var(--text-dark); transform: translateY(-2px); }

        .alert-success { background: #e6f4ea; color: #1e8e3e; padding: 15px; border-radius: 6px; margin-bottom: 20px; font-weight: bold; display: block; }

        .info-section { background: #f4f9f5; padding: 40px; border-left: 1px solid #eef2ef; display: flex; flex-direction: column; gap: 12px; }
        .info-item { display: flex; align-items: flex-start; margin-bottom: 35px; gap: 15px; }
        .info-icon { font-size: 1.5rem; color: var(--cabuyao-yellow); }
        .info-text h4 { margin: 0 0 5px 0; color: var(--cabuyao-green); font-size: 1.1rem; }
        .info-text p { margin: 0; color: var(--text-light); font-size: 0.95rem; line-height: 1.5; }

        .map-wrapper { flex: 1; width: 100%; min-height: 260px; background: #eee; border-radius: 12px; overflow: hidden; }
        .map-wrapper iframe { width: 100%; height: 100%; border: 0; }

        @media (max-width: 768px) {
            .contact-container { grid-template-columns: 1fr; margin: -50px 20px 40px 20px; }
            .info-section { border-left: none; border-top: 1px solid #eef2ef; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <header class="contact-hero">
            <h1>CONTACT US</h1>
        </header>

        <main class="contact-container">
            <div class="form-section">
                <h2> Get In Touch</h2>
                <asp:Label ID="lblSuccess" runat="server" CssClass="alert-success" Visible="false"></asp:Label>

                <div class="input-group">
                    <asp:TextBox ID="txtName" runat="server" CssClass="input-control" placeholder="Your Name"></asp:TextBox>
                </div>
                <div class="input-group">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-control" placeholder="Email Address"></asp:TextBox>

                    <!-- Ensures email is valid -->
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                        ErrorMessage="Invalid email format." ForeColor="Red" Display="Dynamic" />
                </div>
                <div class="input-group">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="input-control" placeholder="Write your message here..."></asp:TextBox>
                </div>
                
                <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn-submit" OnClick="btnSubmit_Click">
                    Send Message 
                </asp:LinkButton>
            </div>

            <div class="info-section">
                <div class="info-item">
                    <span class="info-icon"></span>
                    <div class="info-text">
                        <h4>Email Address</h4>
                        <p>support@cabuyaoportal.gov.ph<br />admin@cabuyaoportal.gov.ph</p>
                    </div>
                </div>
                <div class="info-item">
                    <span class="info-icon"></span>
                    <div class="info-text">
                        <h4>Phone Number</h4>
                        <p>(049) 534-2330<br />+63 912 345 6789</p>
                    </div>
                </div>
                <div class="info-item">
                    <span class="info-icon"></span>
                    <div class="info-text">
                        <h4>Office Location</h4>
                        <p>Cabuyao City Hall, F.B. Bailon Street,<br />Brgy. Sala, Cabuyao City, Laguna</p>
                    </div>
                </div>

                <div class="map-wrapper">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3865.5583562473853!2d121.12328247583685!3d14.279010484860012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d091397880d7%3A0x6b801087e5b263e7!2sCity%20Government%20of%20Cabuyao!5e0!3m2!1sen!2sph!4v1710000000000!5m2!1sen!2sph" 
                        loading="lazy">
                    </iframe>
                </div>
            </div>
        </main>

        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>
