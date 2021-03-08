<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="container-fluid">
        <div class="my-3">
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
                <li class="breadcrumb-item">Users</li>
            </ol>
        </div>
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                <i class="fas fa-table mr-1"></i>
                Users
            </div>
            <div class="card-body">
                <div class="table-responsive text-center">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Username</th>
                                <th>Password</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Username</th>
                                <th>Password</th>
                            </tr>
                        </tfoot>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

