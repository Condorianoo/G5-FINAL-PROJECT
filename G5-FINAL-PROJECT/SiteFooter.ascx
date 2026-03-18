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
    .footer-col ul li a:hover { color: #8a7300; }

    .footer-brand h2 { color: #006837; margin: 0; font-weight: 900; letter-spacing: 1px; }
    .footer-brand p { margin-top: 10px; font-size: 0.8rem; color: #4f4f4f; }

    .social-icons { display: flex; gap: 15px; margin-top: 20px; }
    .social-btn {
        width: 35px; height: 35px; background: rgba(0,104,55,0.08);
        border-radius: 50%; display: flex; align-items: center;
        justify-content: center; color: #006837; text-decoration: none;
        transition: 0.3s;
    }
    .social-btn:hover { background: #006837; color: #FFD700; }

    @media screen and (max-width: 900px) {
        .footer-container { flex-direction: column; text-align: center; }
        .social-icons { justify-content: center; }
    }
</style>

<footer>
    <div class="footer-container">
        <div class="footer-col footer-brand">
            <h2>CABUYAO LOST AND FOUND</h2>
            <p>&copy; 2026 Cabuyao City Lost and Found Recovery. All Rights Reserved.</p>
        </div>
        <div class="footer-col">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="FindItem.aspx">Find Lost Items</a></li>
                <li><a href="ReportItem.aspx">Report Found Item</a></li>
                <li><a href="Menu.aspx">Main Portal</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Support</h3>
            <ul>
                <li><a href="#">About the Portal</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Official Links</h3>
            <ul>
                <li><a href="https://www.cabuyao.gov.ph">Cabuyao City Website</a></li>
                <li><a href="#">DILG Cabuyao</a></li>
                <li><a href="#">PNP Cabuyao</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Follow us</h3>
            <div class="social-icons">
                <a href="#" class="social-btn">f</a>
                <a href="#" class="social-btn">t</a>
                <a href="#" class="social-btn">in</a>
            </div>
        </div>
    </div>
</footer>

