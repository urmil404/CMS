<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="Client_signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title><%= Helper.WEBSITE_NAME %>-Register</title>
</head>
<!-- META ============================================= -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="" />
<meta name="author" content="" />
<meta name="robots" content="" />

<!-- DESCRIPTION -->
<meta name="description" content="EduChamp : Education HTML Template" />

<!-- OG -->
<meta property="og:title" content="EduChamp : Education HTML Template" />
<meta property="og:description" content="EduChamp : Education HTML Template" />
<meta property="og:image" content="" />
<meta name="format-detection" content="telephone=no">

<!-- FAVICONS ICON ============================================= -->
<link rel="icon" href="public/assets/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" type="image/x-icon" href="public/assets/images/favicon.png" />

<!-- PAGE TITLE HERE ============================================= -->
<title>EduChamp : Collage foundation </title>

<!-- MOBILE SPECIFIC ============================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.min.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->

<!-- All PLUGINS CSS ============================================= -->
<link rel="stylesheet" type="text/css" href="public/assets/css/assets.css">

<!-- TYPOGRAPHY ============================================= -->
<link rel="stylesheet" type="text/css" href="public/assets/css/typography.css">

<!-- SHORTCODES ============================================= -->
<link rel="stylesheet" type="text/css" href="public/assets/css/shortcodes/shortcodes.css">

<!-- STYLESHEETS ============================================= -->
<link rel="stylesheet" type="text/css" href="public/assets/css/style.css">
<link class="skin" rel="stylesheet" type="text/css" href="public/assets/css/color/color-1.css">
<script src="public/assets/js/sweetalert.min.js"></script>
</head>
	<body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image: url(public/assets/images/background/bg2.jpg);">
                    <a href="index.html">
                        <img src="public/assets/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="account-form-inner">

                    <div class="container mt-4 font-weight-bold">
                        <div class="row">
                            <div class="col-12">
                                <div class="alert alert-warning alert-dismissible fade text-center show" role="alert">
                                    <%= Session["msg"] %>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </div>
                            <d class="col-md-3 col-sm-4 col-6 offset-md-0 offset-sm-4 offset-3">
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
                </d>

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
                            <asp:Button ID="b_reg" runat="server" Text="Register" CssClass="btn btn-success btn-lg" OnClick="b_reg_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        </div>
		</div>
		<!-- External JavaScripts -->
        <script src="public/assets/js/jquery.min.js"></script>
        <script src="public/assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="public/assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="public/assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="public/assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="public/assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="public/assets/vendors/counter/waypoints-min.js"></script>
        <script src="public/assets/vendors/counter/counterup.min.js"></script>
        <script src="public/assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="public/assets/vendors/masonry/masonry.js"></script>
        <script src="public/assets/vendors/masonry/filter.js"></script>
        <script src="public/assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="public/assets/js/functions.js"></script>
        <script src="public/assets/js/contact.js"></script>

        <script>
        <%
            if (Session["amsg"] != null)
            {
        %>
            $(document).ready(function () {
                swal({
                    title: "Error",
                    text: "<%= String.Join("\\n", (String[]) Session["amsg"]) %>",
                    icon: "error"
                });
            });
            <%
                Session["amsg"] = null;
            }
        %>
        <%
            if (Session["smsg"] != null)
            {
        %>
            $(document).ready(function () {
                swal({
                    title: "Success",
                    text: "<%= String.Join("\\n", (String[]) Session["smsg"]) %>",
                    icon: "success"
                });
            });
            <%
                Session["smsg"] = null;
            }
        %>
        </script>
    </body>
</body>

</html>
