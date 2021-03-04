<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="EShop.UserControls.SearchBox" %>

&nbsp;<div>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="False" />
</div>
