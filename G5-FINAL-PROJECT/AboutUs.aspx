<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="G5_FINAL_PROJECT.AboutUs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About Us - Cabuyao Portal</title>
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFC000; 
            --dark-overlay: rgba(0, 0, 0, 0.85); 
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

      
        .mcl-nav {
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5%;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
            border-bottom: 4px solid var(--cabuyao-yellow); 
        }
        
        .logo-container {
            display: flex; align-items: center; gap: 15px;
        }

        .cabuyao-logo {
            height: 50px; width: auto;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
        }

        .nav-links {
            display: flex; align-items: center;
        }

        .nav-links a {
            text-decoration: none; color: var(--cabuyao-green);
            font-weight: 700; margin-left: 30px; font-size: 0.85rem;
            text-transform: uppercase; padding-bottom: 5px; transition: 0.3s;
        }
        
        .nav-links a.active { border-bottom: 3px solid var(--cabuyao-green); }
        .nav-links a:hover { color: var(--cabuyao-yellow); }

        /* Main Content Container */
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

        /* --- DEVELOPERS SECTION --- */
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
            background: rgba(0, 0, 0, 0.4); 
            border: 1px solid rgba(255, 255, 255, 0.1); 
            border-radius: 12px;
            padding: 15px;
            width: 220px; 
            text-align: center;
            transition: 0.3s;
        }

        .dev-card:hover {
            transform: translateY(-5px);
            background: rgba(0, 0, 0, 0.6);
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
            color: var(--cabuyao-yellow);
            font-size: 1.2rem;
            font-weight: 700;
            margin: 0 0 5px 0;
        }

        .dev-role {
            color: white;
            font-size: 0.85rem;
            font-weight: bold;
            text-transform: uppercase;
            margin: 0 0 10px 0;
            letter-spacing: 1px;
        }

        .dev-bio {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.85rem;
            line-height: 1.4;
            margin: 0;
        }

        /* --- ABOUT THE PORTAL SECTION --- */
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
        <nav class="mcl-nav">
            <div class="logo-container">
                <img src="images/Cabuyao_Logo.png" alt="Cabuyao Logo" class="cabuyao-logo" />
                <h2 style="color: var(--cabuyao-green); margin:0; letter-spacing:1px; font-weight: 900;">
                    CABUYAO <span style="color: #8a7300;">PORTAL</span>
                </h2>
            </div>
            
            <div class="nav-links">
                <a href="SecondPage.aspx">Home</a>
                <a href="NewsEvents.aspx">News</a>
                <a href="AboutUs.aspx" class="active">About Us</a>
                <a href="Contact.aspx">Contact</a>
            </div>
        </nav>

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
                        <img src="images/Barbiera.jpg" alt="Developer" class="dev-image" />
                        <h4 class="dev-name">Fitzgerald Babiera</h4>
                        <p class="dev-role">Project Manager</p>
                        <p class="dev-bio">Sorry wala ako masyado alam sayo -Quennu</p>
                    </div>
                </div>

                <div class="about-section">
                    <h1 class="page-title">ABOUT <span class="text-yellow">THE PORTAL</span></h1>
                    
                    <div class="divider-line"></div>
                    
                    <p class="lead-text">A centralized digital initiative serving the citizens of Cabuyao City.</p>
                    
                    <div class="info-grid">
                        <div class="info-box">
                            <h3>🎯 Our Mission</h3>
                            <p>To provide a secure, efficient, and accessible platform for reporting and recovering lost items within the Cabuyao community. We aim to foster honesty, unity, and technological advancement among our citizens by making public services completely digital.</p>
                        </div>
                        <div class="info-box">
                            <h3>⚙️ How It Works</h3>
                            <p>Citizens can seamlessly browse our real-time database for their missing belongings or submit a report for items they have found. The system is securely managed by local administrators to ensure safe and proper turn-overs of all physical items.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>