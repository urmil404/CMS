<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Students.aspx.cs" Inherits="admin_Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
    <div class="my-3">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Default.aspx">Dashboard</a></li>
            <li class="breadcrumb-item">Students</li>
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
                <div class="col-3">
                    <div class="btn-container" style="position: relative;">
                        <img runat="server" id="img_Student" class="w-100" style="border-radius: 50%" />
                        <button class="btn btn-success btn-sm" onclick="document.getElementById('<%= s_Image.ClientID %>').click()" type="button">Change</button>
                        <asp:FileUpload ID="s_Image" runat="server" CssClass="d-none" />
                    </div>
                    <script>
                        var fr = new FileReader();
                        fr.onload = function (e) {
                            document.getElementById("<%= img_Student.ClientID %>").src = this.result;
                        };
                        document.getElementById("<%= s_Image.ClientID %>").addEventListener("change", function () {
                            fr.readAsDataURL(this.files[0]);
                        });
                    </script>
                </div>
                <div class="col-9">
                    <div class="row">
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_Name">Student Name</asp:Label>
                            <asp:TextBox ID="txt_student_Name" CssClass="form-control" placeholder="Firstname Middlename Lastname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="student_rfv" runat="server"
                                ErrorMessage="* Please Select Name"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_Name" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_Fathername">Father Name</asp:Label>
                            <asp:TextBox ID="txt_student_Fathername" CssClass="form-control" placeholder="Firstname Middlename Lastname" runat="server">              
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_Fathername_rfv" runat="server"
                                ErrorMessage="* Please Select Name"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_Fathername" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_Dob">DOB</asp:Label>
                            <asp:TextBox ID="txt_student_Dob" TextMode="Date" CssClass="form-control" runat="server">       
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_Dob_rfv" runat="server"
                                ErrorMessage="* Please Select DOB"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_Dob" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="ddl_Gender" ID="ddl_student_gender">Gender</asp:Label>
                            <asp:DropDownList ID="ddl_Gender" CssClass="form-control" runat="server">
                                <asp:ListItem Value="">Gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ddl_student_gender_rfv" runat="server"
                                ErrorMessage="* Please Select Gender"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="ddl_Gender" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_Mobile">Mobile</asp:Label>
                            <asp:TextBox ID="txt_student_Mobile" CssClass="form-control" runat="server">     
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_Mobile_rfv" runat="server"
                                ErrorMessage="* Please Select Mobile"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_Mobile" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_email">Email</asp:Label>
                            <asp:TextBox ID="txt_student_email" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_email_rfv" runat="server"
                                ErrorMessage="* Please Select Email"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_email" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_address">Address</asp:Label>
                            <asp:TextBox ID="txt_student_address" CssClass="form-control" TextMode="multiline" Columns="30" Rows="2" runat="server" />
                            <asp:RequiredFieldValidator ID="txt_student_address_rfv" runat="server"
                                ErrorMessage="* Please Select Address"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_address" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_city">City</asp:Label>
                            <asp:TextBox ID="txt_student_city" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_city_rfv" runat="server"
                                ErrorMessage="* Please Select City"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_city" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group col-4">
                            <asp:Label runat="server" AssociatedControlID="txt_student_pincode">Pincode</asp:Label>
                            <asp:TextBox ID="txt_student_pincode" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="txt_student_pincode_rfv" runat="server"
                                ErrorMessage="* Please Select Pincode"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="txt_student_pincode" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Student" ID="txt_Add_Student" runat="server" OnClick="add_student" />
            <asp:Button CssClass="btn btn-warning" Text="Update Student" ID="txt_Upd_Student" runat="server" OnClick="upd_student" Visible="false" />
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

