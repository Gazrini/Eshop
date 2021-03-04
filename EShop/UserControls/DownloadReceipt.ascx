<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DownloadReceipt.ascx.cs" Inherits="EShop.UserControls.DownloadReceipt" %>
<div align="center">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomersOrders.aspx">View Orders</asp:HyperLink>
</div>
<br />
<div align="center"><b>Download receipt</b></div>
<br />
<table align="center" style="border: thin double #000000">
    <tr>
        <td>Order Id</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="Button3" runat="server" Text="Clear" OnClick="Button3_Click" />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </td>
    </tr>
</table>
<br />
<div align="center">
    <asp:Label ID="Label8" runat="server" Text="Enter order Id"></asp:Label>
</div>
<br />
<div align="center">
    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
</div>
<br />
<div align="center">
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <table border="1">
            <tr>
                <td>
                    <div align="center">
                        <b>Eshop Receipt</b>
                    </div>
                </td>
            </tr>
            <tr>
                <td><b>Order Id:</b><br />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <b>Order Date:</b><br />
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <b>Buyer Address:</b>
                                <br />
                                <asp:Label ID="Label4" runat="server"></asp:Label>
                                <br />
                                <br />
                                <b>Buyer Name:</b>
                                <br />
                                <asp:Label ID="Label5" runat="server"></asp:Label>
                                <br />
                                <br />
                                <b>Phone:</b>
                                <br />
                                <asp:Label ID="Label6" runat="server"></asp:Label>
                                <br />
                            </td>
                            <td>
                                <b>Seller:</b>
                                <br />
                                Eshop Sdn Bhd
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div align="center"><b>Product details</b></div>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="450px">
                        <Columns>
                            <asp:BoundField DataField="sno" HeaderText="No">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="prod_title" HeaderText="Product Name">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="prod_price" DataFormatString="RM {0:n2}" HeaderText="Price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalprice" DataFormatString="RM {0:n2}" HeaderText="Total Price">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <b>Grand Total: RM<asp:Label ID="Label7" runat="server"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td>Declaration: We declare that this receipt shows actual price of the goods described inclusive of taxes and that all particulars are correct.
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
</div>
<br />
<br />
<div align="center">
    <asp:Button ID="Button2" runat="server" Text="Download" OnClick="Button2_Click" Visible="False" />
</div>

