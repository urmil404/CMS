<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="fine.aspx.cs" Inherits="admin_fine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card mb-4 my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Fine
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
                <label for="txt_fine" class="form-label">Assignment Title</label>
                <asp:TextBox CssClass="form-control" ID="txt_fine" Rows="2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="txt_fine_rfv" runat="server"
                    ErrorMessage="* Please Select Fine title"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="txt_fine" Display="Dynamic">
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
                    <asp:ListItem>5000</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ddl_Fine_rfv" runat="server"
                    ErrorMessage="* Please Select Fine"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="ddl_Fine" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Fine" ID="txt_Add_Fine" runat="server" OnClick="add_fine" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
     <div class="card mb-4" runat="server" id="area_assignment_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Fines
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-bordered w-100" id="dataTable">
                <thead>
                    <tr>
                        <th>Fine ID</th>
                        <th>Students</th>
                        <th>Title</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT *,s_name FROM fine,students WHERE s_id=f_student", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["f_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["s_name"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <%= reader["f_title"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <%= reader["f_amount"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <%= reader["f_status"].ToString().Trim() %><br />
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="delete" href="fine.aspx?delete=<%= reader["f_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                       <th>Fine ID</th>
                        <th>Students</th>
                        <th>Title</th>
                        <th>Amount</th>
                        <th>Status</th>
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

