<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="Purchase_history.aspx.cs" Inherits="inventory_management_system.Purchase_history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="form-group col-md-6">
                <h2 class="newuser">Customer Purchase History</h2>
				<asp:DropDownList ID="CustomerDropDown" AutoPostBack="true" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server" OnSelectedIndexChanged="CustomerDropDown_SelectedIndexChanged">
				</asp:DropDownList>
			</div>
        <div class="mt-4" style="padding-top:20px;">
            <div class="table-responsive-lg">
                <asp:GridView ID="newItemTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="item_name" HeaderText="Item Name" />
                        <asp:BoundField DataField="category_type" HeaderText="Category" />
                        <asp:BoundField DataField="unit_price" HeaderText="Price" />
                        <asp:BoundField DataField="quantity_bought" HeaderText="Quantity" />
                        <asp:BoundField DataField="sales_date" HeaderText="Sales Date" />
                        <asp:BoundField DataField="total_amount" HeaderText="Total Amount" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="" Font-Bold="True" ForeColor="#B721FF" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
