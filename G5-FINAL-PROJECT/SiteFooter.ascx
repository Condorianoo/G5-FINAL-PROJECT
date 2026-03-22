<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteFooter.ascx.cs" Inherits="G5_FINAL_PROJECT.Footer" %>

<style>
    footer {
        background: #ffffff;
        padding: 60px 5% 30px;
        border-top: 2px solid rgba(0, 104, 55, 0.15);
        color: #2f2f2f;
        font-size: 0.9rem;
        flex-shrink: 0;
        margin-top: auto;
        width: 100%;
        box-sizing: border-box;
    }

    .footer-container {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 40px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .footer-col { flex: 1; min-width: 180px; }
    .footer-col h3 { color: #006837; margin-bottom: 20px; font-size: 1.1rem; }
    .footer-col ul { list-style: none; padding: 0; margin: 0; }
    .footer-col ul li { margin-bottom: 12px; }
    .footer-col ul li a { color: #4f4f4f; text-decoration: none; transition: 0.3s; }
    .footer-col ul li a:hover { color: var(--cabuyao-yellow); }

    .footer-brand {
        display: flex;
        align-items: center;
        gap: 12px;
    }
    .footer-brand img {
        height: 52px;
        width: auto;
    }
    .footer-brand h2 { color: #006837; margin: 0; font-weight: 900; letter-spacing: 1px; }
    .footer-brand p { margin-top: 10px; font-size: 0.8rem; color: #4f4f4f; }

    @media screen and (max-width: 900px) {
        .footer-container { flex-direction: column; text-align: center; }
    }
</style>

<footer>
    <div class="footer-container">
        <div class="footer-col footer-brand">
            <img src="images/Cabuyao_Logo.png" alt="Cabuyao Logo" />
            <div>
                <h2>CABUYAO LOST AND FOUND</h2>
                <p>&copy; 2026 Cabuyao City Lost and Found Recovery. All Rights Reserved.</p>
            </div>
        </div>
        <div class="footer-col">
            <h3>Official Links</h3>
            <ul>
                <li><a href="https://www.facebook.com/BagongCabuyao" target="_blank" rel="noopener">Cabuyao Official Facebook Page</a></li>
                <li><a href="https://www.facebook.com/dilg.cabuyao" target="_blank" rel="noopener">DILG Cabuyao</a></li>
                <li><a href="https://www.facebook.com/PNPCabuyao" target="_blank" rel="noopener">Cabuyao Component City Police Station</a></li>
            </ul>
        </div>
    </div>
</footer>

