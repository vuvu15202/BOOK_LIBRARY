<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <%
            String path = request.getContextPath();
        %>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Book Library</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="<%=path%>/apple-touch-icon.png">
        <link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=path%>/css/normalize.css">
        <link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=path%>/css/icomoon.css">
        <link rel="stylesheet" href="<%=path%>/css/jquery-ui.css">
        <link rel="stylesheet" href="<%=path%>/css/owl.carousel.css">
        <link rel="stylesheet" href="<%=path%>/css/transitions.css">
        <link rel="stylesheet" href="<%=path%>/css/main.css">
        <link rel="stylesheet" href="<%=path%>/css/color.css">
        <link rel="stylesheet" href="<%=path%>/css/responsive.css">
        <link rel="stylesheet" href="https://kit.fontawesome.com/6d68bb11b2.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://accounts.google.com/gsi/client" async defer></script>


    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous"
            src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v16.0&appId=718155789958513&autoLogAppEvents=1"
    nonce="LpjM0yAZ"></script>
    <script src="<%=path%>/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>
    <div id="tg-wrapper" class="tg-wrapper tg-haslayout">

        <!--************************************
                        Main Start
        *************************************-->
        <main id="tg-main" class="tg-main tg-haslayout" style="padding-top: 100px;">
            <!--************************************
                            404 Error Start
            *************************************-->
            <div class="tg-sectionspace tg-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="tg-404error">
                            <div class="">
                                <div class="tg-404errorcontent">
                                    <span style="position: relative; font-size: 100px;padding-bottom: 30px">THANK YOU!</span>
                                    <h2 style="font-size: 30px; margin-top: 30px">You have successfully created an account.</h2>
                                    <h2 style="font-size: 30px;">Wait for the administrator to activate your account.</h2>

                                </div>
                                <form class="tg-formtheme tg-formsearch">
                                    <fieldset>
                                        <input type="text" name="search" class="typeahead form-control" placeholder="Search Here">
                                        <button type="submit"><i class="icon-magnifier"></i></button>
                                    </fieldset>
                                    <div class="tg-gobackhome">
                                        <span>Or Goto</span>
                                        <a href="<%=path%>/homepage">Homepage</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--************************************
                            404 Error End
            *************************************-->
        </main>
        <!--************************************
                        Main End
        *************************************-->
        <!--************************************
                        Footer Start
        *************************************-->
    </div>
    <%
        String pathh = request.getContextPath();
    %>

    <script src="<%=pathh%>/js/vendor/jquery-library.js"></script>
    <script src="<%=pathh%>/js/vendor/bootstrap.min.js"></script>
    <script src="<%=pathh%>/js/owl.carousel.min.js"></script>
    <script src="<%=pathh%>/js/jquery.vide.min.js"></script>
    <script src="<%=pathh%>/js/countdown.js"></script>
    <script src="<%=pathh%>/js/jquery-ui.js"></script>
    <script src="<%=pathh%>/js/parallax.js"></script>
    <script src="<%=pathh%>/js/countTo.js"></script>
    <script src="<%=pathh%>/js/appear.js"></script>
    <script src="<%=pathh%>/js/gmap3.js"></script>
    <script src="<%=pathh%>/js/main.js"></script>
</body>

</html>