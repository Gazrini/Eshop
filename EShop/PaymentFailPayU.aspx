<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentFailPayU.aspx.cs" Inherits="EShop.PaymentFailPayU" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 57px;
            width: 125px;
        }
    </style>
</head>
<body>
    <meta http-equiv="refresh" content="6; url=CustomerHomepage.aspx"/>
    <form id="form1" runat="server">
        <div align="center">
            <img src="payubizlogo.jpg" class="auto-style1" />
        </div>
        <div align="center">
            Error
            has been occured</div>
        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
