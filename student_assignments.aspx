<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="student_assignments.aspx.cs" Inherits="student_assignments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image: url(public/assets/images/banner/banner3.jpg);">
            <div class="container my-5">
                <div class="page-banner-entry">
                    <h1 class="text-white">Student Profile</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Student Profile</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb row END -->
        <!-- inner page banner END -->
        <div class="content-block">
            <!-- About Us -->
            <div class="section-area section-sp1">
                <div class="container-fluid">
                    <div class="card my-4">
                        <div class="card-header bg-dark text-white">
                            <i class="fas fa-table mr-1"></i>
                            Add Assignment
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label for="upd_assignment" class="form-label">Upload your Assignment File</label>
                                <asp:FileUpload CssClass="form-control" ID="upd_assignment" runat="server" />
                                <asp:RequiredFieldValidator ID="upd_assignment_rfv" runat="server"
                                    ErrorMessage="* Please Select Assignment"
                                    CssClass="text-valid text-danger pl-2"
                                    ControlToValidate="upd_assignment" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="card-footer pb-2">
                            <asp:Button CssClass="btn btn-success" Text="Add Assignment" ID="btn_Add_assignment" runat="server" OnClick="add_assignment" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- contact area END -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

