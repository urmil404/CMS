<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="assignments.aspx.cs" Inherits="admin_assignments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Assignment
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="txt_assignment" class="form-label">Type your Questions</label>
                <asp:TextBox CssClass="form-control" TextMode="MultiLine" ID="txt_assignment" Rows="3" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="upd_assignment" class="form-label">Upload your Assignment File</label>
                <asp:FileUpload CssClass="form-control" ID="upd_assignment" runat="server" />
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Assignment" ID="btn_Add_assignment" runat="server" OnClick="add_assignment" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
    <div class="card mb-4" runat="server" id="area_student_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Students
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-bordered w-100" id="dataTable">
                <thead>
                    <tr>
                        <th>Assignment ID</th>
                        <th>Title</th>
                        <th>File</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM assignments", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["a_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["a_title"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <%= reader["a_file"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="assigments.aspx?edit=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="delete" href="assigments.aspx?delete=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Assignment ID</th>
                        <th>Title</th>
                        <th>File</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </tfoot>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" runat="Server">
</asp:Content>

