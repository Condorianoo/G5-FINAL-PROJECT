<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsEvents.aspx.cs" Inherits="G5_FINAL_PROJECT.NewsEvents" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>

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
            background: #ffffff; 
            color: var(--text-dark);
        }
/* --- HERO HEADER SECTION --- */
        .news-hero {
            background: linear-gradient(rgba(0, 104, 55, 0.85), rgba(0, 104, 55, 0.9)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover;
            background-position: center;
            height: 250px; 
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .news-hero h1 {
            font-size: 3rem;
            font-weight: 900;
            letter-spacing: 2px;
            margin: 0 0 10px 0;
            text-transform: uppercase;
        }

        .news-hero p {
            color: var(--cabuyao-yellow);
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            letter-spacing: 1px;
        }

        /* --- NEWS GRID SECTION --- */
        .content-container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 20px;
        }

        .section-title {
            color: var(--text-dark);
            font-size: 2rem;
            font-weight: 800;
            margin-bottom: 40px;
            text-transform: uppercase;
            border-left: 5px solid var(--cabuyao-yellow);
            padding-left: 15px;
        }

        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 40px;
        }

        /* --- INDIVIDUAL NEWS CARD --- */
        .news-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
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
            height: 200px;
            object-fit: cover;
            background: #e0e0e0; 
        }

        .news-content {
            padding: 25px;
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
            font-size: 1.3rem;
            font-weight: 800;
            margin: 0 0 15px 0;
            line-height: 1.3;
        }

        .news-excerpt {
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.6;
            margin: 0 0 20px 0;
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
        <uc:SiteHeader runat="server" ID="SiteHeader" />

        <header class="news-hero">
            <h1>NEWS & EVENTS</h1>
            <p>Stay updated with Cabuyao City</p>
        </header>

        <main class="content-container">
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
        </main>
    </form>
</body>
</html>


