<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimItem.aspx.cs" Inherits="G5_FINAL_PROJECT.ClaimItem" %>
<%@ Register Src="~/SiteHeader.ascx" TagPrefix="uc" TagName="SiteHeader" %>
<%@ Register Src="~/SiteFooter.ascx" TagPrefix="uc" TagName="SiteFooter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Claim Item - Cabuyao Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="styles/layout.css" />
    <link rel="stylesheet" type="text/css" href="styles/header.css" />
    <link rel="stylesheet" type="text/css" href="styles/forms.css" />
    <link rel="stylesheet" type="text/css" href="styles/image-viewer.css" />
    <style>
        :root {
            --cabuyao-green: #006837;
            --cabuyao-yellow: #FFD700;
            --dark-overlay: rgba(0, 104, 55, 0.78);
        }

        body, html {
            margin: 0; padding: 0; min-height: 100%;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
            background: linear-gradient(var(--dark-overlay), var(--dark-overlay)), url('images/CabuyaoCityHalljf7175_10.JPG');
            background-size: cover; 
            background-attachment: fixed;
            color: white;
        }

        .claim-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 5%;
        }

        .glass-form {
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 600px;
        }

        .item-preview-img {
            max-width: 100%;
            max-height: 300px;
            border-radius: 15px;
            margin-bottom: 20px;
            border: 2px solid var(--cabuyao-yellow);
            object-fit: cover;
        }

        .item-details-text h2 { color: var(--cabuyao-yellow); margin-bottom: 10px; }
        .item-details-text p { font-style: italic; color: rgba(255,255,255,0.8); margin-bottom: 25px; }

        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; }
        
        .input-ctrl {
            border: none;
            background: rgba(255,255,255,0.9);
            margin-bottom: 20px;
        }

        .submit-btn {
            width: 100%; background: var(--cabuyao-green); color: white;
            padding: 15px; border: none; border-radius: 100px;
            font-weight: bold; cursor: pointer; transition: 0.3s;
            text-transform: uppercase;
        }

        .submit-btn:hover { background: #008a49; transform: translateY(-3px); }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <uc:SiteHeader runat="server" ID="SiteHeader" />
        
        <div class="claim-container">
            <asp:Panel ID="pnlClaimForm" runat="server" CssClass="glass-form">
                <div style="text-align:center;" class="item-details-text">
                    <asp:Image ID="imgItem" runat="server" CssClass="item-preview-img zoomable-image" data-viewer="true" />
                    <h2><asp:Label ID="lblItemTitle" runat="server"></asp:Label></h2>
                    <p><asp:Label ID="lblItemDesc" runat="server"></asp:Label></p>
                </div>

                <div class="form-group">
                    <label>Proof of Ownership</label>
                    <asp:TextBox ID="txtProof" runat="server" TextMode="MultiLine" Rows="4" CssClass="input-ctrl" 
                        placeholder="Describe what's inside or unique marks only the owner would know..."></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Supporting Image (Optional)</label>
                    <div style="background: rgba(255,255,255,0.1); padding: 15px; border-radius: 10px; border: 2px dashed rgba(255,255,255,0.2);">
                        <asp:FileUpload ID="fuProofImage" runat="server" ForeColor="White" />
                    </div>
                </div>

                <br />
                <asp:Button ID="btnSubmitClaim" runat="server" Text="Submit Claim Request" 
                    CssClass="submit-btn" OnClick="btnSubmitClaim_Click" />
                
                <asp:Label ID="lblError" runat="server" ForeColor="Red" style="display:block; margin-top:10px;"></asp:Label>
            </asp:Panel>

            <asp:Panel ID="pnlSuccess" runat="server" CssClass="glass-form" Visible="false" style="text-align:center;">
                <h2 style="color:var(--cabuyao-yellow);">Request Submitted!</h2>
                <p style="margin: 20px 0;">Your claim for the <strong><asp:Literal ID="litItemName" runat="server"></asp:Literal></strong> has been sent to the Admin.</p>
                <p>The Admin will review your proof and contact you soon.</p>
                <br />
                <a href="FindItem.aspx" class="submit-btn" style="text-decoration:none; display:inline-block; width:auto; padding: 10px 30px;">Back to Gallery</a>
            </asp:Panel>
        </div>

        <uc:SiteFooter runat="server" ID="SiteFooter" />
    </form>
    <script src="scripts/image-viewer.js"></script>
</body>
</html>
