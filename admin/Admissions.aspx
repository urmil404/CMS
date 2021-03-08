<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admissions.aspx.cs" Inherits="admin_Admissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
    <div class="my-3">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
            <li class="breadcrumb-item">Admissions</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Student
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4 form-group">
                    <asp:Label Text="Admission Header" AssociatedControlID="ddl_ah" runat="server"></asp:Label>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddl_ah"></asp:DropDownList>
                </div>
                <div class="col-4 form-group">
                    <asp:Label Text="Student" AssociatedControlID="ddl_student" runat="server"></asp:Label>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddl_student"></asp:DropDownList>
                </div>
                <div class="col-4 form-group">
                    <asp:Label Text="Fees" AssociatedControlID="txt_fees" runat="server"></asp:Label>
                    <asp:TextBox CssClass="form-control" runat="server" ID="txt_fees"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-4 form-group">
                    <asp:Label Text="Payment" AssociatedControlID="ddl_payment" runat="server"></asp:Label>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddl_payment">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem>Paid</asp:ListItem>
                        <asp:ListItem>Unpaid</asp:ListItem>
                    </asp:DropDownList>
                </div>
                 <div class="col-4 form-group">
                    <asp:Label Text="Date" AssociatedControlID="txt_date" runat="server"></asp:Label>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txt_date"></asp:TextBox>
                </div>
            </div>

        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Admission" ID="txt_Add_Student" runat="server" OnClick="add_admission" />
            <asp:Button CssClass="btn btn-warning" Text="Update Admission" ID="txt_Upd_Student" runat="server" Visible="false" />
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
                        <th>Student ID</th>
                        <th>photo</th>
                        <th>Student Details</th>
                        <th>Contact</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM students", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["s_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <img height="100" src="../<%=Helper.get_Student_Image(reader["s_image"].ToString().Trim())%>" />
                        </td>
                        <td>
                            <b>Name :</b><br />
                            <%= reader["s_name"].ToString().Trim() %><br />
                            <b>Father Name :</b><br />
                            <%= reader["s_fathername"].ToString().Trim() %><br />
                            <b>DOB :</b><br />
                            <%= reader["s_dob"].ToString().Trim() %><br />
                            <b>Gender :</b><br />
                            <%= reader["s_gender"].ToString().Trim() %>
                        </td>
                        <td>
                            <b>Mobile :</b><br />
                            <%= reader["s_mobile"].ToString().Trim() %><br />
                            <b>Email :</b><br />
                            <%= reader["s_email"].ToString().Trim() %>
                        </td>
                        <td>
                            <b>Addresss :</b><br />
                            <%= reader["s_address"].ToString().Trim() %><br />
                            <b>City :</b><br />
                            <%= reader["s_city"].ToString().Trim() %>
                            <br />
                            <b>Pincode :</b><br />
                            <%= reader["s_pincode"].ToString().Trim() %>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="students.aspx?edit=<%= reader["s_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="delete" href="students.aspx?delete=<%= reader["s_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Student ID</th>
                        <th>photo</th>
                        <th>Student Details</th>
                        <th>Contact</th>
                        <th>Address</th>
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
    <script>
        $(document).ready(function () {
            $("#<%= ddl_ah.ClientID %>").change(function () {
                var ahid = $(this).val();
                if (ahid != "") {
                    $.ajax({
                        url: "Admissions.aspx",
                        method: "GET",
                        data: {
                            ahid: ahid
                        },
                        success: function (res) {
                            $("#<%= txt_fees.ClientID %>").val(res);
                          },
                      });
                      }
            });
        });
    </script>
</asp:Content>

