<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="inventory_management_system.Dashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="form-group col-md-6">
                <h2 class="newuser">Item Out of Stock</h2>
				<asp:DropDownList ID="sortDropDown" CssClass="" AutoPostBack="true" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server" OnSelectedIndexChanged="sortDropDown_SelectedIndexChanged">
					<asp:ListItem Text="Item Name"></asp:ListItem>
                    <asp:ListItem Text="Purchase Date"></asp:ListItem>
					<asp:ListItem Text="Quantity"></asp:ListItem>
				</asp:DropDownList>
			</div>
        <div class="mt-4" style="padding-top:20px;">
            <div class="table-responsive-lg">
                <asp:GridView ID="newItemTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="item_id" HeaderText="Item Id" />
                        <asp:BoundField DataField="item_name" HeaderText="Item Name" />
                        <asp:BoundField DataField="description" HeaderText="Description" />
                        <asp:BoundField DataField="unit_price" HeaderText="Price" />
                        <asp:BoundField DataField="category_type" HeaderText="Category" />
                        <asp:BoundField DataField="supplier_name" HeaderText="Supplier" />
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
                
        <div class="mt-4" style="padding-top:20px;">
            <h2 class="newuser">Unsold Items</h2>
            <div class="table-responsive-lg">
                <asp:GridView ID="unsoldItemTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="item_id" HeaderText="Item Id" />
                        <asp:BoundField DataField="item_name" HeaderText="Item Name" />
                        <asp:BoundField DataField="description" HeaderText="Description" />
                        <asp:BoundField DataField="unit_price" HeaderText="Price" />
                        <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" />
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

        <div class="mt-4" style="padding-top:20px;">
            <h2 class="newuser">Inactive Customer</h2>
            <div class="table-responsive-lg">
                <asp:GridView ID="inactiveCustomerTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="member_number" HeaderText="Member Number" />
                        <asp:BoundField DataField="name" HeaderText="Full Name" />
                        <asp:BoundField DataField="address" HeaderText="Address" />
                        <asp:BoundField DataField="contact_no" HeaderText="Phone Number" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
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
