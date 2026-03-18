<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsEvents.aspx.cs" Inherits="G5_FINAL_PROJECT.NewsEvents" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>News &amp; Events - Cabuyao Portal</title>
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
/* --- HERO HEADER SECTION --- */
        .news-hero {
            background: none;
            height: 220px; 
            text-align: center;
            padding-top: 35px; 
            color: white;
            box-sizing: border-box;
        }

        .news-hero h1 {
            font-size: 3.5rem; /* match contact */
            font-weight: 900;
            letter-spacing: 2px;
            margin: 0;
            text-transform: uppercase;
        }

        .news-hero p {
            display: none;
            margin: 0;
            padding: 0;
        }

        /* --- NEWS GRID SECTION --- */
        .content-container {
            max-width: 1180px;
            margin: -70px auto -20px auto;
            padding: 0 16px;
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.08); 
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.15); 
            border-radius: 18px;
            padding: 28px; /* add internal space so content sits lower like the contact form */
            margin-bottom: 48px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.35);
        }

        .section-title {
            color: white;
            font-size: 2rem;
            font-weight: 800;
            margin: 6px 0 18px 0;
            text-transform: uppercase;
            border-left: 5px solid var(--cabuyao-yellow);
            padding-left: 15px;
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 24px;
        }

        @media (max-width: 1100px) {
            .news-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }

        @media (max-width: 760px) {
            .news-grid { grid-template-columns: 1fr; }
        }

        /* --- INDIVIDUAL NEWS CARD --- */
        .news-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.04);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
        }

        .news-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.12);
            border-color: #e0e0e0;
        }

        .news-image {
            width: 100%;
            height: 160px;
            object-fit: cover;
            background: #e0e0e0; 
        }

        .news-content {
            padding: 18px;
            flex-grow: 1; 
            display: flex;
            flex-direction: column;
        }

        .news-date {
            color: var(--cabuyao-yellow);
            font-weight: 800;
            font-size: 0.85rem;
            text-transform: uppercase;
            margin-bottom: 10px;
            display: block;
        }

        .news-title {
            color: var(--cabuyao-green);
            font-size: 1.1rem;
            font-weight: 800;
            margin: 0 0 12px 0;
            line-height: 1.25;
        }

        .news-excerpt {
            color: var(--text-light);
            font-size: 0.92rem;
            line-height: 1.45;
            margin: 0 0 14px 0;
            flex-grow: 1;
        }

        .read-more {
            color: var(--cabuyao-green);
            text-decoration: none;
            font-weight: bold;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: 0.2s;
        }

        .read-more:hover {
            color: var(--cabuyao-yellow);
            gap: 10px; 
        }

        @media (max-width: 768px) {
            .news-hero h1 { font-size: 2.2rem; }
            .content-container { margin: 40px auto; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:SiteHeader runat="server" ID="SiteHeader" />
            <div class="page-content">
        <header class="news-hero">
            <h1>NEWS & EVENTS</h1>
            <p>Stay updated with Cabuyao City</p>
        </header>

        <main class="content-container">
            <div class="glass-panel">
                <h2 class="section-title">Latest Updates</h2>

                <div class="news-grid">
                    
                    <article class="news-card">
                        <img src="images/Cabuyao_Portal.jpg" alt="News Image" class="news-image" />
                        <div class="news-content">
                            <span class="news-date">March 15, 2026</span>
                            <h3 class="news-title">City Hall Launches Digital Lost & Found Portal</h3>
                            <p class="news-excerpt">In an effort to modernize public services, the local government has officially launched the centralized online system for recovering missing items.</p>
                            <a href="#" class="read-more">Read Full Story ?</a>
                        </div>
                    </article>

                    <article class="news-card">
                        <img src="images/Batingaw.jpg" alt="News Image" class="news-image" />
                        <div class="news-content">
                            <span class="news-date">February 28, 2026</span>
                            <h3 class="news-title">Preparations for the Annual Batingaw Festival</h3>
                            <p class="news-excerpt">Citizens are gearing up for the upcoming Batingaw Festival. Expect road closures around the City Plaza and spectacular parade floats this weekend.</p>
                            <a href="#" class="read-more">Read Full Story ?</a>
                        </div>
                    </article>

                    <article class="news-card">
                        <img src="images/Job_Fair.jpeg" alt="News Image" class="news-image" />
                        <div class="news-content">
                            <span class="news-date">February 10, 2026</span>
                            <h3 class="news-title">Local Job Fair at Cabuyao Retail Arena</h3>
                            <p class="news-excerpt">Over 50 companies will be participating in the mega job fair hosted by the Cabuyao Public Employment Service Office (PESO). Bring your resumes!</p>
                            <a href="#" class="read-more">Read Full Story ?</a>
                        </div>
                    </article>

                </div>
            </div>
        </main>
            </div>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>


