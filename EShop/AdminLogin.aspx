﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EShop.AdminLogin" %>
<%@ Register src="UserControls/AdminLogin.ascx" tagname="AdminLogin" tagprefix="uc1" %>
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
                <uc1:AdminLogin ID="AdminLogin1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
