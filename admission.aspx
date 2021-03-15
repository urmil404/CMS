<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admission.aspx.cs" Inherits="admission" %>

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
                        <h2 class="title-head">Admission</h2>
                    </div>
                    <form class="contact-bx" runat="server">
                        <div class="row placeani">

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="ddl_Admission_Header" class="form-label">Stream</label>
                                    <asp:DropDownList runat="server" ID="ddl_Admission_Header"
                                        CssClass="form-control  ">
                                        <asp:ListItem>Students</asp:ListItem>
                                        <asp:ListItem>Faculty</asp:ListItem>
                                        <asp:ListItem>Employees</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="admission_rfv" runat="server"
                                        ErrorMessage="* Please Select Admission"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_Admission_Header" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">

                                    <label>Fees</label>
                                    <asp:TextBox CssClass="form-control" ID="course" runat="server" Enabled="false" Text=" "></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="course_rfv" runat="server" ErrorMessage="* Course is  Required" CssClass="text-valid text-danger pl-2" ControlToValidate="course" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="form-group form-forget">
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <asp:Button runat="server" ID="client_btn_submit" CssClass="btn button-md" Text="Take Admission & Pay Fees" OnClick="take_admisssion" />
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
        $(document).ready(function () {
            $("#<%= ddl_Admission_Header.ClientID %>").change(function () {
                var ahid = $(this).val();
                if (ahid != "") {
                    $.ajax({
                        url: "Admission.aspx",
                        method: "GET",
                        data: {
                            ahid: ahid
                        },
                        success: function (res) {
                            $("#<%= course.ClientID %>").val(res);
                        },
                    });
                    }
            });
        });
    </script>
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


