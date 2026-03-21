<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="G5_FINAL_PROJECT.AboutUs" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>About Us - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        * {
            text-align: center;
        }

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
        }

        .info-box p { 
            color: rgba(255, 255, 255, 0.85); 
            line-height: 1.8; 
            font-size: 1.05rem; 
            margin: 0; 
        }

        .map-section { 
            margin: 40px 0; 
            width: 100%; 
        }

        .map-section iframe { 
            width: 100%; 
            height: 400px; 
            border-radius: 12px; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.25); 
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
            border-radius: 12px; 
            padding: 15px; 
            width: 220px; 
            text-align: center; 
            color: #2f2f2f; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.18);
        }

        .dev-image { 
            width: 100%; 
            aspect-ratio: 1/1; 
            object-fit: cover; 
            border-radius: 8px; 
            margin-bottom: 15px; 
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
        }

        .dev-bio { 
            color: #444;
            font-size: 0.85rem; 
            line-height: 1.4; 
            margin: 0; 
        }

        @media (max-width: 850px) { .info-grid { grid-template-columns: 1fr; gap: 30px; } .dev-card { width: 40%; } }
        @media (max-width: 500px) { .dev-card { width: 100%; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:SiteHeader runat="server" ID="SiteHeader" />
            <div class="page-content">
                <div class="content-container">
                    <div class="glass-panel">

                        <!-- Section 1: About Cabuyao City -->
                        <h1 class="page-title">ABOUT <span class="text-yellow">CABUYAO CITY</span></h1>
                        <div class="divider-line"></div>
                        <p class="lead-text"><strong>"Enterprise City of the Philippines"</strong><br />A first-class component city in Laguna, CALABARZON</p>

                        <p>Cabuyao has a rich history dating back to its establishment as a pueblo in 1627. It is famous for it's <em><span class="text-yellow">Kampanang Ginto</span></em> (Golden Bell) and has long been recognized as a hub of industry and education. Today, Cabuyao hosts multiple major industrial parks, multinational companies, and universities such as the popular <em><span class="text-yellow">Mapúa Malayan Colleges Laguna</span></em>.</p>

                        <p>With a population of over <span class="text-yellow"><strong>355,000 residents</strong></span>, it is one of the fastest-growing cities in the region, balancing economic progress with cultural heritage.</p>
                        
                        <p>Nicknames include <strong><span class="text-yellow">“The City of Modern Factories”</span></strong>, <strong><span class="text-yellow">“Enterprise City of the Philippines”</span></strong>, and <strong><span class="text-yellow">“Golden Bell City.”</span></strong></p>

                        <p class="lead-text"><strong>"One Cabuyao, One Vision"</strong><br />- Cabuyao Motto</p>

                        <!-- Section 2: Map of Cabuyao -->
                        <div class="map-section">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d148735.62276767116!2d121.0942685!3d14.227040449999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d8847ffc5237%3A0xeefaf6451f579b65!2sCabuyao%20City%2C%20Laguna!5e1!3m2!1sen!2sph!4v1774097655186!5m2!1sen!2sph"
                                width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>

                        <!-- Section 3: About the Portal -->
                        <div class="about-section">
                            <h1 class="page-title">ABOUT <span class="text-yellow">THE PORTAL</span></h1>
                            <div class="divider-line"></div>
                            <p class="lead-text">A digital initiative serving the citizens of Cabuyao City. Citizens can browse the real-time database for missing belongings or submit reports for items they have found. Administrators moderate claims to ensure safe and proper turnover of items.</p>
                            <div class="info-grid">
                                <div class="info-box">
                                    <h3>Our <span class="text-yellow">Mission</span></h3>
                                    <p>To provide a <span class="text-yellow">secure</span>, <span class="text-yellow">efficient</span>, and <span class="text-yellow">accessible platform</span> for reporting and recovering lost items within Cabuyao. The portal fosters honesty, unity, and technological advancement by digitizing public services.</p>
                                </div>
                                <div class="info-box">
                                    <h3>Our <span class="text-yellow">Vision</span></h3>
                                    <p>To build a <span class="text-yellow">transparent</span>, <span class="text-yellow">community-driven system</span> that strengthens trust between citizens and local government, while modernizing Cabuyao’s public service infrastructure.</p>
                                </div>
                            </div>
                        </div>

                        <br /><br /><br />
                        <!-- Section 4: Meet the Developers -->
                        <h2 class="page-title">Meet <span class="text-yellow">The Developers</span></h2>
                        <div class="divider-line"></div>
                        <div class="dev-row">
                            <div class="dev-card">
                                <img src="images/Quennu.jpg" alt="Developer" class="dev-image" />
                                <h4 class="dev-name">Quennu Pastrana</h4>
                                <p class="dev-role">Lead Backend</p>
                                <p class="dev-bio"><strong>"Sobrang Pogi"</strong></p>
                                <p class="dev-bio"><br />Focused on backend logic and database integration.</p>
                            </div>

                            <div class="dev-card">
                                <img src="images/Dwight.jpg" alt="Developer" class="dev-image" />
                                <h4 class="dev-name">Dwight Reyes</h4>
                                <p class="dev-role">Frontend Design</p>
                                <p class="dev-bio"><strong>"Panay ang Legend of Zelda: Tears of the Kingdom"</strong></p>
                                <p class="dev-bio"><br />Handles UI/UX design and user-facing features.</p>
                            </div>

                            <div class="dev-card">
                                <img src="images/Aeron.jpg" alt="Developer" class="dev-image" />
                                <h4 class="dev-name">Aeron Rivera</h4>
                                <p class="dev-role">Database Admin</p>
                                <p class="dev-bio"><strong>"Panay ang VALORANT"</strong></p>
                                <p class="dev-bio"><br />Manages schema, queries, and database reliability.</p>
                            </div>
                        </div>

                        <div class="dev-row">
                            <div class="dev-card">
                                <img src="images/Dom.jpg" alt="Developer" class="dev-image" />
                                <h4 class="dev-name">Kyle Dom</h4>
                                <p class="dev-role">System Analyst</p>
                                <p class="dev-bio"><strong>"Mayaman; Pede kayo umutang dito"</strong></p>
                                <p class="dev-bio"><br />Ensures requirements are met and system flows are clear.</p>
                            </div>

                            <div class="dev-card">
                                <img src="images/Babiera.jpg" alt="Developer" class="dev-image" />
                                <h4 class="dev-name">Fitzgerald Babiera</h4>
                                <p class="dev-role">Project Manager</p>
                                <p class="dev-bio"><strong>"Gundam addict na broke; VALORANT addict na botfrag"</strong></p>
                                <p class="dev-bio"><br />Coordinates tasks, documentation, and project delivery.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <uc:SiteFooter runat="server" ID="SiteFooter" />
        </div>
    </form>
</body>
</html>