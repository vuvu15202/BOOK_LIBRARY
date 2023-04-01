<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="">
    <head>
        <%
            String path = request.getContextPath();
        %>
        <meta charset="UTF-8">
        <meta http-equiv="content-type" content="text/html"/>
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
    <style>
        body{background-color: rgba(215, 241, 250, 0.512);}
    </style>
</head>
<body>
    <header id="tg-header" class="tg-header tg-haslayout">
        <div class="tg-middlecontainer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <strong class="tg-logo"><a href="<%=path%>/homepage"><img src="<%=path%>/images/logo.png"
                                                                                  alt="company name herez"></a></strong> 
                        <div class="tg-wishlistandcart">
                            <div class="dropdown tg-themedropdown tg-minicartdropdown">
                                <a href="javascript:void(0);" id="tg-minicart" class="tg-btnthemedropdown"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="tg-themebadge">${cartSize}</span>
                                    <i class="icon-cart"></i>
                                    <span>My Cart</span>
                                </a>
                                <div class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-minicart">
                                    <c:forEach items="${cartList}" var="cartItem">
                                        <c:forEach items="${productList}" var="product">
                                            <c:if test="${cartItem.getProductID() == product.getProductID()}">
                                                <div class="tg-minicartbody">
                                                    <div class="tg-minicarproduct">

                                                        <figure>
                                                            <img src="<%=path%>/products/${product.getImage()}" style="height: 70px;" alt="image description">
                                                        </figure>
                                                        <div class="tg-minicarproductdata">
                                                            <h5><a href="javascript:void(0);">${product.getProductName()}</a></h5>
                                                            <h6><a href="javascript:void(0);">${product.getSalePrice()}</a></h6>
                                                        </div>

                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>

                                    <div class="tg-minicartfoot">
                                        <a class="tg-btnemptycart" href="javascript:void(0);">
                                            <!--<i class="fa fa-trash-o"></i>-->
                                            <!--<span>Clear Your Cart</span>-->
                                        </a>
                                        <span class="tg-subtotal">Subtotal: <strong>${subTotal}đ</strong></span>
                                        <div class="tg-btns">

                                            <a class="tg-btn tg-active" href="<%=path%>/cart">View Cart</a>

                                            <a class="tg-btn" href="<%=path%>/checkout">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div> <span>  </span>
                            <div class="dropdown tg-themedropdown tg-wishlistdropdown">

                                <c:choose>
                                    <c:when test="${AccCustomerSession == null}">
                                        <img id="imgprofile" src="<%=path%>/images/users/icon-user.png" width="25" height="25" style=" border-radius: 50%; margin-bottom: 4px;" alt="" >
                                        <a class="login tg-btnthemedropdown" style="display: inline-block;" href="<%=path%>/account/login"style="text-decoration:none; color: #454545"><span style="font-size: 15px;">Login</span></a>
                                    </c:when>
                                    <c:otherwise>
                                        <img id="imgprofile" src="${AccCustomerSession.getImage()}" width="25   " height="25" style=" border-radius: 50%" alt="" >
                                        <a  class="login" href="<%=path%>/account/profile" style="text-decoration:none; color: #454545" id="tg-wishlisst" class="tg-btnthemedropdown"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span>${userGoogle.getName()}</span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>


                                <a id="nameprofile" style="display: inline-block;" class="account tg-btnthemedropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>User</span></a>

                                <div class="dropdown-menu tg-themedropdownmenu" style="width: 50px" aria-labelledby="tg-wishlisst">
                                    <div class="tg-description">
                                        <a href="<%=path%>/account/profile">Profile</a>
                                    </div>
                                    <div class="tg-description">
                                        <a href="<%=path%>/account/profile_myOrder">My Orders</a>
                                    </div>
                                    <div class="tg-description">
                                        <a href="<%=path%>/account/login">Log out</a>
                                    </div>
                                </div>
                            </div>

<!--                            <div class="dropdown tg-themedropdown tg-wishlistdropdown">
                                <a href="javascript:void(0);" id="tg-wishlisst" class="tg-btnthemedropdown"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="tg-themebadge"></span>
                                    <i class="icon-heart"></i>
                                    <span>Wish list</span>
                                </a>
                                <div class="dropdown-menu tg-themedropdownmenu" aria-labelledby="tg-wishlisst">
                                    <div class="tg-description">
                                        <p>No products were added to the wish list!</p>
                                    </div>
                                </div>
                            </div>-->
                            
                        </div>

                        <div class="tg-searchbox">
                            <form class="tg-formtheme tg-formsearch" style="width: 90%;" method="POST" action="<%=path%>/productList">
                                <fieldset>
                                    <input type="text" name="txtSearch" value="${txtSearch}" class="typeahead form-control"
                                           placeholder="Search by Title, Author">
                                    <button type="submit"><i class="icon-magnifier"></i></button>
                                </fieldset>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="tg-navigationarea">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <nav id="tg-nav" class="tg-nav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                        data-target="#tg-navigation" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div id="tg-navigation" class="collapse navbar-collapse tg-navigation" style="font-size: 18px">
                                <ul>
                                    <li><a href="<%=path%>/homepage">Home</a></li>
                                    <li class="menu-item-has-children menu-item-has-mega-menu">
                                        <a href="javascript:void(0);">All Categories</a>
                                        <div class="mega-menu">
                                            <ul class="tg-themetabnav" role="tablist">
                                                <li>
                                                    <a href="<%=path%>/productList">All Books</a>
                                                </li>
                                                <c:forEach items="${cateList}" var="cate">
                                                    <li>
                                                        <a href="<%=path%>/productList?categoryID=${cate.getCategoryID()}">${cate.getCategoryName()}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </li>

                                    <li><a href="<%=path%>/productList">Best Selling</a></li>
                                    <li><a href="<%=path%>/productList">Weekly Sale</a></li>
                                    <li><a href="<%=path%>/contactus">Contact</a></li>
                                    <li><a href="<%=path%>/aboutus">About Us</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <script src="<%=path%>/js/header.js" type="text/javascript"></script>