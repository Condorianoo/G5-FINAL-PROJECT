    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="G5_FINAL_PROJECT.Landing" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cabuyao Lost & Found</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        /* CSS RESET & FULL HEIGHT */
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden; /* Prevent horizontal scroll */
        }

        .page-shell {
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* HERO SECTION - FORCED FULL SCREEN */
        .hero-section {
            background-image: linear-gradient(rgba(0, 104, 55, 0.78), rgba(0, 104, 55, 0.78)), 
                              url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            width: 100vw;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            box-sizing: border-box;
            animation: fadeIn 1.2s ease-out; /* Smooth Fade-In */
        }

        .hero-content {
            width: min(960px, 90%);
            display: grid;
            gap: 28px;
        }

        /* TYPOGRAPHY */
        .cabuyao-title {
            color: #006837; 
            font-size: clamp(3rem, 10vw, 6rem);
            font-weight: 900;
            margin: 0;
            letter-spacing: clamp(3px, 1vw, 6px);
            text-transform: uppercase;
            -webkit-text-stroke: 2px white;
            text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.6), 
                         4px 6px 15px rgba(0, 0, 0, 0.9);
            line-height: 1.1;
        }

        .subtitle-container {
            background: rgba(0, 0, 0, 0.75); 
            display: inline-block;
            margin: 0 auto;
            padding: 12px 28px;
            border-radius: 50px; 
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 215, 0, 0.4);
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
        }

        .cabuyao-subtitle {
            color: #FFD700; 
            font-size: clamp(1rem, 3vw, 1.4rem);
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: clamp(2px, 1vw, 5px);
            margin: 0; 
        }

        /* BUTTON STYLE */
        .continue-btn {
            background: rgba(0, 104, 55, 0.3); 
            backdrop-filter: blur(8px);
            border: 2px solid #006837; 
            color: white;
            padding: 18px 52px;
            border-radius: 100px;
            font-size: clamp(1.05rem, 3vw, 1.35rem);
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-top: 10px;
        }

        .continue-btn:hover {
            background: #006837; 
            color: white;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 104, 55, 0.6);
            border-color: #FFD700; 
        }

        /* ANIMATIONS */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 700px) {
            .hero-content h1.cabuyao-title {
                -webkit-text-stroke: 1px white;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <div class="hero-section">
                <div class="hero-content">
                    <h1 class="cabuyao-title">CABUYAO CITY</h1>
                    
                    <div class="subtitle-container">
                        <p class="cabuyao-subtitle">Official Lost and Found Recovery Portal</p>
                    </div>

                    <div>
                        <asp:Button ID="btnContinue" runat="server" Text="ENTER SYSTEM" 
                            CssClass="continue-btn" OnClick="btnContinue_Click" />
                    </div>
                </div>
            </div>
            
            <uc:SiteFooter runat="server" ID="SiteFooter" />
        </div>
    </form>
</body>
</html>
