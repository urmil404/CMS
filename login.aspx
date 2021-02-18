<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Client_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
<title>EduChamp | Login</title>
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
						<h2 class="title-head">Login to your <span>Account</span></h2>
						<p>Don't have an account? <a href="signup.aspx">SignUp here</a></p>
					</div>
					<form class="contact-bx" runat="server">
						<div class="row placeani">
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group">
										<label>Your Email</label>
										<asp:TextBox CssClass="form-control" ID="username" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="rfv_email" runat="server" ErrorMessage="* Email is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="username" Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group">
										<label>Your Password</label>
										<asp:TextBox TextMode="Password" CssClass="form-control" ID="password" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="rfv_password" runat="server" ErrorMessage="* Password is Required" CssClass="text-valid text-danger pl-2" ControlToValidate="password" Display="Dynamic"></asp:RequiredFieldValidator>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<div class="input-group">
										<label for="student_gender" class="form-label">Role</label>
												<asp:DropDownList runat="server" ID="student_gender"
													CssClass="form-select">
													<asp:ListItem>Students</asp:ListItem>
													<asp:ListItem>Faculty</asp:ListItem>
													<asp:ListItem>Employees</asp:ListItem>
													<asp:ListItem>Other</asp:ListItem>
												</asp:DropDownList>
												<asp:RequiredFieldValidator ID="rfv_Gender" runat="server"
													ErrorMessage="* Please Select Gender"
													CssClass="text-valid text-danger pl-2"
													ControlToValidate="student_gender" Display="Dynamic">
												</asp:RequiredFieldValidator>
									</div>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group form-forget">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customControlAutosizing">
										<label class="custom-control-label" for="customControlAutosizing">Remember me</label>
									</div>
									<a href="forget-password.html" class="ml-auto">Forgot Password?</a>
								</div>
							</div>
							<div class="col-lg-12 m-b30">
								<asp:Button runat="server" ID="client_btn_submit" CssClass="btn button-md" Text="Login" OnClick="client_btn_submit_Click" />
							</div>
						</div>
					</form>
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

</html>

