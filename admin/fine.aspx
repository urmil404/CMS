<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="fine.aspx.cs" Inherits="admin_fine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card mb-4 my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Course
        </div>
        <div class="card-body">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddl_student" ID="ddl_student_name">Fine</asp:Label>
                <asp:DropDownList ID="ddl_student" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">--Student--</asp:ListItem>
                    <asp:ListItem>Urmil</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ddl_student_rfv" runat="server"
                    ErrorMessage="* Please Select Student"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="ddl_student" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddl_Fine" ID="ddl_student_gender">Fine</asp:Label>
                <asp:DropDownList ID="ddl_Fine" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">--Fine--</asp:ListItem>
                    <asp:ListItem>100</asp:ListItem>
                    <asp:ListItem>200</asp:ListItem>
                    <asp:ListItem>500</asp:ListItem>
                    <asp:ListItem>1000</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ddl_Fine_rfv" runat="server"
                    ErrorMessage="* Please Select Fine"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="ddl_Fine" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Fine" ID="txt_Add_Course" runat="server" OnClick="add_fine" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" runat="Server">
</asp:Content>

