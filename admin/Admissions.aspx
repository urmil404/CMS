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
                    <asp:RequiredFieldValidator ID="ah_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_ah" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-4 form-group">
                    <asp:Label Text="Student" AssociatedControlID="ddl_student" runat="server"></asp:Label>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddl_student"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="student_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_student" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-4 form-group">
                    <asp:Label Text="Fees" AssociatedControlID="txt_fees" runat="server"></asp:Label>
                    <asp:TextBox CssClass="form-control" runat="server" ID="txt_fees"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="fees_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_fees" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="payment_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_payment" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                </div>
                 <div class="col-4 form-group">
                    <asp:Label Text="Date" AssociatedControlID="txt_date" runat="server"></asp:Label>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="txt_date"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="date_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_date" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                </div>
                <div class="col-4 form-group">
                    <asp:Label Text="Status" AssociatedControlID="ddl_status" runat="server"></asp:Label>
                    <asp:DropDownList CssClass="form-control" runat="server" ID="ddl_status">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Process</asp:ListItem>
                        <asp:ListItem>Approved</asp:ListItem>
                        <asp:ListItem>Cancel</asp:ListItem>
                        <asp:ListItem>Rejected</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="ddl_status_rfv" runat="server"
                                        ErrorMessage="* Please Select Status"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_status" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                </div>
            </div>

        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Admission" ID="txt_Add_admission" runat="server" OnClick="add_admission" />
            <asp:Button CssClass="btn btn-warning" Text="Update Admission" ID="txt_Upd_admission" runat="server" Visible="false" OnClick="upd_admissions" />
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
                        <th>Admission ID</th>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Sem</th>
                        <th>Fees</th>
                        <th>Date</th>
                        <th>Payment</th>
                        <th>Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT students.*,Admissions.*,courses.*,CONVERT(VARCHAR,ad_date, 105) as addate FROM students,Admissions,courses WHERE ad_course=c_id AND ad_student=s_id ", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["ad_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["s_name"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["c_name"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["ad_sem"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["ad_fees"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["addate"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["ad_payment"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["ad_status"].ToString().Trim() %>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="admissions.aspx?edit=<%= reader["ad_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group text-center">
                                    <a class="delete" href="admissions.aspx?delete=<%= reader["ad_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Admission ID</th>
                        <th>Name</th>
                        <th>Course</th>
                        <th>Sem</th>
                        <th>Fees</th>
                        <th>Date</th>
                        <th>Payment</th>
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" runat="Server">
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable({
                "order": [[0, "desc"]]

            });
        });
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

