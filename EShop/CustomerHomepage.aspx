<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CustomerHomepage.aspx.cs" Inherits="EShop.CustomerHomepage" %>

<%@ Register Src="UserControls/CustomerHomepage.ascx" TagName="CustomerHomepage" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CustomerSearchBox.ascx" TagPrefix="uc2" TagName="CustomerSearchBox" %>
<%@ Register Src="~/UserControls/CustomerCategoriesList.ascx" TagPrefix="uc2" TagName="CustomerCategoriesList" %>

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
                <uc2:CustomerCategoriesList runat="server" ID="CustomerCategoriesList" />
                <br />
                <uc2:CustomerSearchBox runat="server" ID="CustomerSearchBox" />
                <br />
                <uc2:CustomerHomepage ID="CustomerHomepage1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
