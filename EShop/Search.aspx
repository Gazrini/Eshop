<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="EShop.Search" %>

<%@ Register src="UserControls/SearchPage.ascx" tagname="SearchPage" tagprefix="uc1" %>
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
                <uc1:CategoriesList runat="server" ID="CategoriesList" />
                <br />
                <uc1:SearchBox runat="server" ID="SearchBox" />
                <br />
                <uc1:SearchPage ID="SearchPage1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
