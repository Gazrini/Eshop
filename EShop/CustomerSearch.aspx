<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CustomerSearch.aspx.cs" Inherits="EShop.CustomerSearch" %>
<%@ Register src="UserControls/CustomerSearchPage.ascx" tagname="CustomerSearchPage" tagprefix="uc1" %>
<%@ Register Src="~/UserControls/CustomerCategoriesList.ascx" TagPrefix="uc1" TagName="CustomerCategoriesList" %>
<%@ Register Src="~/UserControls/CustomerSearchBox.ascx" TagPrefix="uc1" TagName="CustomerSearchBox" %>

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
                <uc1:CustomerCategoriesList runat="server" ID="CustomerCategoriesList" />
                <br />
                <uc1:CustomerSearchBox runat="server" ID="CustomerSearchBox" />
                <br />
                <uc1:CustomerSearchPage ID="CustomerSearchPage1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
