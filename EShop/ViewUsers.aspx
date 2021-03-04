<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="EShop.ViewUsers" %>

<%@ Register Src="UserControls/ViewUsers.ascx" TagName="ViewUsers" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CustomerAccount.ascx" TagPrefix="uc1" TagName="CustomerAccount" %>

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
                <asp:HyperLink ID="ViewUsersLink" runat="server" NavigateUrl="~/ViewAdmin.aspx" Width="214px">View Admin</asp:HyperLink>
                <br />
                <br />
                <uc1:CustomerAccount runat="server" ID="CustomerAccount" />
                <uc1:ViewUsers ID="ViewUsers1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
