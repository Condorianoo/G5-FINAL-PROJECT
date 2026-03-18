<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteHeader.ascx.cs" Inherits="G5_FINAL_PROJECT.SiteHeader" %>

<header class="mcl-nav">
    <div class="logo-container">
        <img src="images/Cabuyao_Logo.png" alt="Cabuyao Logo" class="cabuyao-logo" />
        <h2 style="color: var(--cabuyao-green); margin:0; letter-spacing:1px; font-weight: 900;">
            CABUYAO <span style="color: #8a7300;">LOST AND FOUND</span>
        </h2>
    </div>
    
    <div class="nav-links" style="display: flex; align-items: center; gap: 20px;">
        <a href="Menu.aspx" class="nav-link">HOME</a>
        <a href="NewsEvents.aspx" class="nav-link">NEWS</a>
        <a href="AboutUs.aspx" class="nav-link">ABOUT US</a>
        <a href="Contact.aspx" class="nav-link">CONTACT</a>
        
        <asp:Panel ID="pnlGuest" runat="server" style="display: flex; align-items: center;">
            <a href="Login.aspx" class="login-btn">LOGIN</a>
        </asp:Panel>

        <asp:Panel ID="pnlLoggedIn" runat="server" Visible="false" style="display: flex; align-items: center; gap: 15px;">
            
            <asp:HyperLink ID="lnkDashboard" runat="server" NavigateUrl="~/AdminDashboard.aspx" CssClass="nav-link" Visible="false" style="color: #FFD700; font-weight: bold;">DASHBOARD</asp:HyperLink>
            
            <asp:Label ID="lblRoleBadge" runat="server" CssClass="nav-link" style="cursor: default; pointer-events: none;"></asp:Label>
            
            <asp:Button ID="btnLogout" runat="server" Text="LOGOUT" CssClass="login-btn" OnClick="btnLogout_Click" style="border: none; cursor: pointer; font-family: inherit; font-size: inherit; font-weight: bold; display: flex; align-items: center; justify-content: center;" />
        </asp:Panel>
    </div>
</header>
