<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title><%= Helper.WEBSITE_NAME %>-Register</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />
    <meta name="description" content="EduChamp : Education HTML Template" />
    <meta property="og:title" content="EduChamp : Education HTML Template" />
    <meta property="og:description" content="EduChamp : Education HTML Template" />
    <meta property="og:image" content="" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="public/assets/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" type="image/x-icon" href="public/assets/images/favicon.png" />
    <link rel="stylesheet" type="text/css" href="public/assets/css/assets.css">
    <link rel="stylesheet" type="text/css" href="public/assets/css/typography.css">
    <link rel="stylesheet" type="text/css" href="public/assets/css/shortcodes/shortcodes.css">
    <link rel="stylesheet" type="text/css" href="public/assets/css/style.css">
    <link class="skin" rel="stylesheet" type="text/css" href="public/assets/css/color/color-1.css">
    <script src="public/assets/js/sweetalert.min.js"></script>
</head>
<body id="bg">
    <form id="form1" runat="server">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <div class="account-form">
                <div class="account-head" style="background-image: url(public/assets/images/background/bg2.jpg);">
                    <a href="index.html">
                        <img src="public/assets/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-12">
                            <div class="heading-bx left ml-5 my-5">
                                <h2 class="title-head">Register to your <span>Account</span></h2>
                                <p>Already have an account? <a href="login.aspx">Login here</a></p>
                            </div>

                        </div>
                        <div class="col-3 my-4">
                            <div class="btn-container" style="position: relative;">
                                <img runat="server" id="img_Student" class="w-100" style="border-radius: 50%" />
                                <button class="btn btn-success btn-sm" onclick="document.getElementById('<%= s_Image.ClientID %>').click()" type="button">Change</button>
                                <asp:FileUpload ID="s_Image" runat="server" CssClass="d-none" />
                            </div>
                            <script>
                                var fr = new FileReader();
                                fr.onload = function (e) {
                                    document.getElementById("<%= img_Student.ClientID %>").src = this.result;
                                };
                                document.getElementById("<%= s_Image.ClientID %>").addEventListener("change", function () {
                                    fr.readAsDataURL(this.files[0]);
                                });
                            </script>
                        </div>
                        <div class="col-9">
                            <div class="form-group row">
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_Name">Student Name</asp:Label>
                                    <asp:TextBox ID="txt_student_Name" CssClass="form-control" placeholder="Firstname Middlename Lastname" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="student_Name_rfv" runat="server"
                                        ErrorMessage="* Please Select Name"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_Name" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_Fathername">Father Name</asp:Label>
                                    <asp:TextBox ID="txt_student_Fathername" CssClass="form-control" placeholder="Firstname Middlename Lastname" runat="server">              
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="student_Fathername_rfv" runat="server"
                                        ErrorMessage="* Please Select Father Name"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_Fathername" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_Dob">DOB</asp:Label>
                                    <asp:TextBox ID="txt_student_Dob" TextMode="Date" CssClass="form-control" runat="server">              
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_student_Dob_rfv" runat="server"
                                        ErrorMessage="* Please Select DOB"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_Dob" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="ddl_Gender" ID="ddl_student_gender">Gender</asp:Label>
                                    <asp:DropDownList ID="ddl_Gender" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="">Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="ddl_Gender_rfv" runat="server"
                                        ErrorMessage="* Please Select Gender"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="ddl_Gender" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_Mobile">Mobile</asp:Label>
                                    <asp:TextBox ID="txt_student_Mobile" CssClass="form-control" runat="server">     </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txt_student_Mobile_rfv" runat="server"
                                        ErrorMessage="* Please Select Mobile"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_Mobile" Display="Dynamic">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_email">Email</asp:Label>
                                    <asp:TextBox ID="txt_student_email" CssClass="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_student_email_rfv" runat="server"
                                        ErrorMessage="* Please Select Email"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_email" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_address">Address</asp:Label>
                                    <asp:TextBox ID="txt_student_address" CssClass="form-control" Text="" TextMode="multiline" Columns="2" Style="max-height: 40px" runat="server" />
                                      <asp:RequiredFieldValidator ID="txt_student_address_rfv" runat="server"
                                        ErrorMessage="* Please Select Address"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_address" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_city">City</asp:Label>
                                    <asp:TextBox ID="txt_student_city" CssClass="form-control" runat="server">      </asp:TextBox>
                                       <asp:RequiredFieldValidator ID="txt_student_city_rfv" runat="server"
                                        ErrorMessage="* Please Select City"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_city" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-xl-4 col-sm-6 mt-3">
                                    <asp:Label runat="server" AssociatedControlID="txt_student_pincode">Pincode</asp:Label>
                                    <asp:TextBox ID="txt_student_pincode" CssClass="form-control" runat="server"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="txt_student_pincode_rfv" runat="server"
                                        ErrorMessage="* Please Select Pincode"
                                        CssClass="text-valid text-danger pl-2"
                                        ControlToValidate="txt_student_pincode" Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group row text-center">
                                <div class="col-xl-12 col-sm-12 mt-3">
                                    <asp:Button CssClass="btn btn-success" Text="Register" ID="txt_Add_Student" runat="server" OnClick="reg_student" />
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
