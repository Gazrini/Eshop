﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="EwalletPage.aspx.cs" Inherits="EShop.EwalletPage" %>
<%@ Register src="UserControls/Ewallet.ascx" tagname="Ewallet" tagprefix="uc1" %>
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
                <uc1:Ewallet ID="Ewallet1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
