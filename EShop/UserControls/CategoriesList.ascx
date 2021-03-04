<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoriesList.ascx.cs" Inherits="EShop.UserControls.CategoriesList" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>"
    SelectCommand="SELECT * FROM [categories]"></asp:SqlDataSource>
<asp:DataList ID="DataList1" runat="server"
    DataKeyField="cat_id" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
    <ItemTemplate>
        <asp:HyperLink ID="HyperLink1" Text='<%# Eval("cat_title") %>' runat="server" NavigateUrl='<%# "~/CategoriesListDisplay.aspx?cat_id=" + Eval("cat_id") %>'></asp:HyperLink>
        <br />
    </ItemTemplate>
</asp:DataList>
