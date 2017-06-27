﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="MyForumApp.User.SignIn" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Elite Match a Matrimonial Category Bootstrap Responsive Website Template  | Register :: W3layouts</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Elite Match Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="../Theme/web/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../Theme/web/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="../Theme/web/css/jquery-ui.css" />
    <link href="../Theme/web/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--fonts-->
    <link href="//fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Dancing+Script:400,700" rel="stylesheet">
    <!--//fonts-->

</head>
<body>
    <form runat="server" id="frm1">
        <!--banner start here-->
        <div class="banner-w3ls inner-banner-agileits" id="home">
            <div class="container">
                <!-- header -->
                <div class="header-inner">
                    <h1 class="logo">
                        <a href="index.html">Elite<span>Match</span></a></h1>
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <!-- navbar-header -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="about.html">About</a></li>
                                <li><a href="matches.html">Matches</a></li>
                                <li class="dropdown menu__item">
                                    <a href="#" class="dropdown-toggle menu__link" data-toggle="dropdown" data-hover="Pages" role="button" aria-haspopup="true" aria-expanded="false">Pages<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="codes.html">Short Codes</a></li>
                                        <li><a href="icons.html">Icons</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </nav>
                    <div class="header-right-w3ls">
                        <a href="login.html">Log In</a>
                        <a href="register.html">Register</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--//home-->
        <!--banner end here-->
        <!-- breadcrumbs -->
        <div class="w3l_agileits_breadcrumbs">
            <div class="container">
                <div class="w3l_agileits_breadcrumbs_inner">
                    <ul>
                        <li><a href="index.html">Home</a><span>&#187;</span></li>

                        <li>Register</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //breadcrumbs -->
        <div class="login elite-app">
            <div class="container">
                <div class="tittle-agileinfo">
                    <h3>SignIn Now</h3>
                </div>
                <div class="col-md-8 login-form-w3-agile">

                    <div class="w3_form_body_grid">
                        <span>USERNAME</span>
                        <asp:TextBox ID="txtUName" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                    </div>
                    <div class="w3_form_body_grid w3_form_body_grid1">
                        <span>Password</span>
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>

                    </div>
                    <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                    <div>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 login-right-info">
                    <h3 class="subhead-agileits">Why Join Elite Match</h3>
                    <p class="para-agileits-w3layouts">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <ul>
                        <li><i class="fa fa-check" aria-hidden="true"></i>Lorem ipsum</li>
                        <li><i class="fa fa-check" aria-hidden="true"></i>Vivamus lacus</li>
                        <li><i class="fa fa-check" aria-hidden="true"></i>quisquam est</li>
                        <li><i class="fa fa-check" aria-hidden="true"></i>Pellentesque</li>
                    </ul>
                    <h5>Already a member....<i class="fa fa-hand-o-down" aria-hidden="true"></i></h5>
                    <div class="sim-button button12"><a href="login.html">Login</a></div>
                </div>
                <div class="col-md-4 login-right-info right-info-find">
                    <h3 class="subhead-agileits">Easy steps to find your life partner</h3>
                    <ul>
                        <li><i class="fa fa-ellipsis-v" aria-hidden="true"></i>Vivamus lacus nisl, suscipit in vehicula sit amet, sollicitudin eget eros.</li>
                        <li><i class="fa fa-ellipsis-v" aria-hidden="true"></i>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.</li>
                        <li><i class="fa fa-ellipsis-v" aria-hidden="true"></i>Vivamus lacus nisl, suscipit in vehicula sit amet, sollicitudin eget eros.</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--login-inner-->
        <!-- footer -->
        <div class="w3l_footer">
            <div class="container">
                <div class="w3ls_footer_grid">
                    <div class="col-md-4 w3ls_footer_grid_left">
                        <h4>Location:</h4>
                        <p>
                            Matrimonium Elite, Ipswich,<br>
                            Foxhall Road, UK
                        </p>
                    </div>
                    <div class="col-md-4 w3ls_footer_grid_left">
                        <h4>Contact us:</h4>
                        <p><span>Phone : </span>505-222-5432</p>
                        <p><span>Email : </span><a href="mailto:info@example.com">info@example.com</a></p>
                    </div>
                    <div class="col-md-4 w3ls_footer_grid_left">
                        <h4>Opening hours:</h4>
                        <p>Working days (8am-9pm)</p>
                        <p>Sundays (9am-1pm)</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- footer-button-info -->
                <div class="footer-middle-agileinfo">
                    <div class="footer-button">
                        <div class="button-top-w3layouts">
                            <div class="logo-icons-w3ls">
                                <i class="fa fa-heart heart1" aria-hidden="true"></i>
                                <i class="fa fa-heart-o heart2" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="sim-button button12"><a href="contact.html">Contact Us</a></div>
                        <h2>We’re Committed to Service Excellence.</h2>
                    </div>
                </div>
                <!-- footer-button-info -->
            </div>
        </div>

        <div class="botttom-nav-agileits">
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="matches.html">Matches</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </div>
        <div class="footer-w3layouts">
            <div class="container">
                <div class="agile-copy">
                    <p>© 2017 Elite Match. All rights reserved | Design by <a href="http://w3layouts.com/">W3layouts</a></p>
                </div>
                <div class="agileits-social">
                    <ul>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-vk"></i></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!--/footer -->

        <!-- js -->
        <script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>




        <script src="js/SmoothScroll.min.js"></script>
        <!-- smooth scrolling -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                    var defaults = {
                    containerID: 'toTop', // fading element id
                    containerHoverID: 'toTopHover', // fading element hover id
                    scrollSpeed: 1200,
                    easingType: 'linear' 
                    };
                */
                $().UItoTop({ easingType: 'easeOutQuart' });
            });
        </script>


        <a href="#home" class="scroll" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
        <!-- //smooth scrolling -->
        <!-- //for-Clients -->
        <!-- start-smoth-scrolling -->
        <script type="text/javascript" src="../Theme/web/js/move-top.js"></script>
        <script type="text/javascript" src="../Theme/web/js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
                });
            });
        </script>
        <!-- start-smoth-scrolling -->
        <!-- Calendar -->
        <script src="js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <!-- //Calendar -->
        <script type="text/javascript" src="../Theme/web/js/bootstrap-3.1.1.min.js"></script>

    </form>
</body>
</html>
