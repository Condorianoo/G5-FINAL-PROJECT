<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindItem.aspx.cs" Inherits="G5_FINAL_PROJECT.FindItem" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Find Items - Cabuyao Portal</title>
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
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .cabuyao-logo {
            height: 50px;
            width: auto;
            filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
        }

        .nav-links {
            display: flex;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--cabuyao-green);
            font-weight: 700;
            margin-left: 30px;
            font-size: 0.85rem;
            text-transform: uppercase;
            padding-bottom: 5px;
            transition: 0.3s;
        }
        
        .nav-links a:hover { color: var(--cabuyao-yellow); }

        .main-wrapper {
            display: flex;
            margin-top: 30px;
            padding: 0 5%;
            gap: 30px;
            align-items: flex-start;
        }

        .sidebar {
            width: 320px;
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 30px;
            position: sticky;
            top: 100px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        .sidebar h2 { 
            color: var(--cabuyao-yellow); 
            font-size: 1.8rem; 
            margin-top: 0; 
            margin-bottom: 25px; 
            font-weight: 800;
            letter-spacing: 1px;
        }
        
        .filter-group { margin-bottom: 20px; }
        .filter-group label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: 600; 
            font-size: 0.9rem; 
            color: rgba(255,255,255,0.9); 
        }
        
        .search-box, .category-select {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.9);
            color: #333;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .content-area { flex: 1; }
        
        .items-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            padding-bottom: 50px;
        }

        .item-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 20px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.2);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            color: white;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        .item-card:hover {
            transform: translateY(-10px);
            border-color: var(--cabuyao-yellow);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
        }

        .item-image {
            width: 100%;
            height: 200px;
            background: rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: rgba(255,255,255,0.5);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .item-info { padding: 20px; }
        .item-title { font-weight: 800; font-size: 1.3rem; margin: 0; color: white; letter-spacing: 0.5px; }
        .item-loc { color: var(--cabuyao-yellow); font-size: 0.95rem; margin-top: 10px; font-weight: 600; }
        .item-date { color: rgba(255,255,255,0.6); font-size: 0.85rem; margin-top: 5px; }

        @media screen and (max-width: 900px) {
            .sidebar { display: none; }
            .main-wrapper { padding: 0 20px; }
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
                <a href="SecondPage.aspx">BACK</a>
                <a href="#">About Us</a>
                <a href="#">Contact</a>
            </div>
        </nav>

        <div class="main-wrapper">
            <aside class="sidebar">
                <h2>Filters</h2>
                <div class="filter-group">
                    <label>Keywords</label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search items..."></asp:TextBox>
                </div>

                <div class="filter-group">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="category-select">
                        <asp:ListItem Text="All Categories" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Electronics" Value="Elec"></asp:ListItem>
                        <asp:ListItem Text="Wallets & Bags" Value="Bags"></asp:ListItem>
                        <asp:ListItem Text="Documents/IDs" Value="Docs"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="filter-group">
                    <label>Location</label>
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="category-select">
                        <asp:ListItem Text="All Locations" Value="All"></asp:ListItem>
                        <asp:ListItem Text="City Hall" Value="CH"></asp:ListItem>
                        <asp:ListItem Text="Poblacion" Value="Pob"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </aside>

            <main class="content-area">
                <div class="items-grid">
                    <div class="item-card">
                        <div class="item-image">NO IMAGE AVAILABLE</div>
                        <div class="item-info">
                            <p class="item-title">Black Wallet</p>
                            <p class="item-loc">📍 Cabuyao City Hall</p>
                            <p class="item-date">Reported 2 hours ago</p>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </form>
</body>
</html>