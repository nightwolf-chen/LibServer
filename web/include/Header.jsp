<%-- 
    Document   : Header
    Created on : 2013-3-17, 18:37:28
    Author     : nightwolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>图Young</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <meta charset="utf-8">
        <title>Sticky footer &middot; Twitter Bootstrap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Le styles -->

        <style>
            body {
                padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }

            /* Sticky footer styles
          -------------------------------------------------- */

            html,
            body {
                height: 100%;
                /* The html and body elements cannot have any padding or margin. */
            }

            /* Wrapper for page content to push down footer */
            #wrap {
                min-height: 100%;
                height: auto !important;
                height: 100%;
                /* Negative indent footer by it's height */
                margin: 0 auto -60px;
            }

            /* Set the fixed height of the footer here */
            #push,
            #footer {
                height: 60px;
            }
            #footer {
                background-color: #f5f5f5;
            }

            /* Lastly, apply responsive CSS fixes as necessary */
            @media (max-width: 767px) {
                #footer {
                    margin-left: -20px;
                    margin-right: -20px;
                    padding-left: 20px;
                    padding-right: 20px;
                }
            }



            /* Custom page CSS
            -------------------------------------------------- */
            /* Not required for template or sticky footer method. */

            .container {
                width: auto;
                max-width: 680px;
            }
            .container .credit {
                margin: 20px 0;
            }



        </style>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
        <link href="assets/css/thickbox.css" rel="stylesheet">
        <script src="assets/js/jquery-1.4.3.min.js" type="text/javascript"></script>
        <script src="assets/js/thickbox-compressed.js" type="text/javascript"></script>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="assets/js/html5shiv.js"></script>
        <![endif]-->

        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="assets/ico/favicon.png">
    </head>

    <body>


        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="brand" href="#"><img src="assets/img/LOGO.gif" class="img-rounded" style="max-height: 30px;max-width: 30px" ></a>
                    <div class="nav-collapse collapse">
                        <p class="navbar-text pull-right">
                            <%
                                String username = (String) session.getAttribute("username");
                                if (username == null) {
                                    out.println("<a href=\"/LibServer/loginPlus.jsp\" data-toggle=\"modal\">登录</a>");
                                } else {
                                   
                                    out.println(username + " <a href=\"LogoutSession.jsp?username=" + username + "\" >退出</a>");
                                     username=null;
                                }
                            %>
                        </p>
                        <ul class="nav">
                            <li class="active"><a href="lib.jsp">图Young</a></li>
                            <li><a href="index.jsp">图书馆上座情况</a></li>
                            <li><a href="bloglist.jsp">资讯区</a></li>
                            <li><a href="friend.jsp">个人中心</a></li>
                            <li><a href="about.jsp">关于</a></li>
                             <li><a href="status.jsp">传感器演示</a></li>

                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>


        <!-- Part 1: Wrap all page content here -->
        <div id="wrap">
