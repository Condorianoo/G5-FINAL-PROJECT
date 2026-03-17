<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="G5_FINAL_PROJECT.HomePage" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cabuyao Lost & Found</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        
        .hero-section {
            background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)), 
                              url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-content {
            text-align: center;
            max-width: 90%;
            padding: 0 20px;
        }

        .hero-content h1.cabuyao-title {
            color: #006837; 
            font-size: 7rem;
            font-weight: 900;
            margin-bottom: 20px;
            letter-spacing: 8px;
            text-transform: uppercase;
            -webkit-text-stroke: 2px white;
            text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.6), 
                         4px 6px 15px rgba(0, 0, 0, 0.9);
            line-height: 1.1;
        }


        .subtitle-container {
            background: rgba(0, 0, 0, 0.75); 
            display: inline-block;
            padding: 12px 35px;
            border-radius: 50px; 
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 215, 0, 0.4);
            margin-bottom: 50px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
        }

        .cabuyao-subtitle {
            color: #FFD700; 
            font-size: 1.4rem;
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: 5px;
            margin: 0; 
        }

        
        .continue-btn {
            background: rgba(0, 104, 55, 0.3); 
            backdrop-filter: blur(8px);
            border: 2px solid #006837; 
            color: white;
            padding: 18px 80px;
            border-radius: 100px;
            font-size: 1.5rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 3px;
        }

        .continue-btn:hover {
            background: #006837; 
            color: white;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 104, 55, 0.6);
            border-color: #FFD700; 
        }

       
        @media screen and (max-width: 600px) {
            .hero-content h1.cabuyao-title {
                font-size: 4rem;
                -webkit-text-stroke: 1px white;
            }
            .cabuyao-subtitle {
                font-size: 0.9rem;
            }
            .continue-btn {
                padding: 15px 40px;
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        <div class="hero-section">
            <div class="hero-content">
                <h1 class="cabuyao-title">CABUYAO CITY</h1>
                
                <div class="subtitle-container">
                    <p class="cabuyao-subtitle">Official Lost and Found Recovery Portal</p>
                </div>
                <br />
                <asp:Button ID="btnContinue" runat="server" Text="ENTER SYSTEM" 
                    CssClass="continue-btn" OnClick="btnContinue_Click" />
            </div>
        </div>
    </form>
</body>
</html>


