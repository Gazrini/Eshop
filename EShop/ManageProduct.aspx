<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProduct.aspx.cs" Inherits="EShop.ManageProduct" %>

<%@ Register Src="UserControls/ManageProduct.ascx" TagName="ManageProduct" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/ManageProductCategoriesList.ascx" TagPrefix="uc1" TagName="ManageProductCategoriesList" %>

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
                <uc1:ManageProductCategoriesList runat="server" ID="ManageProductCategoriesList" />
                <br />
                <uc1:ManageProduct ID="ManageProduct1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
