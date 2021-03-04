<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAdmin.aspx.cs" Inherits="EShop.ViewAdmin" %>

<%@ Register Src="UserControls/ViewAdmin.ascx" TagName="ViewAdmin" TagPrefix="uc1" %>
<%@ Register Src="UserControls/AdminAccount.ascx" TagName="AdminAccount" TagPrefix="uc2" %>

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
                <asp:HyperLink ID="ViewUsersLink" runat="server" NavigateUrl="~/ViewUsers.aspx" Width="214px">View Customers</asp:HyperLink>
                <br />
                <br />
                <uc2:AdminAccount ID="AdminAccount1" runat="server" />
                <uc1:ViewAdmin ID="ViewAdmin1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
