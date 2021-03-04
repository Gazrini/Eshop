<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProductCategoriesListDisplay.aspx.cs" Inherits="EShop.ManageProductCategoriesListDisplay" %>

<%@ Register Src="UserControls/ManageProductCategoriesList.ascx" TagName="ManageProductCategoriesList" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/ManageProductCategoriesListPage.ascx" TagPrefix="uc1" TagName="ManageProductCategoriesListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td rowspan="3">&nbsp;</td>
            <td>&nbsp;</td>
            <td rowspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <div align="center"><b>Category</b></div>
                <uc1:ManageProductCategoriesList ID="ManageProductCategoriesList1" runat="server" />
                <br />
                <uc1:ManageProductCategoriesListPage ID="ManageProductCategoriesListPage" runat="server"  />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
