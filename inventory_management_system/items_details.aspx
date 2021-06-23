<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="items_details.aspx.cs" Inherits="inventory_management_system.items_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2 class="newuser">Add New Items</h2>
	<form runat="server">
		<asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
		<div class="form-group">
            <asp:TextBox ID="inputName" class="form-control" runat="server" placeholder="Item Name"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredName" ControlToValidate="inputName" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Item Name is required**"></asp:RequiredFieldValidator>
		</div>

		<div class="form-group">
				<asp:TextBox ID="inputDesc" class="form-control" runat="server" placeholder="Description"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredDesc" ControlToValidate="inputDesc" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Description is required**"></asp:RequiredFieldValidator>
		</div>
		<div class="form-row">				
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputQuantity" class="form-control" runat="server" placeholder="Quantity"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredQuantity" ControlToValidate="inputQuantity" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Quantity is required**"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputPrice" class="form-control" runat="server" placeholder="Price"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredPrice" ControlToValidate="inputPrice" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Price is required**"></asp:RequiredFieldValidator>
			</div>
		</div>

		<div class="form-row">				
			<div class="form-group col-md-4">
				<asp:TextBox ID="inputPurchase" class="form-control" runat="server" placeholder="Purchase Date"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredPurchase" ControlToValidate="inputPurchase" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Purchase Date is required**"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<asp:TextBox ID="inputManufacture" class="form-control" runat="server" placeholder="Manufacture Date"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredManuFacture" ControlToValidate="inputManufacture" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Manufacture Date is required**"></asp:RequiredFieldValidator>
			</div>
			<div class="form-group col-md-4">
				<asp:TextBox ID="inputExpiry" class="form-control" runat="server" placeholder="Expiry Date"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredExpiry" ControlToValidate="inputExpiry" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Expiry Date is required**"></asp:RequiredFieldValidator>
			</div>
		</div>

        <div class="form-row">
			<div class="form-group col-md-3">
				<asp:DropDownList ID="CategoryDropDown" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server">
				</asp:DropDownList>
			</div>

			<div class="form-group"	>
				<asp:DropDownList ID="SupplierDropDown" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server">
				</asp:DropDownList>
			</div>
        </div>
	
		<asp:Button ID="addBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" style=" color:#fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Add Items" OnClick="addBtn_Click" />
		<asp:Button ID="updateBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" style=" color:#fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Update Items" OnClick="updateBtn_Click" />
		
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
        <h2 class="newuser">Item Details</h2>
        <div class="table-responsive-lg">
            <asp:GridView ID="newItemTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="ItemSelectCommand">
                <Columns>
                    <asp:BoundField DataField="item_id" HeaderText="Item Id" />
                    <asp:BoundField DataField="item_name" HeaderText="Item Name" />
                    <asp:BoundField DataField="description" HeaderText="Description" />
                    <asp:BoundField DataField="unit_price" HeaderText="Price" />
                    <asp:BoundField DataField="purchase_date" HeaderText="Purchase Date" />
                    <asp:BoundField DataField="manufacture_date" HeaderText="Manufacture Date" />
                    <asp:BoundField DataField="expiry_date" HeaderText="Expiry Date" />
                    <asp:BoundField DataField="category_type" HeaderText="Category" />
                    <asp:BoundField DataField="quantity_available" HeaderText="Quantity" />
                    <asp:BoundField DataField="supplier_name" HeaderText="Supplier" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="itemEdit" CssClass="btn btn-success" runat="server" Text="Edit" CommandName="edititem" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
                            <asp:Button ID="itemDelete" CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="deleteitem" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
