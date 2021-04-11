<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="admin_notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content_BForm" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content_Form" runat="Server">
    <div class="card my-4">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Add Notice
        </div>
        <div class="card-body">
            <div class="col-12 form-group">
                <asp:Label Text="Notice Titlie" AssociatedControlID="notice_title" runat="server"></asp:Label>
                <asp:TextBox CssClass="form-control" runat="server" ID="notice_title"></asp:TextBox>
                <asp:RequiredFieldValidator ID="notice_title_rfv" runat="server"
                    ErrorMessage="* Please Select Notice Title"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="notice_title" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
            <div class="col-12 form-group">
                <asp:Label Text="Notice Description" AssociatedControlID="notice_desc" runat="server"></asp:Label>
                <asp:TextBox CssClass="form-control" TextMode="MultiLine" Rows="3" runat="server" ID="notice_desc"></asp:TextBox>
                <asp:RequiredFieldValidator ID="notice_desc_rfv" runat="server"
                    ErrorMessage="* Please Select Notice Description"
                    CssClass="text-valid text-danger pl-2"
                    ControlToValidate="notice_desc" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="card-footer pb-2">
            <asp:Button CssClass="btn btn-success" Text="Add Notice" ID="txt_Add_notice" runat="server" OnClick="add_notice" />
            <asp:Button CssClass="btn btn-warning" Text="Update Notice" Visible="false" ID="txt_Upd_notice" runat="server" OnClick="upd_notice" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content_AForm" runat="Server">
    <div class="card mb-4" runat="server" id="area_notice_list">
        <div class="card-header bg-dark text-white">
            <i class="fas fa-table mr-1"></i>
            Students
        </div>
        <div class="card-body overflow-auto">
            <table class="table table-bordered w-100" id="dataTable">
                <thead>
                    <tr>
                        <th>Notice ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                                           
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT *,CONVERT(VARCHAR,n_date, 105) as ndate FROM notice ORDER BY n_id DESC", con);
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        { %>
                    <tr>
                        <td>
                            <%= reader["n_id"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["n_title"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["n_desc"].ToString().Trim() %>
                        </td>
                        <td>
                            <%= reader["ndate"].ToString().Trim() %>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <a class="myedit" href="notice.aspx?edit=<%= reader["n_id"].ToString().Trim() %>"><i class="btn btn-primary">Edit</i></a>
                                    </a>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-2">
                                <div class="form-group text-center">
                                    <a class="delete" href="notice.aspx?delete=<%= reader["n_id"].ToString().Trim() %>"><i class="btn btn-danger">Delete</i></a>
                                </div>
                            </div>
                        </td>

                    </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Notice ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Date</th>
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
</asp:Content>

