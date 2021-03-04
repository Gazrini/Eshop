<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CustomerCategoriesProductDetailsDisplay.aspx.cs" Inherits="EShop.CustomerCategoriesProductDetailsDisplay" %>

<%@ Register Src="~/UserControls/CustomerCategoriesProductDetails.ascx" TagPrefix="uc1" TagName="CustomerCategoriesProductDetails" %>

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
            <td align="center">
                <uc1:CustomerCategoriesProductDetails runat="server" ID="CustomerCategoriesProductDetails" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
