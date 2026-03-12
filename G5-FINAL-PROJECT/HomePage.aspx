<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="G5_FINAL_PROJECT.HomePage" %>

<!DOCTYPE html>
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
            /* Make sure your image is in the images folder! */
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

        /* The Main Title - Exact Cabuyao Green */
        .hero-content h1.cabuyao-title {
            color: #006837; /* Cabuyao Green */
            font-size: 7rem;
            font-weight: 900;
            margin-bottom: 20px;
            letter-spacing: 8px;
            text-transform: uppercase;
            
            /* Since the background is dark, we add a solid white outline/glow 
               so the dark green text remains perfectly readable and pops out */
            -webkit-text-stroke: 2px white;
            text-shadow: 0px 0px 20px rgba(255, 255, 255, 0.6), 
                         4px 6px 15px rgba(0, 0, 0, 0.9);
            line-height: 1.1;
        }

        /* FIX: Readability for the Subtitle (The "Pill" Container) */
        .subtitle-container {
            background: rgba(0, 0, 0, 0.75); /* Very dark translucent background */
            display: inline-block;
            padding: 12px 35px;
            border-radius: 50px; /* Rounded pill shape */
            backdrop-filter: blur(8px); /* Frosty effect */
            border: 1px solid rgba(255, 215, 0, 0.4); /* Subtle Gold border */
            margin-bottom: 50px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.5);
        }

        .cabuyao-subtitle {
            color: #FFD700; /* Gold/Yellow text for high contrast */
            font-size: 1.4rem;
            font-weight: 400;
            text-transform: uppercase;
            letter-spacing: 5px;
            margin: 0; 
        }

        /* The Continue Button - Matching the Green theme */
        .continue-btn {
            background: rgba(0, 104, 55, 0.3); /* Translucent Green */
            backdrop-filter: blur(8px);
            border: 2px solid #006837; /* Solid Green Border */
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
            background: #006837; /* Solid Green on hover */
            color: white;
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 104, 55, 0.6);
            border-color: #FFD700; /* Yellow highlight on hover */
        }

        /* Mobile Responsiveness */
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