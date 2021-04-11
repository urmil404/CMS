<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_submissions.aspx.cs" Inherits="view_submissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image: url(public/assets/images/banner/banner3.jpg);">
            <div class="container my-5">
                <div class="page-banner-entry">
                    <h1 class="text-white">Assignment Submissions</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Assignment Submissions</li>
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
                                </div>
                                <div class="profile-tabnav">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Assignment Submissions</a>
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
                                                        <h3>Assignment Submissions</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="container-fluid">
                                                <div class="card mb-4" runat="server" id="area_assignment_list">
                                                    <div class="card-header bg-dark text-white">
                                                        <i class="fas fa-puzzle-piece mr-1"></i>
                                                        Submissions
                                                    </div>
                                                    <div class="card-body overflow-auto">
                                                        <table class="table table-bordered w-100" id="dataTable">
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Final</th>
                                                                    <th>Download</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                           
                                                                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                                                    con.Open();
                                                                    SqlCommand cmd = new SqlCommand("SELECT * FROM submissions", con);
                                                                    SqlDataReader reader = cmd.ExecuteReader();
                                                                    while (reader.Read())
                                                                    { %>
                                                                <tr>
                                                                    <td>
                                                                        <%= reader["sub_id"].ToString().Trim() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= reader["sub_file"].ToString().Trim() %><br />
                                                                    </td>
                                                                    <td>
                                                                        <div class="col-md-2">
                                                                            <div class="form-group">
                                                                                <% if (reader["sub_file"].ToString().Trim() != null)
                                                                                   {
                                                                                %>
                                                                                <a class="myedit" href="../public/submited/<%=reader["sub_file"].ToString().Trim() %>" target="_blank"><i class="btn btn-sm green">Download</i></a>
                                                                                </a>
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
                                                                    <th>ID</th>
                                                                    <th>Final</th>
                                                                    <th>Download</th>
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
        </div>
        <!-- contact area END -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

