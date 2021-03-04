<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Email.ascx.cs" Inherits="EShop.UserControls.Email" %>
<div align="center"><b>Send discount code</b></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Total customers</td>
        <td>
            <b>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </b>
        </td>
    </tr>
    <tr>
        <td>Subject</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True">Discount code</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Enter code</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Height="100px" Width="200px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear" CausesValidation="False" />
            <asp:Button ID="Button1" runat="server" Text="Send" OnClick="Button1_Click" />
        </td>
    </tr>
</table>
<br />
<div align="center">
    <b>Select customers:</b>
</div>
<br />
<div align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Name" SortExpression="username">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <itemstyle horizontalalign="Center" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div align="center">
    <asp:Label ID="Label2" runat="server"></asp:Label>
</div>
<br />
<div align="center">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStringStoreDB %>" SelectCommand="SELECT [username], [email] FROM [users]"></asp:SqlDataSource>
</div>


