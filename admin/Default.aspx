<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="container-fluid my-3">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">
                        <h5><a href="students.aspx"></a><i class="fas fa-user-graduate mr-1"></i>Total Students</h5>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <h5 class="text-white stretched-link">
                            <%
                                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                int count_students = 0;
                                con.Open();
                                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM students", con);
                                count_students = (int)cmd.ExecuteScalar();
                                Response.Write(count_students);
                            %>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">
                       <h5><a href="students.aspx"></a><i class="fas fa-book-open mr-1"></i>Total Course</h5>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <h5 class="text-white stretched-link">
                            <%
                                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                int count_course = 0;
                                con.Open();
                                cmd = new SqlCommand("SELECT COUNT(*) FROM courses", con);
                                count_course = (int)cmd.ExecuteScalar();
                                Response.Write(count_course);
                            %>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">
                        <h5><a href="students.aspx"></a><i class="fas fa-chalkboard-teacher mr-1"></i>Total Faculty</h5>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <h5 class="text-white stretched-link">100</h5>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-dark text-white mb-4">
                    <div class="card-body">
                         <h5><a href="students.aspx"></a><i class="fas fa-university mr-1"></i>Total Admissions</h5>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <h5 class="text-white stretched-link">
                            <%
                                con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                int count_admissions = 0;
                                con.Open();
                                cmd = new SqlCommand("SELECT COUNT(*) FROM Admissions", con);
                                count_admissions = (int)cmd.ExecuteScalar();
                                Response.Write(count_admissions);
                            %>
                        </h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <svg class="svg-inline--fa fa-chart-area fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-area" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                            <path fill="currentColor" d="M500 384c6.6 0 12 5.4 12 12v40c0 6.6-5.4 12-12 12H12c-6.6 0-12-5.4-12-12V76c0-6.6 5.4-12 12-12h40c6.6 0 12 5.4 12 12v308h436zM372.7 159.5L288 216l-85.3-113.7c-5.1-6.8-15.5-6.3-19.9 1L96 248v104h384l-89.9-187.8c-3.2-6.5-11.4-8.7-17.4-4.7z"></path></svg><!-- <i class="fas fa-chart-area mr-1"></i> Font Awesome fontawesome.com -->
                        Students Intractions
                    </div>
                    <div class="card-body">
                        <div class="chartjs-size-monitor">
                            <div class="chartjs-size-monitor-expand">
                                <div class=""></div>
                            </div>
                            <div class="chartjs-size-monitor-shrink">
                                <div class=""></div>
                            </div>
                        </div>
                        <canvas id="myAreaChart" width="942" height="376" style="display: block; height: 301px; width: 754px;" class="chartjs-render-monitor"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <svg class="svg-inline--fa fa-chart-bar fa-w-16 mr-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-bar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                            <path fill="currentColor" d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg><!-- <i class="fas fa-chart-bar mr-1"></i> Font Awesome fontawesome.com -->
                        Student Average Attendance
                    </div>
                    <div class="card-body">
                        <div class="chartjs-size-monitor">
                            <div class="chartjs-size-monitor-expand">
                                <div class=""></div>
                            </div>
                            <div class="chartjs-size-monitor-shrink">
                                <div class=""></div>
                            </div>
                        </div>
                        <canvas id="myBarChart" width="942" height="376" class="chartjs-render-monitor" style="display: block; height: 301px; width: 754px;"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

