<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="admin_notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Student
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Add Notice</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>

        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Notice" ID="txt_Add_notice" runat="server" OnClick="add_notice" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" runat="Server">
</asp:Content>

