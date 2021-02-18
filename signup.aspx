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
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">SignUp to your <span>Account</span></h2>
                            <p>Already have an account? <a href="login.aspx">Login here</a></p>
                        </div>
                        <div class="container">
                            <form class="row g-3 needs-validation" novalidate runat="server">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-6">
                                                <label class=" form-label">Full name</label>
                                                <asp:TextBox CssClass="form-control" ID="student_username" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_Fname" runat="server" ErrorMessage="* Full Name is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="student_username" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-6">
                                                <label for="student_email" class="form-label">Email</label>
                                                <asp:TextBox CssClass="form-control" ID="student_email" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ErrorMessage="* Your Email Address id Required" CssClass="text-valid text-danger pl-2" ControlToValidate="student_email" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-6 my-3">
                                                <label>Your Password</label>
                                                <asp:TextBox TextMode="Password" CssClass="form-control"
                                                    ID="student_password" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_Password" runat="server" ErrorMessage="* Your Password is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="student_Password" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                            <div class="col-6 my-3">
                                                <label for="student_mobile" class="form-label">Mobile</label>
                                                <asp:TextBox CssClass="form-control" ID="student_mobile" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_Moible" runat="server" ErrorMessage="* Your Mobile Number is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="student_Mobile" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </div>
                                            <div class="col-4 my-3">
                                                <label for="student_gender" class="form-label">Gender</label>
                                                <asp:DropDownList runat="server" ID="student_gender" CssClass="form-select">
                                                    <asp:ListItem Value="">Gender..</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfv_Gender" runat="server" ErrorMessage="* Please Select Gender" CssClass="text-valid text-danger pl-2" ControlToValidate="student_gender" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-4 my-3">
                                                <label for="student_stream" class="form-label">Stream</label>
                                                <asp:DropDownList runat="server" ID="student_stream">
                                                    <asp:ListItem Value="">Stream..</asp:ListItem>
                                                    <asp:ListItem>Science</asp:ListItem>
                                                    <asp:ListItem>Commerce</asp:ListItem>
                                                    <asp:ListItem>Arts</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfv_stream" runat="server" ErrorMessage="* Please Select Stream" CssClass="text-valid text-danger pl-2" ControlToValidate="student_stream" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-4 my-3">
                                                <label for="student_program" class="form-label">Course</label>
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="student_program">
                                                    <asp:ListItem Value="">Course..</asp:ListItem>
                                                    <asp:ListItem>BCA</asp:ListItem>
                                                    <asp:ListItem>BBA</asp:ListItem>
                                                    <asp:ListItem>Bcom</asp:ListItem>
                                                    <asp:ListItem>Bsc-IT</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfv_course" runat="server" ErrorMessage="* Please Select Course" CssClass="text-valid text-danger pl-2" ControlToValidate="student_program" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col-12 mt-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                                    <label class="form-check-label" for="invalidCheck">
                                                        Agree to terms and conditions
                                                    </label>
                                                    <div class="invalid-feedback">
                                                        You must agree before submitting.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-4">
                                                <asp:Button CssClass="btn btn-primary" Text="Submit" runat="server" OnClick="btn_signup_Click" ID="btn_signup" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
