<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="faculty_profile.aspx.cs" Inherits="faculty_profile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>  
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
                                                        <i class="fas fa-users mr-1"></i>
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
                                                    <i class="fas fa-book-open mr-1"></i>
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
                                                        <i class="fas fa-book-open mr-1"></i>
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
                                                                    <th>View</th>
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
                                                                                <a class="myedit" href="../public/assignments/<%=reader["a_file"].ToString().Trim() %>" target="_blank"><i class="btn btn-sm green fa-trash">Download</i></a>
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
                                                                                <a class="delete" href="view_submissions.aspx?view=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-sm purple">View</i></a>
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
                                                                    <th>View</th>
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
                                   
                                    <div class="tab-pane" id="change-password">
                                        <div class="profile-head">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <h3>Pending Fines</h3>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <button type="button" class="btn btn-sm red float-right" onclick="location.href='add_fine.aspx';">Add Fine</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card mb-4 my-4 mx-4" runat="server" id="Div1">
                                            <div class="card-header bg-dark text-white">
                                                <i class="fas fa-money-check-alt mr-1"></i>
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
                                                            SqlCommand cmd = new SqlCommand("SELECT *,s_name FROM fine,students WHERE f_status='Pending' AND s_id=f_student", con);
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
                                                                        <a class="delete" href="faculty_profile.aspx?deletefine=<%= reader["f_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
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

