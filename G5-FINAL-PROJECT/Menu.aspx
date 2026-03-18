<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="G5_FINAL_PROJECT.Menu" %>
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
            overflow-x: hidden; 
        }

        .choice-container {
            display: flex;
            flex-wrap: nowrap;
            justify-content: center;
            align-items: center;
            gap: min(6vw, 2.5rem);
            min-height: 85vh;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 12vh 6vw 10vh 6vw;
            box-sizing: border-box;
            flex: 1 0 auto;
        }

        .glass-card {
            background: #ffffff;
            border: 2px solid rgba(0, 104, 55, 0.2);
            border-radius: 24px;
            flex: 0 1 460px;
            width: clamp(380px, 42vw, 520px);
            padding: 10px 52px;
            text-align: center;
            color: var(--cabuyao-green);
            transition: all 0.35s ease;
            text-decoration: none;
            box-shadow: 0 12px 28px rgba(0,0,0,0.22);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 96px;
            box-sizing: border-box;
            gap: 12px;
        }

        .glass-card h2 {
            min-height: 2.6em;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            margin-bottom: 8px;
        }


        @media (max-width: 800px) {
            .choice-container { flex-wrap: wrap; }
            .glass-card { flex: 1 1 100%; max-width: 480px; }
        }

        .glass-card:hover {
            transform: translateY(-15px);
            border-color: var(--cabuyao-yellow); 
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }

        .icon-box {
            font-size: 4.5rem;
            margin-bottom: 4px;
            display: block;
            color: var(--cabuyao-green);
        }

        .glass-card h2 { 
            font-size: 2rem; 
            margin-bottom: 8px; 
            letter-spacing: 2px;
            font-weight: 800;
            color: var(--cabuyao-green);
        }

        .glass-card p { 
            color: #8A7300; 
            line-height: 1.4; 
            font-size: 0.95rem;
            font-weight: 600;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:SiteHeader runat="server" ID="SiteHeader" />
            <div class="page-content">
                <div class="choice-container">
                    <a href="FindItem.aspx" class="glass-card">
                        
                        <h2>I LOST SOMETHING</h2>
                        <p>Access the missing item database</p>
                    </a>

                    <a href="ReportItem.aspx" class="glass-card">
                        
                        <h2>I FOUND SOMETHING</h2>
                        <p>Submit or report a missing item</p>
                    </a>
                </div>
            </div>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>




