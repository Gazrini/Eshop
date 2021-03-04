<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WishListEditOrder.ascx.cs" Inherits="EShop.UserControls.WishListEditOrder" %>

<div align="center"><b>Modify</b></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>No:</td>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Product Name:</td>
        <td>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>RM
                <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Quantity:</td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Total Price:</td>
        <td>RM 
                <asp:Label ID="Label4" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
        </td>
    </tr>
</table>
