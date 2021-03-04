<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="CategoriesListDisplay.aspx.cs" Inherits="EShop.CategoriesListDisplay" %>

<%@ Register src="UserControls/CategoriesListPage.ascx" tagname="CategoriesListPage" tagprefix="uc1" %>
<%@ Register Src="~/UserControls/SearchBox.ascx" TagPrefix="uc1" TagName="SearchBox" %>
<%@ Register Src="~/UserControls/CategoriesList.ascx" TagPrefix="uc1" TagName="CategoriesList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table style="width:100%;">
        <tr>
            <td rowspan="3">&nbsp;</td>
            <td>&nbsp;</td>
            <td rowspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td align ="center">
                <div align="center"><b>Category</b></div>
                <uc1:CategoriesList runat="server" ID="CategoriesList" />
                <br />
                <uc1:SearchBox runat="server" ID="SearchBox" />
                <br />
                <uc1:CategoriesListPage ID="CategoriesListPage1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
