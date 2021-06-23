<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="sales_details.aspx.cs" Inherits="inventory_management_system.sales_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="newuser">Add Sales Details</h2>
	<form runat="server">
        <asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
		<div class="form-row">
			<div class="form-group col-md-6">
				<asp:DropDownList ID="ItemDropDown" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server">
				</asp:DropDownList>
			</div>
		</div>
		<br>
		<div class="form-row">				
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputQuantity" class="form-control" runat="server" placeholder="Quantity"></asp:TextBox>
				  <asp:RequiredFieldValidator ID="RequiredQuantity" ControlToValidate="inputQuantity" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Quantity is required**"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-6">
				<asp:DropDownList ID="CustDropDown" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server">
				</asp:DropDownList>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputAmount" class="form-control" runat="server" placeholder="Total Amount"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredAmount" ControlToValidate="inputAmount" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Amount is required**"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputSalesDate" class="form-control" runat="server" placeholder="Sales Date"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredSalesDate" ControlToValidate="inputAmount" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Sales Rate is required**"></asp:RequiredFieldValidator>
			</div>
		</div>
		<asp:Button ID="addBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" Style="color: #fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Add Sales Details" OnClick="addBtn_Click" />
		
		<asp:Panel ID="pnlSuccess" runat="server" Visible="false">
            <div class="alert alert-success mt-3 alert-dismissible fade show" role="alert">
                <asp:Label ID="alrtSuccess" Text="" runat="server" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="alert alert-danger mt-3 alert-dismissible fade show" role="alert">
            <asp:Label ID="alrtError" Text="" runat="server" />
        </div>
        </asp:Panel>

		<div class="mt-4" style="padding-top:20px;">
        <h2 class="newuser">Billing Details</h2>
        <div class="table-responsive-lg">
            <asp:GridView ID="newSalesTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="SalesSelectCommand">
                <Columns>
                    <asp:BoundField DataField="sales_id" HeaderText="Sales Id" />
                    <asp:BoundField DataField="item_name" HeaderText="Item" />
                    <asp:BoundField DataField="quantity_bought" HeaderText="Quantity" />
                    <asp:BoundField DataField="total_amount" HeaderText="Total Amount" />
                    <asp:BoundField DataField="name" HeaderText="Customer" />
                    <asp:BoundField DataField="sales_date" HeaderText="Sales Date" />
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
