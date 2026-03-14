<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportItem.aspx.cs" Inherits="G5_FINAL_PROJECT.ReportItem" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Report Found Item - Cabuyao Portal</title>
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 0, 0, 0.75);
        }

        body, html {
            margin: 0; padding: 0; min-height: 100%;
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
        
        .logo-container { display: flex; align-items: center; gap: 15px; }
        .cabuyao-logo { height: 50px; width: auto; }

        .nav-links a {
            text-decoration: none;
            color: var(--cabuyao-green);
            font-weight: 700;
            margin-left: 30px;
            font-size: 0.85rem;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .nav-links a:hover { color: var(--cabuyao-yellow); }

        .form-container {
            display: flex;
            justify-content: center;
            padding: 50px 20px;
        }

        .glass-form {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 30px;
            width: 100%;
            max-width: 700px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        .glass-form h2 {
            color: var(--cabuyao-yellow);
            font-size: 2rem;
            margin-top: 0;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .form-group { margin-bottom: 25px; }
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            font-size: 1rem;
            color: rgba(255,255,255,0.9);
        }

        .input-ctrl, .dropdown-ctrl {
            width: 100%;
            padding: 12px 15px;
            border-radius: 12px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.95);
            color: #333;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .file-upload {
            background: rgba(255,255,255,0.1);
            padding: 20px;
            border-radius: 12px;
            border: 2px dashed rgba(255,255,255,0.3);
            text-align: center;
            cursor: pointer;
        }

        .submit-btn {
            width: 100%;
            background: var(--cabuyao-green);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 50px;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 20px;
            border: 2px solid transparent;
        }

        .submit-btn:hover {
            background: #004d29;
            border-color: var(--cabuyao-yellow);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 104, 55, 0.4);
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

        <div class="form-container">
            <div class="glass-form">
                <h2>Report a Found Item</h2>
                
                <div class="form-group">
                    <label>Item Name</label>
                    <asp:TextBox ID="txtItemName" runat="server" CssClass="input-ctrl" placeholder="e.g. Black Leather Wallet"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown-ctrl">
                        <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                        <asp:ListItem Text="Electronics (Phones, Laptops)" Value="Electronics"></asp:ListItem>
                        <asp:ListItem Text="Wallets & Bags" Value="Bags"></asp:ListItem>
                        <asp:ListItem Text="Personal Documents / IDs" Value="Documents"></asp:ListItem>
                        <asp:ListItem Text="Keys" Value="Keys"></asp:ListItem>
                        <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Upload Media (Photos/Videos)</label>
                    <div class="file-upload">
                        <asp:FileUpload ID="fileMedia" runat="server" AllowMultiple="true" ForeColor="White" />
                    </div>
                </div>

                <div class="form-group">
                    <label>Current Status of Item</label>
                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Vertical" AutoPostBack="false">
                        <asp:ListItem Text=" I have the item (Provide contact info below)" Value="WithMe"></asp:ListItem>
                        <asp:ListItem Text=" Surrendered to Government/Police Station" Value="Surrendered"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>

                <div class="form-group">
                    <label>Contact Details or Surrender Location</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="input-ctrl" TextMode="MultiLine" Rows="3" 
                        placeholder="Enter your Contact Number, FB Link, Email, or the specific Police Station where you left the item."></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmit" runat="server" Text="Submit Report" CssClass="submit-btn" />
            </div>
        </div>
    </form>
</body>
</html>