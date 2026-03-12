<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="G5_FINAL_PROJECT.HomePage" %>

<<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cabuyao Lost & Found</title>
    <style>
        /* Reset and Full Screen Setup */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Hero Section with Faded Background */
.hero-section {
    /* The '../' tells the code to look inside your project folders */
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.8) 100%), 
                  url('images/CabuyaoCityHalljf7175_10.JPG'); 
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

 .hero-content h1.cabuyao-title {
    font-size: 7rem;
    font-weight: 900;
    margin-bottom: 0;
    background: -webkit-linear-gradient(#fff, #ccc); /* Subtle silver gradient on text */
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    filter: drop-shadow(0px 10px 10px rgba(0,0,0,0.5));
}

.cabuyao-subtitle {
    font-size: 1.4rem;
    font-weight: 300; /* Thin font */
    text-transform: uppercase;
    letter-spacing: 8px; /* High spacing for that luxury look */
    color: rgba(255,255,255,0.8);
    margin-top: 10px;
}

.continue-btn {
    margin-top: 40px;
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(8px);
    -webkit-backdrop-filter: blur(8px);
    border: 1px solid rgba(255, 255, 255, 0.4);
    border-radius: 100px; /* Modern pill shape */
    color: white;
    padding: 18px 80px;
    font-size: 1.1rem;
    font-weight: 600;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.continue-btn:hover {
    background: white;
    color: #1a1a1a;
    transform: scale(1.1);
    box-shadow: 0 15px 30px rgba(0,0,0,0.5);
}
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero-section">
            <div class="hero-content">
    <h1 class="cabuyao-title">CABUYAO CITY</h1>
    <p class="cabuyao-subtitle">Official Lost and Found Recovery Portal</p>
    <asp:Button ID="btnContinue" runat="server" Text="ENTER SYSTEM" 
        CssClass="continue-btn" OnClick="btnContinue_Click" />
</div>
        </div>
    </form>
</body>
</html>