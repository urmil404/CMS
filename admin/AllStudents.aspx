<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AllStudents.aspx.cs" Inherits="admin_AllStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Student Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <body>
        <div class="container mt-4 font-weight-bold">
            <div class="row">
                <% if (Session["msg"] != null) %>
                <% { %>
                <div class="col-12">
                    <div class="alert alert-warning alert-dismissible fade text-center show" role="alert">
                        <%= Session["msg"] %>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
                <% Session.Remove("msg"); %>
                <% } %>

                <% if (Session["S_Id"] != null) %>
                <% { %>
                <div class="col-8 offset-2 text-center mt-5">
                    <div class="row <%= edit_mode ? "d-none" : "" %>">
                        <div class="col-lg-4 offset-lg-4 col-6 offset-3 mb-3">
                            <img src="student_profile/<%= Session["pro"] %>" class="img-fluid w-100" style="border-radius: 50%" />
                        </div>
                    </div>
                    <h1>Welcome, <%= Session["S_Name"] %></h1>
                    <asp:Button ID="edit_pro" runat="server" Text="Edit Profile"
                        CssClass="btn btn-success mt-3 mr-4" OnClick="edit_pro_Click" />
                    <asp:Button ID="b_logout" runat="server" Text="Logout"
                        CssClass="btn btn-success mt-3" OnClick="b_logout_Click" TabIndex="100" />
                </div>
                <% } %>
                <% else %>
                <% { %>
             
                <script>
                    function ss() {
                        location.href = "AllStudents.aspx?gr="+document.getElementById("gr").value;
                    }
                </script>
                    <div class="col-12 text-center">
                        <h1>Student Profile</h1>
                        <div class="form-group row mt-4 mb-4">
                            <div class="col-4 offset-2">
                                <label>GrNo</label>
                                <%--<asp:TextBox ID="student_Grno" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <input type="text" id="gr" name="grno" class="form-control"/>
                            </div>
                        </div>
                        <%--<asp:Button ID="login" runat="server" Text="Show Profile" CssClass="btn btn-success btn-lg" OnClick="login_Click" />--%>
                        <button type="button" onclick="ss" class="btn btn-success btn-lg">Show Profile</button>
                    </div>
                <% } %>

                <% if (Session["S_Id"] == null || edit_mode) %>
                <% { %>
                <div class="col-12 mt-5">
                    <h1 class="text-center <%= edit_mode ? "d-none" : "" %>">Registration</h1>
                    <h1 class="text-center <%= !edit_mode ? "d-none" : "" %>">Edit Profile</h1>
                </div>
                <div class="col-md-3 col-sm-4 col-6 offset-md-0 offset-sm-4 offset-3">
                    <style>
                        .btn-container .btn {
                            position: absolute;
                            top: 50%;
                            left: 50%;
                            transform: translate(-50%, -50%);
                            -ms-transform: translate(-50%, -50%);
                            visibility: hidden;
                        }

                        .btn-container:hover .btn {
                            visibility: visible;
                        }
                    </style>
                    <div class="btn-container" style="position: relative;">
                        <img src="student_profile/<%= Session["pro"] %>" id="pro" class="w-100" style="border-radius: 50%" />
                        <button class="btn btn-success btn-sm" onclick="document.getElementById('ContentPlaceHolder1_f_pro').click()" type="button">Change</button>
                        <asp:FileUpload ID="f_pro" runat="server" CssClass="d-none" />
                    </div>
                    <script>
                        var fr = new FileReader();
                        fr.onload = function (e) {
                            document.getElementById("pro").src = this.result;
                        };
                        document.getElementById("ContentPlaceHolder1_f_pro").addEventListener("change", function () {
                            fr.readAsDataURL(this.files[0]);
                        });
                    </script>
                </div>
                <div class="col-md-9">
                    <div class="form-group row">
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>FullName</label>
                            <asp:TextBox ID="student_FullName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Father FullName</label>
                            <asp:TextBox ID="student_Father_FullName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Father Occupation</label>
                            <asp:TextBox ID="student_FatherOccupation" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Email</label>
                            <asp:TextBox ID="student_email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Mobile</label>
                            <asp:TextBox ID="student_mobile" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Password</label>
                            <asp:TextBox ID="student_pass" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>DOB</label>
                            <asp:TextBox ID="student_dob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>City</label>
                            <asp:TextBox ID="student_city" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>Pincode</label>
                            <asp:TextBox ID="student_pin" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-xl-8 col-sm-6 mt-3">
                            <label>Address</label>
                            <asp:TextBox ID="student_add" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label for="student_gender" class="form-label">Gender</label>
                            <asp:DropDownList runat="server" ID="student_gender"
                                CssClass="form-control">
                                <asp:ListItem Value="">Gender..</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_Gender" runat="server"
                                ErrorMessage="* Please Select Gender"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="student_gender" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label for="student_category" class="form-label">Category</label>
                            <asp:DropDownList runat="server" ID="student_category"
                                CssClass="form-control">
                                <asp:ListItem>General</asp:ListItem>
                                <asp:ListItem>OBC</asp:ListItem>
                                <asp:ListItem>ST/SC</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_category" runat="server"
                                ErrorMessage="* Please Select Category"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="student_category" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label for="student_nationality" class="form-label">Nationality</label>
                            <asp:DropDownList runat="server" ID="student_nationality"
                                CssClass="form-control">
                                <asp:ListItem>India</asp:ListItem>
                                <asp:ListItem>USA</asp:ListItem>
                                <asp:ListItem>Austrelia</asp:ListItem>
                                <asp:ListItem>Canada</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_nationality" runat="server"
                                ErrorMessage="* Please Select Nationality"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="student_nationality" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label for="student_stream" class="form-label">Stream</label>
                            <asp:DropDownList runat="server" ID="student_stream"
                                CssClass="form-control">
                                <asp:ListItem Value="">Stream..</asp:ListItem>
                                <asp:ListItem>Science</asp:ListItem>
                                <asp:ListItem>Commerce</asp:ListItem>
                                <asp:ListItem>Arts</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_Stream" runat="server"
                                ErrorMessage="* Please Select Stream"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="student_stream" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label for="student_program" class="form-label">Course</label>
                            <asp:DropDownList runat="server" CssClass="form-control"
                                ID="student_program">
                                <asp:ListItem Value="">Course..</asp:ListItem>
                                <asp:ListItem>BCA</asp:ListItem>
                                <asp:ListItem>BBA</asp:ListItem>
                                <asp:ListItem>Bcom</asp:ListItem>
                                <asp:ListItem>Bsc-IT</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_course" runat="server"
                                ErrorMessage="* Please Select Program"
                                CssClass="text-valid text-danger pl-2"
                                ControlToValidate="student_program" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-xl-4 col-sm-6 mt-3">
                            <label>GrNo</label>
                            <asp:TextBox ID="txt_Grno" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 text-center my-5">
                <% b_reg.Visible = !edit_mode; %>
                <% b_upd.Visible = edit_mode; %>
                <asp:Button ID="b_reg" runat="server" Text="Register" CssClass="btn btn-success btn-lg" OnClick="b_reg_Click" />
                <asp:Button ID="b_upd" runat="server" Text="Update"
                    CssClass="btn btn-success btn-lg" OnClick="b_upd_Click" />
            </div>
            <% } %>
        </div>
        </div>   
    </body>

    </html>
    <div class="table-responsive text-center">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th>GrNo</th>
                    <th>Name</th>
                    <!-- <th>Email</th> -->
                    <!-- <th>Mobile</th> -->
                    <th>password</th>
                    <th>DOB</th>
                    <!-- <th>City</th> -->
                    <!-- <th>Pincode</th> -->
                    <th>Contact Details</th>
                    <!-- <th>Address</th> -->
                    <th>Gender</th>
                    <th>Category</th>
                    <th>Nationality</th>
                    <th>stream</th>
                    <th>program</th>
                    <th>Profile</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>GrNo</th>
                    <th>Name</th>
                    <!-- <th>Email</th> -->
                    <!-- <th>Mobile</th> -->
                    <th>password</th>
                    <th>DOB</th>
                    <!-- <th>City</th> -->
                    <!-- <th>Pincode</th> -->
                    <th>Contact Details</th>
                    <!-- <th>Address</th> -->
                    <th>Gender</th>
                    <th>Category</th>
                    <th>Nationality</th>
                    <th>stream</th>
                    <th>program</th>
                    <th>Profile</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </tfoot>
            <tbody>
                <% SqlDataReader reader = Helper.myInsert("SELECT * FROM student_Profile ORDER BY S_Id DESC");
                   while (reader.Read())
                   { %>
                <td>
                    <%= "2021"+reader["S_GrNo"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_FullName"].ToString().Trim() %>
                </td>
                <%--  <td>
                    <%= reader["S_Email"].ToString().Trim() %>
                </td>
                    <td>
                        <%= reader["S_Mobile"].ToString().Trim() %>
                    </td>--%>
                <td>
                    <%= reader["S_Password"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Dob"].ToString().Trim() %>
                </td>
                <%--<td>
                    <%= reader["S_City"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Pincode"].ToString().Trim() %>
                </td>--%>
                <td class="text-left">
                    <b>Mobile :</b><br>
                    <%= reader["S_Mobile"].ToString().Trim() %><br>
                    <b>Email :</b><br>
                    <%= reader["S_Email"].ToString().Trim() %><br>
                    <b>City :</b><br>
                    <%= reader["S_City"].ToString().Trim() %><br>
                    <b>Address :</b><br>
                    <%= reader["S_Address"].ToString().Trim() %>
                </td>
                <%--  <td>
                    <%= reader["S_Address"].ToString().Trim() %>
                </td>--%>
                <td>
                    <%= reader["S_Gender"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Category"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Nationality"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Stream"].ToString().Trim() %>
                </td>
                <td>
                    <%= reader["S_Program"].ToString().Trim() %>
                </td>

                <td>
                    <img src="student_profile/<%=reader["S_profile"].ToString().Trim() %>" alt="" height="120" width="120">
                </td>
                <td>
                    <div class="col-md-2">
                        <div class="form-group">
                            <a class="myedit" href="AllStudents.aspx?edit=<%= reader["S_Id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                            </a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="col-md-2">
                        <div class="form-group">
                            <a class="delete" href="AllStudents.aspx?delete=<%= reader["S_Id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                        </div>
                    </div>
                </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%-- </div>
            </div>--%>
</asp:Content>

