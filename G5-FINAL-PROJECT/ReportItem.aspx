<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportItem.aspx.cs" Inherits="G5_FINAL_PROJECT.ReportItem" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Report Item - Cabuyao Portal</title>
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
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
.main-wrapper {
            display: flex;
            margin-top: 30px;
            padding: 0 5%;
            gap: 30px;
            align-items: flex-start;
            justify-content: center;
        }

        .content-area { 
            flex: 1; 
            display: flex; 
            justify-content: center; 
        }

        .glass-form {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            width: 100%;
            max-width: 700px;
            padding: 40px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
        }

        .glass-form h2 { 
            color: var(--cabuyao-yellow); 
            font-size: 1.8rem; 
            margin-top: 0; 
            margin-bottom: 25px; 
            font-weight: 800;
            letter-spacing: 1px;
            text-align: center;
        }
        
        .form-group { margin-bottom: 20px; }
        .form-group label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: 600; 
            font-size: 0.9rem; 
            color: rgba(255,255,255,0.9); 
        }
        
        .input-ctrl {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.9);
            color: #333;
            font-size: 1rem;
            box-sizing: border-box;
            font-family: inherit;
        }

        .file-area {
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 10px;
            border: 2px dashed rgba(255,255,255,0.2);
            text-align: center;
        }

        .radio-list td { padding-bottom: 5px; }
        .radio-list label { margin-left: 10px; cursor: pointer; }

        .submit-btn {
            width: 100%;
            background: var(--cabuyao-green);
            color: white;
            padding: 18px;
            border: none;
            border-radius: 100px;
            font-size: 1.2rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: #008a49;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 104, 55, 0.5);
            border: 1px solid var(--cabuyao-yellow);
        }

        @media screen and (max-width: 900px) {
            .main-wrapper { padding: 0 20px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:SiteHeader runat="server" ID="SiteHeader" />

        <div class="main-wrapper">
            <main class="content-area">
                <div class="glass-form">
                    <h2>Report Found Item</h2>
                    
                    <div class="form-group">
                        <label>Item Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="input-ctrl" placeholder="Item Name"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Category</label>
                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="input-ctrl">
                            <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                            <asp:ListItem Text="Electronics" Value="Elec"></asp:ListItem>
                            <asp:ListItem Text="Wallets & Bags" Value="Bags"></asp:ListItem>
                            <asp:ListItem Text="Documents/IDs" Value="Docs"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>Upload Media</label>
                        <div class="file-area">
                            <asp:FileUpload ID="fuMedia" runat="server" AllowMultiple="true" ForeColor="White" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Current Status</label>
                        <asp:RadioButtonList ID="rblStatus" runat="server" CssClass="radio-list">
                            <asp:ListItem Text=" I have the item" Value="Me"></asp:ListItem>
                            <asp:ListItem Text=" Surrendered to Gov/Police" Value="Gov"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <label>Contact/Location Details</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="input-ctrl" TextMode="MultiLine" Rows="3" placeholder="Provide contact info or surrender location"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Report" CssClass="submit-btn" />
                </div>
            </main>
        </div>
    </form>
</body>
</html>


