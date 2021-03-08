﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admission_Headers.aspx.cs" Inherits="admin_Admission_Headers" %>

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
    <div class="card mb-4 my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Admission
        </div>
        <div class="card-body">
            <div class="row">
                <div class="form-group col-4">
                    <asp:Label runat="server" AssociatedControlID="ddl_course">Course Name</asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddl_course" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="form-group col-4">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_sem">Semester</asp:Label>
                    <asp:TextBox ID="txt_ah_sem" CssClass="form-control" runat="server">              
                    </asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_fees">Fees</asp:Label>
                    <asp:TextBox ID="txt_ah_fees" CssClass="form-control" runat="server">              
                    </asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-3">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_startdate">Start Date</asp:Label>
                    <asp:TextBox ID="txt_ah_startdate" TextMode="Date" CssClass="form-control" runat="server">
                    </asp:TextBox>
                </div>
                <div class="form-group col-3">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_enddate">End Date</asp:Label>
                    <asp:TextBox ID="txt_ah_enddate" TextMode="Date" CssClass="form-control" runat="server">
                    </asp:TextBox>
                </div>
                <div class="form-group col-3">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_starttermdate">Start Term Date</asp:Label>
                    <asp:TextBox ID="txt_ah_starttermdate" TextMode="Date" CssClass="form-control" runat="server">
                    </asp:TextBox>
                </div>
                <div class="form-group col-3">
                    <asp:Label runat="server" AssociatedControlID="txt_ah_endtermdate">End Term Date</asp:Label>
                    <asp:TextBox ID="txt_ah_endtermdate" TextMode="Date" CssClass="form-control" runat="server">
                    </asp:TextBox>
                </div>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Admission" ID="txt_Add_admission" runat="server" OnClick="add_admission" />
            <asp:Button CssClass="btn btn-warning" Text="Update Admission" ID="txt_Upd_admission" runat="server" OnClick="upd_admission" Visible="false" />
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Script_Area" runat="Server">
    <script>
        $(document).ready(function () {
            $("#<%= ddl_course.ClientID %>").change(function () {
                  var cid = $(this).val();
                  if(cid != "")
                  {
                      $.ajax({
                          url: "Admission_Headers.aspx",
                          method: "GET",
                          data: {
                              cid: cid
                          },
                          success: function (res) {
                              $("#<%= txt_ah_fees.ClientID %>").val(res);
                          },
                      });
                  }
              });
          });
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
    <div class="card mb-4" runat="server" id="area_user_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Admissions
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered  text-center" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Adminssion ID</th>
                            <th>Adminssion Name</th>
                            <th>Adminssion Sem</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Start Term Date</th>
                            <th>End Term Date</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                            con.Open();
                            SqlCommand cmd = new SqlCommand("SELECT ah_id, ah_course, ah_sem, CONVERT(varchar, ah_startdate, 106) AS ah_startdate,  CONVERT(varchar, ah_enddate, 106) AS ah_enddate,  CONVERT(varchar, ah_start_termdate, 106) AS ah_start_termdate,  CONVERT(varchar, ah_end_termdate, 106) AS ah_end_termdate, c_name FROM Admission_Headers,courses WHERE ah_course=c_id", con);
                            SqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            { 
                        %>
                        <tr>
                            <td>
                                <%= reader["ah_id"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["c_name"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["ah_sem"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["ah_startdate"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["ah_enddate"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["ah_start_termdate"].ToString().Trim() %>
                            </td>
                            <td>
                                <%= reader["ah_end_termdate"].ToString().Trim() %>
                            </td>
                            <td>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="myedit" href="Admission_Headers.aspx?edit=<%= reader["ah_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                        </a>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <a class="delete" href="Admission_Headers.aspx?delete=<%= reader["ah_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Adminssion ID</th>
                            <th>Adminssion Name</th>
                            <th>Adminssion Sem</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Start Term Date</th>
                            <th>End Term Date</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
