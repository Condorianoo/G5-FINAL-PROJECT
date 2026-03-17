<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondPage.aspx.cs" Inherits="G5_FINAL_PROJECT.SecondPage" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cabuyao Portal - Lost & Found</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 104, 55, 0.78);
        }

        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: linear-gradient(var(--dark-overlay), var(--dark-overlay)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover; 
            background-attachment: fixed;
            background-position: center;
            overflow-x: hidden; /* avoid horizontal shift */
        }

        .choice-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
            height: 80vh;
            padding: 0 10%;
        }

        .glass-card {
            background: #ffffff;
            border: 2px solid rgba(0, 104, 55, 0.2);
            border-radius: 30px;
            width: 400px;
            padding: 60px 40px;
            text-align: center;
            color: var(--cabuyao-green);
            transition: all 0.35s ease;
            text-decoration: none;
            box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        }

        .glass-card:hover {
            transform: translateY(-15px);
            border-color: var(--cabuyao-yellow); 
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }

        .icon-box {
            font-size: 4.5rem;
            margin-bottom: 25px;
            display: block;
            color: var(--cabuyao-green);
        }

        .glass-card h2 { 
            font-size: 2rem; 
            margin-bottom: 15px; 
            letter-spacing: 2px;
            font-weight: 800;
            color: var(--cabuyao-green);
        }

        .glass-card p { 
            color: var(--cabuyao-yellow); 
            line-height: 1.7; 
            font-size: 1rem;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />

        <div class="choice-container">
            <a href="FindItem.aspx" class="glass-card">
                <span class="icon-box">&#128269;</span>
                <h2>I LOST SOMETHING</h2>
                <p>Browse our verified database of found items to reclaim your missing belongings.</p>
            </a>

            <a href="ReportItem.aspx" class="glass-card">
                <span class="icon-box">&#129309;</span>
                <h2>I FOUND SOMETHING</h2>
                <p>Register an item you've found to help connect it with its rightful owner.</p>
            </a>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>



