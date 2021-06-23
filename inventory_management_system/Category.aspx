<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="inventory_management_system.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="newuser">Add New Category</h2>
	<form runat="server">
        <asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
		<div class="form-row">
			<div class="form-group col-md-6">
				<asp:TextBox ID="inputCategory" class="form-control" runat="server" placeholder="Category Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredCategory" ControlToValidate="inputCategory" runat="server" ValidationGroup="CategoryFieldValidation" ForeColor="Red" ErrorMessage="**Category is required**"></asp:RequiredFieldValidator>
			</div>
		</div>
		<asp:Button ID="addBtn" class="btn btn-add" ValidationGroup="CategoryFieldValidation" style=" color:#fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Add Category" OnClick="addBtn_Click" />
		<asp:Button ID="updateBtn" class="btn btn-add" ValidationGroup="CategoryFieldValidation" style=" color:#fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Update Category" OnClick="updateBtn_Click" />
		
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
        <h2 class="newuser">Category Details</h2>
        <div class="table-responsive-lg">
            <asp:GridView ID="newCategoryTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="CategorySelectCommand">
                <Columns>
                    <asp:BoundField DataField="category_id" HeaderText="Category Id" />
                    <asp:BoundField DataField="category_type" HeaderText="Category Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="categoryEdit" CssClass="btn btn-success" runat="server" Text="Edit" CommandName="editcategory" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
                            <asp:Button ID="categoryDelete" CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="deletecategory" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
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
