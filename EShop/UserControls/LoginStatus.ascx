<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="EShop.UserControls.LoginStatus" %>

<asp:Label ID="LabelLoginStatus" runat="server"></asp:Label>
<div>
    <asp:Button ID="ButtonLogout" runat="server" Text="Logout" align= "center" OnClick="btnLogout_Click" style="height: 29px" />
</div>