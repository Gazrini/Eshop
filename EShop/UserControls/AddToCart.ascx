<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.ascx.cs" Inherits="EShop.UserControls.AddToCart" %>

<div align="center">
    You have 
    <strong>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </strong>&nbsp;products in your cart
</div>
<br />
<div align="center">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerProducts.aspx">Continue Shopping</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ondatabound="gv_DataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="2">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="No">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prod_title" HeaderText="Product Name">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlFormatString="../Images/{0}" HeaderText="Image" DataImageUrlField="prod_image">
                <ItemStyle HorizontalAlign="Center" />
                <ControlStyle Width="150px" />
            </asp:ImageField>
            <asp:BoundField DataField="prod_price" DataFormatString="RM {0:n2}" HeaderText="Price">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="totalprice" DataFormatString="RM {0:n2}" HeaderText="Total Price">
                <FooterStyle HorizontalAlign="Center"></FooterStyle>
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:CommandField SelectText="Modify" ShowSelectButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True">
                <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <HeaderStyle Height="50px" />
        <PagerSettings PageButtonCount="2" />
    </asp:GridView>
</div>
<br />
<table style="border: thin double #000000" align="center">
    <tr>
        <td>Enter discount code</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Apply " OnClick="Button1_Click" />
        </td>
    </tr>
    <tr>
        <td>Discount</td>
        <td>
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Discount price</td>
        <td>
            <strike><asp:Label ID="Label4" runat="server"></asp:Label></strike>
            <asp:Label ID="Label5" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Button ID="Button2" runat="server" Text="Checkout" OnClick="Button2_Click" />
</div>
<br />
<div align="center">
    <asp:Label ID="Label2" runat="server"></asp:Label>
</div>
