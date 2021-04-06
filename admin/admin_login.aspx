<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_admin_login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<title>Admin Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/css/util.css">
<link rel="stylesheet" type="text/css" href="login/css/main.css">
<script src="public/assets/js/sweetalert.min.js"></script>
<!--===============================================================================================-->
</head>
<body>
    <div class="container-login100" style="background-image: url('login/images/bg-01.jpg');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
            <form class="login100-form validate-form" runat="server">
                <span class="login100-form-title p-b-37">Sign In
                </span>

                <div class="wrap-input100 validate-input m-b-20" data-validate="Enter username or email">
                    <asp:TextBox CssClass="input100" placeholder="username or email" runat="server" ID="username" />
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input m-b-25" data-validate="Enter password">
                    <asp:TextBox CssClass="input100" placeholder="password" runat="server" ID="password" />
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <asp:Button CssClass="login100-form-btn" Text="Sign In" runat="server" OnClick="btnAdminLogin" />
                </div>

                <div class="text-center my-3">
                    <a href="#" class="txt2 hov1">Sign Up
                    </a>
                </div>
            </form>
        </div>
    </div>
    <div id="dropDownSelect1"></div>

    <!--===============================================================================================-->
    <script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="login/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="login/vendor/bootstrap/js/popper.js"></script>
    <script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="login/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="login/vendor/daterangepicker/moment.min.js"></script>
    <script src="login/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="login/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="login/js/main.js"></script>
    <%-- Sweet Alerts --%>
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
