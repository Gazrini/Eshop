<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="EShop.AdminAccount" %>
<%@ Register Src="UserControls/AdminAccount.ascx" TagName="AdminAccount" TagPrefix="uc1" %>
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
                <uc1:AdminAccount ID="AdminAccount1" runat="server" />
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>
</asp:Content>
