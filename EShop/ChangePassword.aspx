<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EShop.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div align="center">
        <b>Change Password</b>
    </div>
    <br />
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <div style="font-family: Arial">
                    <table style="border: 1px solid black">
                        <tr>
                            <td>New Password
                            </td>
                            <td>:<asp:TextBox ID="txtNewPassword" TextMode="Password"
                                runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPassword"
                                    runat="server" ErrorMessage="New password required"
                                    Text="*" ControlToValidate="txtNewPassword" ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Confirm New Password
                            </td>
                            <td>:<asp:TextBox ID="txtConfirmNewPassword" TextMode="Password" runat="server">
                            </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmNewPassword"
                                    runat="server" ErrorMessage="Confirm new password required" Text="*"
                                    ControlToValidate="txtConfirmNewPassword"
                                    ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
                                    ErrorMessage="New password and confirm new password must match"
                                    ControlToValidate="txtConfirmNewPassword" ForeColor="Red"
                                    ControlToCompare="txtNewPassword"
                                    Display="Dynamic" Type="String" Operator="Equal" Text="*">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>&nbsp;<asp:Button ID="btnSave" runat="server"
                                Text="Save" OnClick="btnSave_Click" Width="70px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:Label ID="lblMessage" runat="server">
        </asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:ValidationSummary ID="ValidationSummary1"
            ForeColor="Red" runat="server" DisplayMode="List" />
    </div>
</asp:Content>
