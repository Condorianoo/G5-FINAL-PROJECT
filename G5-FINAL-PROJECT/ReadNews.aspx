<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadNews.aspx.cs" Inherits="G5_FINAL_PROJECT.ReadNews" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>View Article - Cabuyao Portal</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
        }

        body, html {
            margin: 0; padding: 0; min-height: 100vh;
            font-family: 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(rgba(0, 104, 55, 0.78), rgba(0, 104, 55, 0.78)), url('images/CabuyaoCityHalljf7175_10.JPG') center/cover fixed;
            color: white;
        }

        .read-container {
            width: 90%;
            max-width: 850px;
            margin: 100px auto 60px auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            padding: 50px;
            border-radius: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 50px rgba(0,0,0,0.5);
        }

        .full-news-img {
            width: 100%;
            max-height: 450px;
            object-fit: cover;
            border-radius: 20px;
            margin-bottom: 30px;
            border: 3px solid var(--cabuyao-yellow);
        }

        .news-meta {
            color: var(--cabuyao-yellow);
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
            display: block;
        }

        .news-full-title {
            font-size: 2.8rem;
            margin: 0 0 25px 0;
            line-height: 1.1;
            font-weight: 900;
        }

        .news-full-content {
            font-size: 1.15rem;
            line-height: 1.8;
            color: rgba(255, 255, 255, 0.9);
            white-space: pre-line; 
        }

        .btn-back {
            display: inline-block;
            margin-bottom: 30px;
            color: white;
            text-decoration: none;
            font-weight: bold;
            background: rgba(255,255,255,0.2);
            padding: 8px 20px;
            border-radius: 50px;
            transition: 0.3s;
        }

        .btn-back:hover { background: var(--cabuyao-yellow); color: var(--cabuyao-green); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <div class="read-container">
            <a href="NewsEvents.aspx" class="btn-back"> Back to News</a>
            
            <asp:Image ID="imgFullNews" runat="server" CssClass="full-news-img" />
            
            <span class="news-meta">
                Published on <asp:Label ID="lblDate" runat="server"></asp:Label>
            </span>
            
            <h1 class="news-full-title">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </h1>

            <div class="news-full-content">
                <asp:Literal ID="litContent" runat="server"></asp:Literal>
            </div>
        </div>

        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
</body>
</html>
