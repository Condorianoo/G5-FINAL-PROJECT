<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecondPage.aspx.cs" Inherits="G5_FINAL_PROJECT.SecondPage" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cabuyao Portal - Lost & Found</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 0, 0, 0.75);
        }

        body, html {
            margin: 0; padding: 0; height: 100%;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: linear-gradient(var(--dark-overlay), var(--dark-overlay)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover; 
            background-attachment: fixed;
            background-position: center;
            overflow: hidden;
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
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            width: 400px;
            padding: 60px 40px;
            text-align: center;
            color: white;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        .glass-card:hover {
            background: rgba(255, 255, 255, 0.12);
            transform: translateY(-20px);
            border-color: var(--cabuyao-yellow); 
            box-shadow: 0 25px 50px rgba(0,0,0,0.6);
        }

        .icon-box {
            font-size: 4.5rem;
            margin-bottom: 25px;
            display: block;
            filter: drop-shadow(0 0 15px rgba(255, 215, 0, 0.3));
        }

        .glass-card h2 { 
            font-size: 2rem; 
            margin-bottom: 15px; 
            letter-spacing: 2px;
            font-weight: 800;
            color: #fff;
        }

        .glass-card p { 
            color: rgba(255, 255, 255, 0.8); 
            line-height: 1.7; 
            font-size: 1rem;
            font-weight: 400;
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
    </form>
</body>
</html>



