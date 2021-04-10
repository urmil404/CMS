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
                <asp:Label runat="server" AssociatedControlID="ddl_course">Course</asp:Label>
                <asp:DropDownList CssClass="form-control" ID="ddl_course" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="course_rfv" runat="server"
                    ErrorMessage="* Please Select Course"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="ddl_course" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="mb-3">
                <label for="txt_assignment" class="form-label">Assignment Title</label>
                <asp:TextBox CssClass="form-control" ID="txt_assignment" Rows="2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="txt_assignment_rfv" runat="server"
                    ErrorMessage="* Please Select Assignment"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="txt_assignment" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
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
        <div class="row my-3 mx-3">
            <div class="form-group col-3">
                <asp:Label runat="server" AssociatedControlID="txt_sdate">Start Date</asp:Label>
                <asp:TextBox ID="txt_sdate" TextMode="Date" CssClass="form-control" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="txt_sdate_rfv" runat="server"
                    ErrorMessage="* Please Select Date"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="txt_sdate" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group col-3">
                <asp:Label runat="server" AssociatedControlID="txt_edate">End Date</asp:Label>
                <asp:TextBox ID="txt_edate" TextMode="Date" CssClass="form-control" runat="server">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="txt_edate_rfv" runat="server"
                    ErrorMessage="* Please Select Date"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="txt_edate" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Assignment" ID="btn_Add_assignment" runat="server" OnClick="add_assignment" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
    <div class="card mb-4" runat="server" id="area_assignment_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Assignments
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-bordered w-100" id="dataTable">
                <thead>
                    <tr>
                        <th>Assignment ID</th>
                        <th>Title</th>
                        <th>File</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Download</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT *,CONVERT(VARCHAR,a_sdate, 105) as sdate,CONVERT(VARCHAR,a_edate, 105) as edate FROM assignments", con);
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
                            <%= reader["sdate"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <%= reader["edate"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <% if (reader["a_file"].ToString().Trim() != "no assignmets available")
                                       {
                                    %>
                                    <a class="myedit" href="../public/assignments/<%=reader["a_file"].ToString().Trim() %>" target="_blank"><i class="btn btn-warning">Download</i></a>
                                    </a>
                                           <%
                                       }
                                           %>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="delete" href="assignments.aspx?delete=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
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
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Download</th>
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

