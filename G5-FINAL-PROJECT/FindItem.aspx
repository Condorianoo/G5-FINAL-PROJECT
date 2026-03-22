<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FindItem.aspx.cs" Inherits="G5_FINAL_PROJECT.FindItem" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Find Item - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <link rel="stylesheet" type="text/css" href="styles/image-viewer.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 104, 55, 0.78);
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
        
        .main-wrapper {
            display: flex;
            margin-top: 30px;
            padding: 0 5% 80px 5%;
            gap: 24px;
            align-items: flex-start;
        }

        .filter-toggle {
            display: none;
            align-items: center;
            gap: 10px;
            background: var(--cabuyao-yellow);
            color: #111;
            border: none;
            border-radius: 999px;
            padding: 12px 18px;
            font-weight: 800;
            letter-spacing: 1px;
            cursor: pointer;
            box-shadow: 0 8px 18px rgba(0,0,0,0.25);
            text-transform: uppercase;
        }

        .sidebar {
            width: 280px;
            flex-shrink: 0;
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

        .btn-filter {
            width: 100%;
            background: var(--cabuyao-green);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 100px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-filter:hover {
            background: #008a49;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            transform: translateY(-2px);
        }

        .content-area { flex: 1; width: 100%; }
        
        .items-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
            padding-bottom: 50px;
        }

        
        @media screen and (max-width: 1024px) {
            .main-wrapper {
                flex-direction: column;
                padding: 0 20px 80px 20px;
            }

            .filter-toggle {
                display: inline-flex;
            }

            .sidebar {
                display: none;
                width: 100%;
                position: relative;
                top: 0;
                margin-bottom: 30px;
            }

            .filter-container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 15px;
            }

            .sidebar.open {
                display: block;
            }
        }

        .item-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.18);
            transition: all 0.35s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            color: white;
            box-shadow: 0 10px 22px rgba(0,0,0,0.28);
            display: block;
        }

        .item-card:hover {
            transform: translateY(-10px);
            border-color: var(--cabuyao-yellow);
            box-shadow: 0 20px 40px rgba(0,0,0,0.5);
        }

        .item-image {
            width: 100%; height: 200px;
            background: rgba(0,0,0,0.4);
            display: flex; align-items: center; justify-content: center;
            font-weight: bold; color: rgba(255,255,255,0.5);
            border-bottom: 1px solid rgba(255,255,255,0.1);
            text-transform: uppercase; overflow: hidden;
        }

        .item-image img { width: 100%; height: 100%; object-fit: cover; }
        .item-info { padding: 16px; }
        .item-title { font-weight: 800; font-size: 1.1rem; margin: 0; color: white; }
        .item-loc { color: var(--cabuyao-yellow); font-size: 0.9rem; margin-top: 8px; font-weight: 600; line-height: 1.4; }
        .item-date { color: rgba(255,255,255,0.6); font-size: 0.8rem; margin-top: 4px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <uc:SiteHeader runat="server" ID="SiteHeader" />
            <div class="page-content">
                <div class="main-wrapper">
                    <button type="button" class="filter-toggle" onclick="toggleFilters()">Filters</button>
                    <aside class="sidebar">
                        <h2>Filters</h2>
                        <div class="filter-container">
                            <div class="filter-group">
                                <label>Keywords</label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Search items or locations..."></asp:TextBox>
                            </div>

                            <div class="filter-group">
                                <label>Category</label>
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="category-select">
                                    <asp:ListItem Text="All Categories" Value="All"></asp:ListItem>
                                    <asp:ListItem Text="Electronics" Value="Electronics"></asp:ListItem>
                                    <asp:ListItem Text="Wallets & Bags" Value="Wallets & Bags"></asp:ListItem>
                                    <asp:ListItem Text="Documents/IDs" Value="Documents/IDs"></asp:ListItem>
                                    <asp:ListItem Text="Keys & Keychains" Value="Keys"></asp:ListItem>
                                    <asp:ListItem Text="Clothing & Accessories" Value="Clothing"></asp:ListItem>
                                    <asp:ListItem Text="Jewelry & Watches" Value="Jewelry"></asp:ListItem>
                                    <asp:ListItem Text="Pets/Animals" Value="Pets"></asp:ListItem>
                                    <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                        <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" 
                            CssClass="btn-filter" OnClick="btnApplyFilters_Click" />
                    </aside>

                    <main class="content-area">
                        <div class="items-grid">
                            <asp:Repeater ID="rptItems" runat="server">
                                <ItemTemplate>
                                    <a href='ClaimItem.aspx?id=<%# Eval("ItemID") %>' class="item-card">
                                        <div class="item-image">
                                            <%# string.IsNullOrEmpty(Eval("ImagePath")?.ToString()) ? 
                                                Eval("Type") + " ITEM" : 
                                                "<img src='" + Eval("ImagePath") + "' alt='Item Image' data-viewer='true' />" %>
                                        </div>
                                        <div class="item-info">
                                            <p class="item-title"><%# Eval("Title") %></p>
                                            <p class="item-loc"><%# Eval("Description") %></p>
                                            <p class="item-date">Status: Active Report</p>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </main>
                </div>
            </div>
        </div>
        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
    <script type="text/javascript">
        function toggleFilters() {
            var sidebar = document.querySelector('.sidebar');
            if (!sidebar) return;
            sidebar.classList.toggle('open');
        }
        document.addEventListener('click', function (e) {
            var sidebar = document.querySelector('.sidebar');
            if (!sidebar) return;
            if (window.innerWidth > 1024) return;
            var toggle = e.target.closest('.filter-toggle');
            if (toggle) return;
            if (!e.target.closest('.sidebar')) {
                sidebar.classList.remove('open');
            }
        });
    </script>
    <script src="scripts/image-viewer.js"></script>
</body>
</html>
