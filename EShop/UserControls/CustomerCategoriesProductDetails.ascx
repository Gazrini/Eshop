<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerCategoriesProductDetails.ascx.cs" Inherits="EShop.UserControls.CustomerCategoriesProductDetails" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>"
    SelectCommand="SELECT * FROM [products] WHERE ([prod_id] = @prod_id)">
    <SelectParameters>
        <asp:QueryStringParameter Name="prod_id" QueryStringField="prod_id" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:DataList ID="DataList1" runat="server" DataKeyField="prod_id" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <div align="center">
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Images/" + Eval("prod_image") %>'
                Height="200" BorderStyle="Solid" BorderWidth="1" />
        </div>
        <br />
        <div align="center">
            Title:
        <asp:Label ID="lblprod_title" runat="server" Text='<%# Eval("prod_title") %>' />
        </div>
        <br />
        <div align="center">
            Price:
        <asp:Label ID="lblprod_price" runat="server" Text='<%# Eval("prod_price", "RM {0:n2}") %>' />
        </div>
        <br />
        <div align="center">
            Description:
        <asp:Label ID="lblprod_desc" runat="server" Text='<%# Eval("prod_desc") %>' />
        </div>
        <br />
        <div align="center">
            <asp:Button ID="ButtonBack" runat="server" Text="Back" PostBackUrl='<%# "~/CustomerCategoriesListDisplay.aspx?cat_id=" + Eval("cat_id") %>' />
            <br />
        </div>
    </ItemTemplate>
</asp:DataList>