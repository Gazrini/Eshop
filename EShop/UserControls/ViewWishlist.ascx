<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewWishlist.ascx.cs" Inherits="EShop.UserControls.ViewWishlist" %>

<div align="center">
    You have 
    <strong>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </strong>&nbsp;products in your wishlist
</div>
<br />
<div align="center">
    <asp:HyperLink ID="AddWishlistLink" runat="server" NavigateUrl="~/AddWishlist.aspx">Add Wishlist</asp:HyperLink>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ondatabound="gv_DataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="2">
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
        </Columns>
        <HeaderStyle Height="50px" />
        <PagerSettings PageButtonCount="2" />
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:LinkButton ID="LinkButtonClear" runat="server" OnClick="LinkButtonClear_Click">Clear wishlist</asp:LinkButton>
</div>
<br />
<div align="center">
    <asp:Button ID="Button1" runat="server" Text="Checkout" OnClick="Button1_Click" />
</div>
