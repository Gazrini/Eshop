<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Checkout.ascx.cs" Inherits="EShop.UserControls.Checkout" %>
<form>
    <table align="center" style="border: thin double #000000">
        <tr>
            <td>Order ID</td>
            <td>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Order Date</td>
            <td>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="197px" ShowFooter="True" Width="603px">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="No">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="prod_title" HeaderText="Product Name">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="prod_image" DataImageUrlFormatString="~\images\{0}" HeaderText="Image">
                    <ItemStyle HorizontalAlign="Center" />
                    <ControlStyle Height="90px" />
                </asp:ImageField>
                <asp:BoundField DataField="prod_price" DataFormatString="RM {0:n2}" HeaderText="Price">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="totalprice" DataFormatString="RM {0:n2}" HeaderText="Total Price">
                    <FooterStyle HorizontalAlign="Center"></FooterStyle>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <table align="center" style="border: thin double #000000">
        <tr>
            <td>Name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="143px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="143px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="143px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Height="78px" TextMode="MultiLine" Width="207px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <div align="center">
        <b>Amount to pay: RM
        <asp:Label ID="LabelPayU" runat="server"></asp:Label></b>
    </div>
    <br />
    <div align="center">
        <b>E-wallet Account Number:
        <asp:Label ID="LabelEwallet" runat="server"></asp:Label>&nbsp;and your balance is RM <asp:Label ID="LabelBalance" runat="server"></asp:Label></b>
    </div>
    <br />
    <div align="center">
        Select payment method:
    </div>
    <br />
    <div align="center">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cash" />
        <input type="hidden" runat="server" id="key" name="key" value="gtKFFx" />
        <input type="hidden" runat="server" id="salt" name="salt" value="eCwWELxi" />
        <input type="hidden" runat="server" id="hash" name="hash" value="" />
        <input type="hidden" runat="server" id="txnid" name="txnid" value="" />
        <asp:Button ID="Button2" runat="server" Text="PayU" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Paypal" OnClick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="Ewallet" OnClick="Button4_Click" />
    </div>
    <br />
    <div align="center">
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </div>
    <br />
    <div align="center">
        <asp:Label ID="LabelStatus" runat="server"></asp:Label>
        <asp:Label ID="LabelStatus2" runat="server"></asp:Label>
        <asp:Label ID="LabelStatus3" runat="server"></asp:Label>
    </div>
</form>
