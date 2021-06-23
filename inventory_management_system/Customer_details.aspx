<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="Customer_details.aspx.cs" Inherits="inventory_management_system.Customer_details1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="newuser">Add New Customer</h2>
	<form runat="server">
        <asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
		<div class="form-group">
            <asp:TextBox ID="inputName" class="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredName" ControlToValidate="inputName" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Full Name is required**"></asp:RequiredFieldValidator>
		</div>
		<div class="form-row">				
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputEmail" class="form-control" runat="server" placeholder="Email"></asp:TextBox>
				  <asp:RequiredFieldValidator ID="RequiredEmail" ControlToValidate="inputEmail" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Email is required**"></asp:RequiredFieldValidator>
				  <asp:RegularExpressionValidator ID="emailValid" runat="server" ValidationGroup="UserFieldValidation" ValidationExpression="\w+@\w+([-.]\w+).\w+([-.]\w+)*" ControlToValidate="inputEmail" ForeColor="Red" ErrorMessage="**Incorrect Email Format**"></asp:RegularExpressionValidator>
			</div>
			<div class="form-group col-md-6">
				<asp:DropDownList ID="CustDropDown" CssClass="" style=" color: #737373; font-size: .8rem; border-radius: 10rem; padding: 0.9rem 2.5rem; border: 1px solid #ced4da;" runat="server">
					<asp:ListItem Text="Regular"></asp:ListItem>
					<asp:ListItem Text="New"></asp:ListItem>
				</asp:DropDownList>
			</div>
		</div>
		<div class="form-group">
			<asp:TextBox ID="inputAddress" class="form-control" runat="server" placeholder="Address"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredAddress" ControlToValidate="inputAddress" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Address is required**"></asp:RequiredFieldValidator>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputPhone" class="form-control" runat="server" placeholder="Contact Number"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredPhone" ControlToValidate="inputPhone" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Phone is required**"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="phoneValid" runat="server" ControlToValidate="inputPhone" ValidationGroup="UserFieldValidation" ForeColor="#e30e0e" ErrorMessage="Phone number shouldn't be less than 9 digits!" ValidationExpression="[0-9]{9,}"></asp:RegularExpressionValidator>
			</div>
		</div>
		<asp:Button ID="addBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" Style="color: #fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Add Customer" OnClick="addBtn_Click" />
        
        <asp:Button ID="updateBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" Style="color: #fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Update Customer" OnClick="updateBtn_Click" />
		
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
        <h2 class="newuser">Customer Details</h2>
        <div class="table-responsive-lg">
            <asp:GridView ID="newCustomerTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="CustomerSelectCommand">
                 <Columns>
                    <asp:BoundField DataField="member_number" HeaderText="Memeber Number" />
                    <asp:BoundField DataField="name" HeaderText="Full Name" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="contact_no" HeaderText="Phone Number" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="member_type" HeaderText="Member Type" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="userEdit" CssClass="btn btn-success" runat="server" Text="Edit" CommandName="editcustomer" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
                            <asp:Button ID="userDelete" CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="deletecustomer" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
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
