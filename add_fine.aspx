<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_fine.aspx.cs" Inherits="add_fine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">

    <div class="page-content bg-white">
        <!-- inner page banner -->
        <div class="page-banner ovbl-dark" style="background-image: url(public/assets/images/banner/banner3.jpg);">
            <div class="container my-5">
                <div class="page-banner-entry">
                    <h1 class="text-white">Fine</h1>
                </div>
            </div>
        </div>
        <!-- Breadcrumb row -->
        <div class="breadcrumb-row">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="Default.aspx">Home</a></li>
                    <li>Fine</li>
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
                                                        <h3>Fines</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="courses-filter">
                                            <div class="tab-pane" id="change-password">
                                                <div class="card mb-4 my-4 mx-4">
                                                    <div class="card-body">
                                                        <div class="form-group">
                                                            <asp:Label runat="server" AssociatedControlID="ddl_student" ID="ddl_student_name">Student Name</asp:Label>
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
                                                            <label for="txt_fine" class="form-label">Fine Title</label>
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
                                                        <asp:Button CssClass="btn btn-sm purple" Text="Add Fine" ID="txt_Add_Fine" runat="server" OnClick="addfine" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container-fluid">
                                                <div class="card mb-4" runat="server" id="area_assignment_list">
                                                    <div class="card-header bg-dark text-white">
                                                        <i class="fas fa-money-check-alt mr-1"></i>
                                                        Fines
                                                    </div>
                                                    <div class="card-body overflow-auto">
                                                        <table class="table table-bordered w-100" id="dataTable">
                                                            <thead>
                                                                <tr>
                                                                    <th>Fine ID</th>
                                                                    <th>Name</th>
                                                                    <th>Title</th>
                                                                    <th>Amount</th>
                                                                    <th>Status</th>
                                                                    <th>Pay</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%                                           
                                                                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                                                    con.Open();
                                                                    SqlCommand cmd = new SqlCommand("SELECT *,s_name FROM fine,students WHERE s_id=f_student AND f_status='Pending'", con);
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
                                                                                <a class="delete" href="add_fine.aspx?pay=<%= reader["f_id"].ToString().Trim() %>"><i class="btn btn-danger">Pay</i></a>
                                                                            </div>
                                                                        </div>
                                                                    </td>

                                                                </tr>
                                                                <% } %>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                     <th>Fine ID</th>
                                                                    <th>Name</th>
                                                                    <th>Title</th>
                                                                    <th>Amount</th>
                                                                    <th>Status</th>
                                                                    <th>Pay</th>
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

