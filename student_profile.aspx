<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="student_profile.aspx.cs" Inherits="student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image: url(public/assets/images/banner/banner3.jpg);">
            <div class="container my-5">
                <div class="page-banner-entry">
                    <h1 class="text-white">Student Profile</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Student Profile</li>
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
                                SqlCommand cmd = new SqlCommand("SELECT * FROM students WHERE s_id=" + Session["student_id"], con);
                                SqlDataReader reader = cmd.ExecuteReader();
                                while (reader.Read())
                                { %>
                            <div class="profile-bx text-center">
                                <div class="user-profile-thumb">
                                    <img src="<%=Helper.get_Student_Image(reader["s_image"].ToString().Trim())%>" />
                                </div>
                                <div class="profile-info">
                                    <h4><%= reader["s_name"].ToString().Trim() %></h4>
                                    <span><%= reader["s_email"].ToString().Trim() %></span>
                                    <% } %>
                                </div>
                                <div class="profile-social">
                                </div>
                                <div class="profile-tabnav">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Courses</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>Assignments</a>
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
                                                        <h3>My Admissions</h3>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <button type="button" class="btn btn-sm red float-right" onclick="location.href='admission.aspx';"><i class="ti-plus"></i>&nbsp; New Admission</button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="container-fluid">
                                                <div class="card mb-4" runat="server" id="area_student_list">
                                                    <div class="card-header bg-dark text-white">
                                                        <i class="fas fa-user-graduate mr-1"></i>
                                                        Admissions
                                                    </div>
                                                    <div class="card-body overflow-auto">
                                                        <table class="table table-bordered w-100" id="dataTable">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Name</th>
                                                                    <th>Course</th>
                                                                    <th>Sem</th>
                                                                    <th>Fees</th>
                                                                    <th>Date</th>
                                                                    <th>Fees Status</th>
                                                                    <th>Admission Status</th>
                                                                    <th>Print</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                                                   con.Open();
                                                                   SqlCommand cmd = new SqlCommand("SELECT students.*,Admissions.*,courses.*,CONVERT(VARCHAR,ad_date, 105) as addate FROM students,Admissions,courses WHERE ad_course=c_id AND  ad_student=s_id AND s_id=" + Session["student_id"], con);
                                                                   //Response.Write(cmd.CommandText);
                                                                   ////Response.End();
                                                                   SqlDataReader reader = cmd.ExecuteReader();
                                                                   while (reader.Read())
                                                                   {%>
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
                                                                                <%
                                                                       if (reader["ad_status"].ToString().Trim() == "Approved")
                                                                       {
                                                                                %>
                                                                                <a class="myedit" href="Print_Admission.aspx?id=<%= reader["ad_id"].ToString().Trim() %>"><i
                                                                                    class="btn btn-sm green">i class="ti-unlock"></i>&nbsp;    Print</i></a>
                                                                                </a>
                                                                                <%
                                                                       }
                                                                       else
                                                                       {
                                                                                %>
                                                                                 <a class="myedit" href="student_profile.aspx" class="btn btn-sm black" value="Wait" data-ng-disabled="dateRange!=='Cm'" disabled=""><i class="btn btn-sm black"><i class="ti-lock"></i>&nbsp;    Lock</i></a>
                                                                                <%
                                                                       }
                                                                                %>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th>Name</th>
                                                                    <th>Course</th>
                                                                    <th>Sem</th>
                                                                    <th>Fees</th>
                                                                    <th>Date</th>
                                                                    <th>Fees Status</th>
                                                                    <th>Admission Status</th>
                                                                    <th>Print</th>
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
                                            <div class="card mb-4" runat="server" id="area_assignment_list">
                                                <div class="card-header bg-dark text-white">
                                                    <i class="fas fa-book mr-1"></i>
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
                                                                <th>Upload</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%                                           
                                                                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                                                con.Open();
                                                                SqlCommand cmd = new SqlCommand("SELECT *,CONVERT(VARCHAR,a_sdate, 105) as sdate,CONVERT(VARCHAR,a_edate, 105) as edate FROM assignments, admissions WHERE a_ah_id = ad_ah AND ad_student = " + Session["student_id"], con);
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
                                                                            <a class="myedit" href="../public/assignments/<%=reader["a_file"].ToString().Trim() %>" target="_blank"><i class="btn btn-sm pink"><i class="ti-download"></i>&nbsp;    Download</i></a>

                                                                            <%
                                                                               }
                                                                            %>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="col-md-2">
                                                                        <div class="form-group">
                                                                            <a class="myedit" href="student_assignments.aspx?upload=<%= reader["a_id"].ToString().Trim() %>"><i class="btn btn-sm purple"><i class="ti-upload"></i>&nbsp;    Upload</i></a>
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
                                                                <th>Upload</th>
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
        </div>
        <!-- contact area END -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

