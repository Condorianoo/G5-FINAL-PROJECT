<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsEvents.aspx.cs" Inherits="G5_FINAL_PROJECT.NewsEvents" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>News &amp; Events - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --text-dark: #333333;
            --text-light: #666666;
        }

        body, html {
            margin: 0; padding: 0; 
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; 
            background: linear-gradient(rgba(0, 104, 55, 0.78), rgba(0, 104, 55, 0.78)), url('images/CabuyaoCityHalljf7175_10.JPG'); 
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: white;
        }

        .news-hero { text-align: center; padding: 60px 20px 20px 20px; color: white; }
        .news-hero h1 { font-size: 3.5rem; font-weight: 900; letter-spacing: 2px; margin: 0; text-transform: uppercase; }

        .content-container { max-width: 1180px; margin: 20px auto 80px auto; padding: 0 16px; }

        .glass-panel {
            background: rgba(255, 255, 255, 0.08); 
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2); 
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        .section-title {
            color: var(--cabuyao-yellow); font-size: 2rem; font-weight: 800;
            margin-bottom: 30px; text-transform: uppercase;
            border-left: 5px solid var(--cabuyao-yellow); padding-left: 15px;
        }

        .admin-actions { margin-bottom: 30px; display: flex; gap: 10px; }
        .btn-admin {
            padding: 12px 24px; border-radius: 50px; border: none;
            font-weight: bold; cursor: pointer; transition: 0.3s;
            text-transform: uppercase; font-size: 0.85rem;
        }
        .btn-add { background: var(--cabuyao-green); color: white; }
        .btn-delete { background: #dc3545; color: white; text-decoration:none; display:inline-block; }
        .btn-admin:hover { transform: translateY(-3px); box-shadow: 0 5px 15px rgba(0,0,0,0.3); }

        .news-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 25px; }

        .news-card {
            background: white; border-radius: 15px; overflow: hidden;
            transition: all 0.3s ease; display: flex; flex-direction: column; color: var(--text-dark);
        }
        .news-card:hover { transform: translateY(-8px); box-shadow: 0 15px 30px rgba(0,0,0,0.3); }

        .news-image { width: 100%; height: 180px; object-fit: cover; background: #eee; }

        .news-content { padding: 20px; flex-grow: 1; display: flex; flex-direction: column; }
        .news-date { color: #d4a000; font-weight: 800; font-size: 0.8rem; text-transform: uppercase; margin-bottom: 8px; }
        .news-title { color: var(--cabuyao-green); font-size: 1.25rem; font-weight: 800; margin: 0 0 10px 0; line-height: 1.2; }
        .news-excerpt { color: var(--text-light); font-size: 0.95rem; line-height: 1.5; margin-bottom: 15px; flex-grow: 1; }
        .read-more { color: var(--cabuyao-green); text-decoration: none; font-weight: bold; font-size: 0.95rem; }

        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.8); z-index: 1000; display: none; align-items: center; justify-content: center;
        }
        .modal-content { width: 90%; max-width: 550px; }
        .input-ctrl {
            width: 100%; padding: 12px; border-radius: 10px; border: 1px solid #ddd;
            margin-bottom: 15px; font-family: inherit; box-sizing: border-box;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <header class="news-hero">
            <h1>NEWS &amp; EVENTS</h1>
        </header>

        <main class="content-container">
            <div class="glass-panel">
                <h2 class="section-title">Latest Updates</h2>

                <asp:Panel ID="AdminControlsPanel" runat="server" CssClass="admin-actions">
                    <button type="button" class="btn-admin btn-add" onclick="openModal()">Add New Article</button>
                    <a href="ManageNews.aspx" class="btn-admin btn-delete">Manage Articles</a>
                </asp:Panel>

                <div class="news-grid">
                    <asp:Repeater ID="NewsRepeater" runat="server">
                        <ItemTemplate>
                            <article class="news-card">
                                <img src='<%# string.IsNullOrEmpty(Eval("ImagePath")?.ToString()) ? "images/Cabuyao_Portal.jpg" : Eval("ImagePath") %>' alt="News Image" class="news-image" />
                                <div class="news-content">
                                    <span class="news-date"><%# Eval("PublishDate", "{0:MMMM dd, yyyy}") %></span>
                                    <h3 class="news-title"><%# Eval("Title") %></h3>
                                    <p class="news-excerpt">
                                        <%# Eval("Content").ToString().Length > 120 ? Eval("Content").ToString().Substring(0, 120) + "..." : Eval("Content") %>
                                    </p>
                                    <a href='ReadNews.aspx?id=<%# Eval("NewsID") %>' class="read-more">Read Full Story </a>
                                </div>
                            </article>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </main>

        <div id="newsModal" class="modal-overlay">
            <div class="glass-panel modal-content">
                <h2 style="color:var(--cabuyao-yellow); margin-top:0;">Post News Update</h2>
                
                <label style="display:block; margin-bottom:5px;">Article Headline</label>
                <asp:TextBox ID="txtNewsTitle" runat="server" CssClass="input-ctrl" placeholder="e.g. Lost ID Drive 2026"></asp:TextBox>
                
                <label style="display:block; margin-bottom:5px;">Upload Image</label>
                <asp:FileUpload ID="fuNewsImage" runat="server" CssClass="input-ctrl" style="background:white;" />

                <label style="display:block; margin-bottom:5px;">Details / Content</label>
                <asp:TextBox ID="txtNewsContent" runat="server" TextMode="MultiLine" Rows="6" CssClass="input-ctrl" placeholder="Describe the event..."></asp:TextBox>
                
                <div style="display:flex; gap:10px;">
                    <asp:Button ID="btnSaveNews" runat="server" Text="Publish Now" CssClass="btn-admin btn-add" OnClick="btnSaveNews_Click" style="flex:1;" />
                    <button type="button" class="btn-admin btn-delete" onclick="closeModal()" style="flex:1;">Cancel</button>
                </div>
            </div>
        </div>

        <uc:SiteFooter runat="server" ID="SiteFooter" />

        <script>
            function openModal() { document.getElementById('newsModal').style.display = 'flex'; }
            function closeModal() { document.getElementById('newsModal').style.display = 'none'; }
        </script>
    </form>
</body>
</html>
