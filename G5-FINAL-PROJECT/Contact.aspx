<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="G5_FINAL_PROJECT.Contact" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Contact - Cabuyao Portal</title>
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
            background: #ffffff; 
            color: var(--text-dark);
        }
/* --- HERO HEADER SECTION --- */
        .contact-hero {
            background: linear-gradient(rgba(0, 104, 55, 0.85), rgba(0, 104, 55, 0.9)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover;
            background-position: center;
            height: 300px; 
            text-align: center;
            padding-top: 70px; 
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
            max-width: 1000px;
            margin: -100px auto -60px auto; 
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
            display: flex;
            overflow: hidden; 
            position: relative;
            z-index: 5;
        }


        .form-section {
            flex: 3; 
            padding: 50px;
        }

        .form-section h2 {
            margin-top: 0;
            color: var(--cabuyao-green);
            font-size: 1.8rem;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-control {
            width: 100%;
            padding: 15px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            background: var(--bg-light);
            font-size: 1rem;
            font-family: inherit;
            box-sizing: border-box;
            transition: 0.3s;
        }

        .input-control:focus {
            outline: none;
            border-color: var(--cabuyao-green);
            background: white;
            box-shadow: 0 0 8px rgba(0, 104, 55, 0.1);
        }


        .btn-submit {
            background: var(--cabuyao-green);
            color: white;
            border: none;
            padding: 16px 30px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none; 
        }

        .btn-submit:hover {
            background: var(--cabuyao-yellow);
            color: var(--text-dark);
            transform: translateY(-2px);
        }

        .alert-success {
            background: #e6f4ea;
            color: #1e8e3e;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-weight: bold;
            display: block;
        }

        .info-section {
            flex: 2; 
            background: #f4f9f5; 
            padding: 50px;
            border-left: 1px solid #eef2ef;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 35px;
            gap: 15px;
        }

        .info-icon {
            font-size: 1.5rem;
            color: var(--cabuyao-yellow);
        }

        .info-text h4 {
            margin: 0 0 5px 0;
            color: var(--cabuyao-green);
            font-size: 1.1rem;
        }

        .info-text p {
            margin: 0;
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.5;
        }

        /* --- MAP SECTION --- */
        .map-wrapper {
            width: 100%;
            height: 450px; 
            background: #eee;
            position: relative;
            z-index: 1; 
        }

        @media (max-width: 768px) {
            .contact-container { flex-direction: column; margin: -50px 20px -30px 20px; }
            .form-section, .info-section { padding: 30px; }
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
                <h2>&#128172; Get In Touch</h2>
                
                <asp:Label ID="lblSuccess" runat="server" CssClass="alert-success" Visible="false"></asp:Label>

                <div class="input-group">
                    <asp:TextBox ID="txtName" runat="server" CssClass="input-control" placeholder="Your Name" Required="true"></asp:TextBox>
                </div>
                <div class="input-group">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-control" placeholder="Email Address" Required="true"></asp:TextBox>
                </div>
                <div class="input-group">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="input-control" placeholder="Write your message here..." Required="true"></asp:TextBox>
                </div>
                
                <asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn-submit" OnClick="btnSubmit_Click">
                    Send Message &#10148;
                </asp:LinkButton>
            </div>

            <div class="info-section">
                <div class="info-item">
                    <span class="info-icon">&#9993;</span>
                    <div class="info-text">
                        <h4>Email Address</h4>
                        <p>support@cabuyaoportal.gov.ph<br />admin@cabuyaoportal.gov.ph</p>
                    </div>
                </div>
                <div class="info-item">
                    <span class="info-icon">&#128222;</span>
                    <div class="info-text">
                        <h4>Phone Number</h4>
                        <p>(049) 534-2330<br />+63 912 345 6789</p>
                    </div>
                </div>
                <div class="info-item">
                    <span class="info-icon">&#128205;</span>
                    <div class="info-text">
                        <h4>Office Location</h4>
                        <p>Cabuyao City Hall, F.B. Bailon Street,<br />Brgy. Sala, Cabuyao City, Laguna</p>
                    </div>
                </div>
            </div>
        </main>

        <div class="map-wrapper">
            <iframe 
                src="https://maps.google.com/maps?q=Cabuyao%20City%20Hall,%20Laguna&t=&z=16&ie=UTF8&iwloc=&output=embed"" 
                width="100%" 
                height="100%" 
                style="border:0;" 
                allowfullscreen="" 
                loading="lazy">
            </iframe>
        </div>
    </form>
</body>
</html>


