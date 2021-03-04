<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GuestProducts.ascx.cs" Inherits="EShop.UserControls.GuestProducts" %>

<div align="center">
    You have&nbsp;
    <strong>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </strong>&nbsp;products in your cart
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
</div>

<div align="center">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="prod_id" RepeatDirection="Horizontal" RepeatColumns="3" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <table>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("prod_title") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/" + Eval("prod_image") %>' Height="100" BorderStyle="Solid" BorderWidth="1" />
                    </td>
                </tr>
                <tr>
                    <td align="center">Price RM
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("prod_price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">Quantity
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/addtocart.png" Width="150px" CommandArgument='<%# Eval("prod_id")%>' CommandName="addtocart" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/viewdetails.png" Width="100px" PostBackUrl='<%# "~/ProductDetails.aspx?prod_id=" + Eval("prod_id") %>' Text='<%# Eval("prod_title") %>' />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <div>
        <asp:Button ID="Button1" runat="server" Text="&lt;" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="&gt;" OnClick="Button2_Click" />
    </div>
</div>

