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
    background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                      url('images/CabuyaoCityHalljf7175_10.JPG'); 
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

        /* Text Styling */
        .hero-content h1 {
            color: white;
            font-size: 4rem;
            font-weight: bold;
            letter-spacing: 4px;
            text-transform: uppercase;
            text-shadow: 2px 4px 10px rgba(0, 0, 0, 0.8);
            margin-bottom: 40px;
        }

        /* The Continue Button */
        .continue-btn {
            background-color: transparent;
            color: white;
            border: 2px solid white;
            padding: 15px 50px;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
        }

        .continue-btn:hover {
            background-color: #1877F2; /* Your FB Blue from the screenshot */
            border-color: #1877F2;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .cabuyao-subtitle {
    color: rgba(255, 255, 255, 0.9);
    font-size: 1.5rem;
    margin-bottom: 30px;
    letter-spacing: 2px;
    font-style: italic;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
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