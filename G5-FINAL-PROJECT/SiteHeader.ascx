<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteHeader.ascx.cs" Inherits="G5_FINAL_PROJECT.SiteHeader" %>

<header class="mcl-nav">
    <a href="Landing.aspx" class="logo-container" style="text-decoration: none;">
        <img src="images/Cabuyao_Logo.png" alt="Cabuyao Logo" class="cabuyao-logo" />
        <h2 style="color: var(--cabuyao-green); margin:0; letter-spacing:0.5px; font-weight: 900;">
            CABUYAO<br />
            <span style="color: #8a7300;">LOST &amp; FOUND</span>
        </h2>
    </a>
    
    <div class="nav-links">
        <div class="nav-left-links">
            <a href="Menu.aspx" class="nav-link">HOME</a>
            <a href="NewsEvents.aspx" class="nav-link">NEWS</a>
            <a href="AboutUs.aspx" class="nav-link">ABOUT US</a>
            <a href="Contact.aspx" class="nav-link">CONTACT</a>
        </div>
        
        <asp:Panel ID="pnlGuest" runat="server" CssClass="nav-auth">
            <a href="Login.aspx" class="login-btn">LOGIN</a>
        </asp:Panel>

        <asp:Panel ID="pnlLoggedIn" runat="server" Visible="false" CssClass="nav-auth">
            
            <asp:HyperLink ID="lnkDashboard" runat="server" NavigateUrl="~/AdminDashboard.aspx" CssClass="nav-link" Visible="false" style="color: #FFD700; font-weight: bold;">DASHBOARD</asp:HyperLink>
            
            <div class="profile-menu" id="profileMenu">
                <a href="#" class="profile-button" onclick="toggleProfileMenu(event);">
                    <span class="profile-name"><asp:Label ID="lblDisplayName" runat="server" /></span>
                    <asp:Label ID="lblRoleBadge" runat="server" CssClass="profile-role" Visible="false"></asp:Label>
                    <span class="profile-caret">▼</span>
                </a>
                <div class="profile-dropdown" id="profileDropdown">
                    <a href="ChangePassword.aspx">Change Password</a>
                    <asp:LinkButton ID="btnLogout" runat="server" CssClass="dropdown-btn" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                </div>
            </div>
        </asp:Panel>
    </div>
</header>
<script type="text/javascript">
    function toggleProfileMenu(event) {
        event.preventDefault();
        event.stopPropagation();
        var menu = event.currentTarget.closest('.profile-menu');
        if (!menu) return;
        var dropdown = menu.querySelector('.profile-dropdown');
        var trigger = event.currentTarget;
        var isOpen = menu.classList.contains('open');

        // Close any other open menus
        document.querySelectorAll('.profile-menu').forEach(function (m) {
            m.classList.remove('open');
            var dd = m.querySelector('.profile-dropdown');
            if (dd) {
                dd.style.display = 'none';
                dd.style.visibility = 'hidden';
            }
        });

        if (!isOpen && dropdown && trigger) {
            menu.classList.add('open');
            // Place dropdown using viewport coords to bypass parent overflow contexts
            var rect = trigger.getBoundingClientRect();
            dropdown.style.position = 'fixed';
            dropdown.style.top = (rect.bottom + 8) + 'px';

            // Align left edge with trigger, match trigger width, keep within viewport
            var desiredLeft = rect.left;
            var dropdownWidth = rect.width; // copy trigger width
            var maxLeft = Math.max(0, window.innerWidth - dropdownWidth - 8);
            dropdown.style.left = Math.min(desiredLeft, maxLeft) + 'px';
            dropdown.style.right = 'auto';
            dropdown.style.width = dropdownWidth + 'px';
            dropdown.style.minWidth = dropdownWidth + 'px';
            dropdown.style.display = 'flex';
            dropdown.style.visibility = 'visible';
        } else if (dropdown) {
            dropdown.style.display = 'none';
            dropdown.style.visibility = 'hidden';
            menu.classList.remove('open');
        }
    }

    document.addEventListener('click', function (e) {
        if (!e.target.closest('.profile-menu')) {
            document.querySelectorAll('.profile-menu').forEach(function (m) { 
                m.classList.remove('open'); 
                var dd = m.querySelector('.profile-dropdown');
                if (dd) {
                    dd.style.display = 'none';
                    dd.style.visibility = 'hidden';
                }
            });
        }
    });
</script>
