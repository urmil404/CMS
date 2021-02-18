<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Admission.aspx.cs" Inherits="Admission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="main container">
        <div class="row">
            <div class="col-12 pt-5 pb-sm-5">
                <div class="text-center mb-3">
                    <h3 class="font-weight-bold text-success">Sign up Form</h3>
                </div>
                <div class="form-group row">
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Fname" Text="<i class='fa fa-user'></i> First Name : " />
                        <asp:TextBox runat="server" ID="txt_Fname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Fname" runat="server" ErrorMessage="* First Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Fname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Mname" Text="<i class='fa fa-user'></i> Middle Name : " />
                        <asp:TextBox runat="server" ID="txt_Mname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Mname" runat="server" ErrorMessage="* Middle Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Mname" Display="Dynamic"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Lname" Text="<i class='fa fa-user'></i> Last Name : " />
                        <asp:TextBox runat="server" ID="txt_Lname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Lname" runat="server" ErrorMessage="* Last Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Lname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_FFname" Text="<i class='fa fa-user'></i> Father First Name : " />
                        <asp:TextBox runat="server" ID="txt_FFname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_FFname" runat="server" ErrorMessage="* Fatehr First Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_FFname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_FMname" Text="<i class='fa fa-user'></i> Father Middle Name : " />
                        <asp:TextBox runat="server" ID="txt_FMname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_FMname" runat="server" ErrorMessage="* Fatehr Middle Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_FMname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_FLname" Text="<i class='fa fa-user'></i> Father Last Name : " />
                        <asp:TextBox runat="server" ID="txt_FLname" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_FLname" runat="server" ErrorMessage="* Fatehr Last Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_FLname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Foccupation" Text="<i class='fa fa-briefcase'></i> Father Occupation : " />
                        <asp:TextBox runat="server" ID="txt_Foccupation" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Foccupation" runat="server" ErrorMessage="* Fatehr Occupation is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Foccupation" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Fincome" Text="<i class='fa fa-inr'></i> Father Income : " />
                        <asp:TextBox runat="server" ID="txt_Fincome" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Fincome" runat="server" ErrorMessage="* Fatehr Income is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Fincome" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Aadhaar" Text="<i class='fa fa-address-card-o'></i> Aadhaar Card Number : " />
                        <asp:TextBox runat="server" ID="txt_Aadhaar" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Aadhaar" runat="server" ErrorMessage="* Please Enter Aadhaar Card Number" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Aadhaar" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Aadhaar" runat="server" ErrorMessage="* Enter Valid Aadhaar Card Number" CssClass="text-valid text-danger pl-2" ValidationExpression="[0-9]{12}" ControlToValidate="txt_Aadhaar" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Email" Text="<i class='fa fa-envelope'></i> Email Address : " />
                        <asp:TextBox runat="server" TextMode="Email" ID="txt_Email" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ErrorMessage="* Please Enter Your Email Address" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Email" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Mobile" Text="<i class='fa fa-phone'></i> Mobile Number : " />
                        <asp:TextBox runat="server" ID="txt_Mobile" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Moible" runat="server" ErrorMessage="* Please Enter Your Mobile Number" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Mobile" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Password" Text="<i class='fa fa-key'></i> Password : " />
                        <asp:TextBox runat="server" TextMode="Password" ID="txt_Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Password" runat="server" ErrorMessage="* Please Enter Your Password" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Password" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Dob" Text="<i class='fa fa-birthday-cake'></i> Date of Birth : " />
                        <asp:TextBox runat="server" TextMode="Date" ID="txt_Dob" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Date" runat="server" ErrorMessage="* Please Enter Your Date of Birth" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Dob" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="dd_Gender" Text="<i class='fa fa-user'></i> Gender : " />
                        <asp:DropDownList runat="server" ID="dd_Gender" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Gender" runat="server" ErrorMessage="* Please Select Gender" CssClass="text-valid text-danger pl-2" ControlToValidate="dd_Gender" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="dd_PH" Text="<i class='fa fa-wheelchair-alt'></i> Physically Handicapped : " />
                        <asp:DropDownList runat="server" ID="dd_PH" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                            <asp:ListItem Value="No">No</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_PH" runat="server" ErrorMessage="* Please Select Yes or No" CssClass="text-valid text-danger pl-2" ControlToValidate="dd_PH" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="dd_Category" Text="<i class='fa fa-user'></i> Category : " />
                        <asp:DropDownList runat="server" ID="dd_Category" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="ST">ST</asp:ListItem>
                            <asp:ListItem Value="ST">ST</asp:ListItem>
                            <asp:ListItem Value="OBC">OBC</asp:ListItem>
                            <asp:ListItem Value="General">General</asp:ListItem>
                            <asp:ListItem Value="EWS">EWS</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Category" runat="server" ErrorMessage="* Please Select Category" CssClass="text-valid text-danger pl-2" ControlToValidate="dd_Category" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="dd_Religion" Text="<i class='fa fa-user'></i> Religion : " />
                        <asp:DropDownList runat="server" ID="dd_Religion" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                            <asp:ListItem Value="Islam">Islam</asp:ListItem>
                            <asp:ListItem Value="Christianity">Christianity</asp:ListItem>
                            <asp:ListItem Value="Sikhism">Sikhism</asp:ListItem>
                            <asp:ListItem Value="Buddhism">Buddhism</asp:ListItem>
                            <asp:ListItem Value="Jainism">Jainism</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Religion" runat="server" ErrorMessage="* Please Select Religion" CssClass="text-valid text-danger pl-2" ControlToValidate="dd_Religion" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="dd_Nationality" Text="<i class='fa fa-user'></i> Nationality : " />
                        <asp:DropDownList runat="server" ID="dd_Nationality" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="Indian">Indian</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_Nationality" runat="server" ErrorMessage="* Please Select Nationality" CssClass="text-valid text-danger pl-2" ControlToValidate="dd_Nationality" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Address" Text="<i class='fa fa-map-marker'></i> Address : " />
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_Address" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Address" runat="server" ErrorMessage="* Please Write Your Address" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Address" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_City" Text="<i class='fa fa-map-marker'></i> City : " />
                        <asp:TextBox runat="server" ID="txt_City" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_City" runat="server" ErrorMessage="* Please Write Your Address" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_City" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-4 mb-4">
                        <asp:Label runat="server" AssociatedControlID="txt_Pincode" Text="<i class='fa fa-map-marker'></i> Pincode   : " />
                        <asp:TextBox runat="server" ID="txt_Pincode" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfv_Pincode" runat="server" ErrorMessage="* Please Enter Pincode" CssClass="text-valid text-danger pl-2" ControlToValidate="txt_Pincode" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <asp:LinkButton runat="server" ID="btn_Signup" CssClass="btn btn-success" OnClick="btn_Signup_Click">
                    <i class='fa fa-plus'></i> Signup
                    </asp:LinkButton>
                    <span class="float-right mt-2 pr-3"><a href="#" class="text-decoration-none">Forgot Password?</a></span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

