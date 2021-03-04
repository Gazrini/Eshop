<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerSearchBox.ascx.cs" Inherits="EShop.UserControls.CustomerSearchBox" %>

&nbsp;<div>
    <asp:TextBox ID="TextBoxCustomerSearch" runat="server"></asp:TextBox>
    &nbsp;<asp:Button ID="ButtonCustomerSearch" runat="server" Text="Search" OnClick="ButtonCustomerSearch_Click" />
</div>

