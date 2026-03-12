<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="G5_FINAL_PROJECT.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Laguna Lost & Found</title>
    <style>
        /* Basic Reset & Typography */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5; /* Standard social media background */
            margin: 0;
            padding: 0;
            color: #1c1e21;
        }

        /* Header Styling */
        .header {
            background-color: #1877f2; /* Classic FB Blue */
            color: white;
            text-align: center;
            padding: 2.5rem 1rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }
        .header p {
            font-size: 1.1rem;
            margin-top: 10px;
        }

        /* Layout Container */
        .container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        /* Card Panels */
        .card {
            background: white;
            border-radius: 8px;
            padding: 2rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .card h2 {
            margin-top: 0;
            color: #1877f2;
        }

        /* Buttons & Links */
        .btn {
            display: inline-block;
            background-color: #e4e6eb;
            color: #050505;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            margin: 5px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #d8dadf;
        }
        .btn-primary {
            background-color: #1877f2;
            color: white;
        }
        .btn-primary:hover {
            background-color: #166fe5;
        }
        .btn-success {
            background-color: #42b72a;
            color: white;
        }
        .btn-success:hover {
            background-color: #36a420;
        }

        /* Flexbox for Group Links */
        .group-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="header">
            <h1>Laguna Lost & Found Hub</h1>
            <p>Helping the community reconnect with their lost items, pets, and documents.</p>
        </div>

        <div class="container">
            
            <div class="card">
                <h2>Welcome to the Community</h2>
                <p>This portal connects you to the various active Facebook groups dedicated to finding lost items across the Laguna province. Work together to help our neighbors!</p>
            </div>

            <div class="card">
                <h2>Find Your Local City Group</h2>
                <p>Select a municipality below to visit the dedicated Facebook group for your area:</p>
                <div class="group-list">
                    <asp:HyperLink ID="hlCalamba" runat="server" CssClass="btn" NavigateUrl="#">Calamba City</asp:HyperLink>
                    <asp:HyperLink ID="hlSantaRosa" runat="server" CssClass="btn" NavigateUrl="#">Santa Rosa City</asp:HyperLink>
                    <asp:HyperLink ID="hlSanPedro" runat="server" CssClass="btn" NavigateUrl="#">San Pedro City</asp:HyperLink>
                    <asp:HyperLink ID="hlBinan" runat="server" CssClass="btn" NavigateUrl="#">Biñan City</asp:HyperLink>
                    <asp:HyperLink ID="hlLosBanos" runat="server" CssClass="btn" NavigateUrl="#">Los Baños</asp:HyperLink>
                    <asp:HyperLink ID="hlSanPablo" runat="server" CssClass="btn" NavigateUrl="#">San Pablo City</asp:HyperLink>
                </div>
            </div>

            <div class="card">
                <h2>Need to Report Something?</h2>
                <p>You can also log a lost or found item directly into our database.</p>
                <div style="margin-top: 15px;">
                    <asp:Button ID="btnLost" runat="server" Text="Report Lost Item" CssClass="btn btn-primary" />
                    <asp:Button ID="btnFound" runat="server" Text="Report Found Item" CssClass="btn btn-success" />
                </div>
            </div>

        </div>
    </form>
</body>
</html>