<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="admin_Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
    <div class="my-3">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
            <li class="breadcrumb-item">Courses</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card mb-4 my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Course
        </div>
        <div class="card-body">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txt_Course_Name">Course Name</asp:Label>
                <asp:TextBox ID="txt_Course_Name" CssClass="form-control" runat="server">              
                </asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txt_Max_Sem">Max Semester</asp:Label>
                <asp:TextBox ID="txt_Max_Sem" CssClass="form-control" runat="server">              
                </asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txt_Fees">Fees</asp:Label>
                <asp:TextBox ID="txt_Fees" CssClass="form-control" runat="server">              
                </asp:TextBox>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Course" ID="txt_Add_Course" runat="server" OnClick="add_course" />
            <asp:Button CssClass="btn btn-warning" Text="Update Course" ID="txt_Upd_Course" runat="server" OnClick="upd_course" Visible="false" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
    <div class="card mb-4" runat="server" id="area_user_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Courses
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered  text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Max Sem</th>
                            <th>Fees</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                            con.Open();
                            SqlCommand cmd = new SqlCommand("SELECT * FROM courses", con);
                            SqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            { 
                        %>
                        <tr>
                            <td>
                                <%= reader["c_id"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["c_name"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["c_maxsem"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["c_fees"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["c_status"].ToString().Trim() %>
                            </td>
                            <td>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="myedit" href="Courses.aspx?edit=<%= reader["c_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="delete" href="Courses.aspx?delete=<%= reader["c_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Max Sem</th>
                            <th>Fees</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

