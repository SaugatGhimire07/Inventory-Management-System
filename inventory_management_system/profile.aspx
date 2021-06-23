<%@ Page Title="" Language="C#" MasterPageFile="~/nav.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="inventory_management_system.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="newuser">Change Password</h2>
    <form runat="server">
        <asp:TextBox ID="inputId" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
        <div class="form-row">
            <div class="form-group col-md-6">
            <asp:TextBox ID="inputPassword" class="form-control" runat="server" placeholder="Enter New Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredPassword" ControlToValidate="inputPassword" runat="server" ValidationGroup="UserFieldValidation" ForeColor="Red" ErrorMessage="**Password is required**"></asp:RequiredFieldValidator>
        </div>
        </div>

        <asp:Button ID="updateBtn" class="btn btn-add" ValidationGroup="UserFieldValidation" Style="color: #fff; background-color: #21D4FD; background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%); border: none; margin-left: 5px;" runat="server" Text="Change Password" OnClick="updateBtn_Click"/>
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
    </form>
</asp:Content>
