<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print_Admission.aspx.cs" Inherits="Print_Admission" %>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="public/assets/js/sweetalert.min.js"></script>

<style>
    * {
        font-weight: bold !important;
        font-size: 1.05rem;
    }

    * {
        -webkit-print-color-adjust: exact !important;
        color-adjust: exact !important;
    }

    pre {
        border: none !important;
    }



    @media print {
        body * {
            visibility: hidden;
        }

        #mydiv,
        #mydiv * {
            visibility: visible;
        }

        #mydivs {
            /*page-break-inside: avoid;*/
        }


        .container-fluid {
            position: absolute !important;
            top: 0;
            left: 0;
            margin: 0 !important;
            padding: none;
        }

        html,
        body {
            width: 210mm;
            height: 297mm;
            padding-bottom: 40px;
        }
    }
</style>
</head>

    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image: url(public/assets/images/background/bg2.jpg);">
                    <a href="index.html">
                        <img src="public/assets/images/logo-white-2.png" alt=""></a>
                </div>

                <div class="row">
                    <div class="container-fluid">
                        <div class="heading-bx left my-5 mx-5">
                            <h2 class="title-head">Print Receipt</h2>
                        </div>
                    </div>

                    <div class="container-fluid my-3 mx-5">
                        <div class="card mb-4 my-4" id="print_btn">
                            <div class="card-header bg-dark text-white">
                                <i class="fas fa-table mr-1"></i>
                                Print Receipt
                            </div>
                            <div class="card-footer pb-2">
                                <button type="button" class="btn btn-lg btn-success" onclick="window.print()">Print Report</button>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid my-5 mx-5" id="mydiv">
                        <div class="card mb-4" runat="server" id="area_student_list">
                            <div class="card-header bg-dark text-white">
                                <i class="fas fa-table mr-1"></i>
                                Your Receipt
                            </div>
                            <div class="card-body overflow-auto">

                                <% SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                                   con.Open();
                                   SqlCommand cmd = new SqlCommand("SELECT students.*,Admissions.*,courses.*,CONVERT(VARCHAR,ad_date, 105) as addate FROM students,Admissions,courses WHERE ad_course=c_id AND  ad_student=s_id AND s_id=" + Session["student_id"]+" AND ad_id="+Request.QueryString["id"], con);
                                   //Response.Write(cmd.CommandText);
                                   SqlDataReader reader = cmd.ExecuteReader();
                                   while (reader.Read())
                                   {%>

                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-4">
                                            Receipt No : <%= reader["s_id"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4">
                                            Name : <%= reader["s_name"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 text-center">
                                            Course Name : <%= reader["c_name"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 mt-3">
                                            Sem : <%= reader["ad_sem"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 mt-3">
                                            Fees : <%= reader["ad_fees"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 mt-3 text-center">
                                            Date : <%= reader["addate"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 mt-3">
                                            Fees Status : <%= reader["ad_payment"].ToString().Trim() %>
                                        </div>
                                        <div class="col-4 mt-3">
                                            Admission Status : <%= reader["ad_status"].ToString().Trim() %>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
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

</html>
