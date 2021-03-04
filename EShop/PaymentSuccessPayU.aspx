<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccessPayU.aspx.cs" Inherits="EShop.PaymentSuccessPayU" %>

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
            Thank you for purchasing using PayU biz
        </div>
        <br />
        <div align="center">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <br />
        <div align="center">
            <table style="border: thin double #000000">
                <tr>
                    <td>Name:</td>
                    <td align="center">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td align="center">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td align="center">
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Order Id:</td>
                    <td align="center">
                        <asp:Label ID="Label5" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td align="center">RM<asp:Label ID="Label6" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
