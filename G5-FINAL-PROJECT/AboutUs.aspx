<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="G5_FINAL_PROJECT.AboutUs" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About Us - Cabuyao Portal</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFC000; 
            --dark-overlay: rgba(0, 104, 55, 0.78); 
        }

        body, html {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Segoe UI', Arial, sans-serif; 
            background: linear-gradient(var(--dark-overlay), var(--dark-overlay)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover; 
            background-attachment: fixed;
            background-position: center;
            color: white;
        }

        .content-container {
            display: flex;
            justify-content: center;
            padding: 50px 5%;
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.05); 
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1); 
            border-radius: 15px;
            width: 100%;
            max-width: 1000px;
            padding: 50px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.5);
        }

        
        .dev-section-title {
            text-align: center;
            font-size: 2.2rem;
            font-weight: 900;
            letter-spacing: 2px;
            margin-top: 0;
            margin-bottom: 40px;
            text-transform: uppercase;
        }

        .dev-row {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-bottom: 25px;
            flex-wrap: wrap; 
        }

        
        .dev-card {
            background: #ffffff; 
            border: 1px solid rgba(0, 104, 55, 0.15); 
            border-radius: 12px;
            padding: 15px;
            width: 220px; 
            text-align: center;
            transition: 0.3s;
            color: #2f2f2f;
            box-shadow: 0 10px 25px rgba(0,0,0,0.18);
        }

        .dev-card:hover {
            transform: translateY(-5px);
            background: #f7f7f7;
        }

        .dev-image {
            width: 100%;
            aspect-ratio: 1 / 1; 
            object-fit: cover; 
            border-radius: 8px;
            margin-bottom: 15px;
            background-color: #333; 
        }

        .dev-name {
            color: #006837;
            font-size: 1.2rem;
            font-weight: 700;
            margin: 0 0 5px 0;
        }

        .dev-role {
            color: #8a7300;
            font-size: 0.85rem;
            font-weight: bold;
            text-transform: uppercase;
            margin: 0 0 10px 0;
            letter-spacing: 1px;
        }

        .dev-bio {
            color: #444444;
            font-size: 0.85rem;
            line-height: 1.4;
            margin: 0;
        }

        
        .about-section {
            margin-top: 60px;
            padding-top: 40px;
            border-top: 1px solid rgba(255, 255, 255, 0.1); 
        }

        .page-title {
            font-size: 2.8rem;
            font-weight: 900; 
            letter-spacing: 2px;
            margin: 0 0 15px 0;
            text-transform: uppercase;
        }

        .text-yellow {
            color: var(--cabuyao-yellow);
        }

        .divider-line {
            height: 1px;
            background-color: rgba(255, 255, 255, 0.2); 
            margin-bottom: 25px;
        }

        .lead-text {
            font-size: 1.2rem;
            color: var(--cabuyao-yellow);
            font-weight: 600;
            margin-bottom: 40px;
            letter-spacing: 0.5px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
        }

        .info-box h3 {
            color: white;
            font-size: 1.5rem;
            font-weight: 800;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-box p {
            color: rgba(255, 255, 255, 0.85); 
            line-height: 1.8;
            font-size: 1.05rem;
            margin: 0;
        }

        
        @media (max-width: 850px) {
            .info-grid { grid-template-columns: 1fr; gap: 30px;}
            .dev-card { width: 40%; } 
        }
        @media (max-width: 500px) {
            .dev-card { width: 100%; } 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:SiteHeader runat="server" ID="SiteHeader" />
            <div class="page-content">
        <div class="content-container">
            <div class="glass-panel">
                
                <h2 class="dev-section-title">Meet <span class="text-yellow">The Developers</span></h2>
                
                <div class="dev-row">
                    <div class="dev-card">
                        <img src="images/Quennu.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Quennu Pastrana</h4>
                        <p class="dev-role">Lead Backend</p>
                        <p class="dev-bio">Sobrang Pogi </p>
                    </div>

                    <div class="dev-card">
                        <img src="images/Dwight.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Dwight Reyes</h4>
                        <p class="dev-role">Frontend Design</p>
                        <p class="dev-bio">Panay and Legend Of Zelda Tears Of The Kingdom</p>
                    </div>

                    <div class="dev-card">
                        <img src="images/Aeron.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Aeron Rivera</h4>
                        <p class="dev-role">Database Admin</p>
                        <p class="dev-bio">Panay ang Valorant</p>
                    </div>
                </div>

                <div class="dev-row">
                    <div class="dev-card">
                        <img src="images/Dom.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Kyle Dom</h4>
                        <p class="dev-role">System Analyst</p>
                        <p class="dev-bio">Mayaman pede kayo umutang dito</p>
                    </div>

                    <div class="dev-card">
                        <img src="images/Babiera.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Fitzgerald Babiera</h4>
                        <p class="dev-role">Project Manager</p>
                        <p class="dev-bio">Gundam addict na broke, Valorant addict na hardstuck Bronze 😔🥀</p>
                    </div>
                </div>

                <div class="about-section">
                    <h1 class="page-title">ABOUT <span class="text-yellow">THE PORTAL</span></h1>
                    
                    <div class="divider-line"></div>
                    
                    <p class="lead-text">A centralized digital initiative serving the citizens of Cabuyao City.</p>
                    
                    <div class="info-grid">
                        <div class="info-box">
                            <h3>&#128161; Our Mission</h3>
                            <p>To provide a secure, efficient, and accessible platform for reporting and recovering lost items within the Cabuyao community. We aim to foster honesty, unity, and technological advancement among our citizens by making public services completely digital.</p>
                        </div>
                        <div class="info-box">
                            <h3>&#9881; How It Works</h3>
                            <p>Citizens can seamlessly browse our real-time database for their missing belongings or submit a report for items they have found. The system is securely managed by local administrators to ensure safe and proper turn-overs of all physical items.</p>
                        </div>
                    </div>
                </div>

            </div>
            </div>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>



