<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="supplier_details.aspx.cs" Inherits="inventory_management_system.supplier_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="newuser">Add New Supplier</h2>
    <form runat="server">
        <asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
        <div class="form-group">
            <asp:TextBox ID="inputName" class="form-control" runat="server" placeholder="Supplier's Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredName" ControlToValidate="inputName" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Supplier's Name is required**"></asp:RequiredFieldValidator>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <asp:TextBox ID="inputAddress" class="form-control" runat="server" placeholder="Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredEmail" ControlToValidate="inputAddress" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Address is required**"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group col-md-6">
                <asp:TextBox ID="inputPhone" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredPhone" ControlToValidate="inputPhone" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Phone is required**"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="phoneValid" runat="server" ControlToValidate="inputPhone" ValidationGroup="UserFieldValidation" ForeColor="#e30e0e" ErrorMessage="Phone number shouldn't be less than 9 digits!" ValidationExpression="[0-9]{9,}"></asp:RegularExpressionValidator>
            </div>
        </div>

        <asp:Button ID="addBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" Style="color: #fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Add Supplier" OnClick="addBtn_Click" />
        <asp:Button ID="updateBtn" class="btn btn-add" ValidationGroup="CategoryFieldValidation" style=" color:#fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Update Supplier" OnClick="updateBtn_Click" />
		
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
        <h2 class="newuser">Supplier Details</h2>
        <div class="table-responsive-lg">
            <asp:GridView ID="newSupplierTable" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnRowCommand="SupplierSelectCommand">
                <Columns>
                    <asp:BoundField DataField="supplier_id" HeaderText="Supplier Id" />
                    <asp:BoundField DataField="supplier_name" HeaderText="Supplier Name" />
                    <asp:BoundField DataField="address" HeaderText="Address" />
                    <asp:BoundField DataField="phone_no" HeaderText="Phone Number" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="supplierEdit" CssClass="btn btn-success" runat="server" Text="Edit" CommandName="editsupplier" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
                            <asp:Button ID="supplierDelete" CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="deletesupplier" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CausesValidation="false" />
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
