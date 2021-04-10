<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="faculty_profile.aspx.cs" Inherits="faculty_profile" enableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image: url(public/assets/images/banner/banner1.jpg);">
            <div class="container my-5">
                <div class="page-banner-entry">
                    <h1 class="text-white">Faculty Profile</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Faculty Profile</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb row END -->
        <!-- inner page banner END -->
        <div class="content-block">
            <!-- About Us -->
            <div class="section-area section-sp1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                            <%
                                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                con.Open();
                                SqlCommand cmd = new SqlCommand("SELECT * FROM faculty WHERE f_id=" + Session["faculty_id"], con);
                                SqlDataReader reader = cmd.ExecuteReader();
                                while (reader.Read())
                                { %>
                            <div class="profile-bx text-center">
                                <div class="user-profile-thumb">
                                    <img src="<%=Helper.get_Faculty_Image(reader["f_image"].ToString().Trim())%>" />
                                </div>
                                <div class="profile-info">
                                    <h4><%= reader["f_name"].ToString().Trim() %></h4>
                                    <span><%= reader["f_email"].ToString().Trim() %></span>
                                    <% } %>
                                </div>
                                <div class="profile-social">
                                    <ul class="list-inline m-a0">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    </ul>
                                </div>
                                <div class="profile-tabnav">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Students</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Assignmets</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-money"></i>Fine</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                            <div class="profile-content-bx">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="courses">
                                        <div class="profile-head">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <h3>Student Admissions</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="container-fluid">
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
                                                                    <th>Student Name</th>
                                                                    <th>Course</th>
                                                                    <th>Sem</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% 
                                           
                                                                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                                                    con.Open();
                                                                    SqlCommand cmd = new SqlCommand("SELECT students.*,Admissions.*,courses.*,CONVERT(VARCHAR,ad_date, 105) as addate FROM students,Admissions,courses WHERE ad_course=c_id AND ad_student=s_id AND ad_status='Approved'", con);
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
                                                                </tr>
                                                                <% } %>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>Admission ID</th>
                                                                    <th>Name</th>
                                                                    <th>Course</th>
                                                                    <th>Sem</th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="quiz-results">
                                       

                                        <div class="profile-head">
                                            <h3>Assignments</h3>
                                        </div>
                                        <div class="courses-filter">

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

                                            <div class="row">
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
                                                                                <a class="myedit" href="../public/assignments/<%=reader["a_file"].ToString().Trim() %>" target="_blank"><i class="btn btn-sm green">Download</i></a>
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
                                                                                <a class="delete" href="faculty_profile.aspx?delete=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-sm red">Delete</i></a>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="edit-profile">
                                        <div class="profile-head">
                                            <h3>Edit Profile</h3>
                                        </div>
                                        <form class="edit-profile">
                                            <div class="">
                                                <div class="form-group row">
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                        <h3>1. Personal Details</h3>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="Mark Andre">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Occupation</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="CTO">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Company Name</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="EduChamp">
                                                        <span class="help">If you want your invoices addressed to a company. Leave blank to use your full name.</span>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone No.</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="+120 012345 6789">
                                                    </div>
                                                </div>

                                                <div class="seperator"></div>

                                                <div class="form-group row">
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                        <h3>2. Address</h3>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="5-S2-20 Dummy City, UK">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">City</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="US">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">State</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="California">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Postcode</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="000702">
                                                    </div>
                                                </div>

                                                <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                                <div class="form-group row">
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                        <h3 class="m-form__section">3. Social Links</h3>
                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Linkedin</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="www.linkedin.com">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Facebook</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="www.facebook.com">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Twitter</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="www.twitter.com">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Instagram</label>
                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                        <input class="form-control" type="text" value="www.instagram.com">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="">
                                                <div class="">
                                                    <div class="row">
                                                        <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                        </div>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <button type="reset" class="btn">Save changes</button>
                                                            <button type="reset" class="btn-secondry">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="change-password">
                                        <div class="profile-head">
                                            <h3>Fines</h3>
                                        </div>
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
                                    </div>
                                </div>
                            </div>
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

