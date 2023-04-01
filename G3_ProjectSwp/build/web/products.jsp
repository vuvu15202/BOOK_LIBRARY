<%@include file="templates/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/6d68bb11b2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://kit.fontawesome.com/6d68bb11b2.css" crossorigin="anonymous">
<!--************************************
                Main Start
*************************************-->
<main id="tg-main" class="tg-main tg-haslayout">
    <!--************************************
                    News Grid Start
    *************************************-->
    <div class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div id="tg-twocolumns" class="tg-twocolumns">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-9 pull-right">
                        <div id="tg-content" class="tg-content">
                            <div class="tg-products">
                                <div class="tg-sectionhead">
                                    <c:choose>
                                        <c:when test="${message!=null}">
                                            <h2>${mesage}</h2>
                                        </c:when>
                                        <c:otherwise> 
                                            <h2>All Books</h2>
                                        </c:otherwise>  
                                    </c:choose>

                                </div>
                                <div class="tg-productgrid">
                                    <div class="tg-refinesearch">
                                        <form class="tg-formtheme tg-formsortshoitems">
                                            <span style="margin-right: 15px;">Sort by:</span>
                                            <button style="margin-right: 30px; padding: 5px;" type="button" onclick="sortByIncreasePrice()">     Price <i class="fa-solid fa-arrow-up"> </i>
                                                <button style="margin-right: 30px; padding: 5px;" type="button" onclick="sortByDecreasePrice()">     Price <i class="fa-solid fa-arrow-down"></i> 
                                                    <button style="margin-right: 30px; padding: 5px;" type="button" onclick="sortByNewest()">     Newest
                                                        <button style="margin-right: 30px; padding: 5px;" type="button" onclick="sortByOldest()">     Oldest
                                                            </form>
                                                            </div>

                                                            <div  id="ajax">
                                                                <c:forEach items="${productList}" var="product">
                                                                    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3" style="margin: 20px 0px 0px 0px;">
                                                                        <div class="tg-postbook">
                                                                            <figure class="tg-featureimg">
                                                                                <div class="tg-bookimg">
                                                                                    <div class="tg-frontcover"><img src="<%=path%>/products/${product.getImage()}" alt="image description"></div>
                                                                                    <div class="tg-backcover"><img src="<%=path%>/products/${product.getImage()}" alt="image description"></div>
                                                                                </div>
<!--                                                                                <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                                                    <i class="icon-heart"></i>
                                                                                    <span>add to wishlist</span>
                                                                                </a>-->
                                                                            </figure>
                                                                            <div class="tg-postbookcontent">
                                                                                <ul class="tg-bookscategories">
                                                                                    <c:forEach items="${cateList}" var="cate">
                                                                                        <c:if test="${product.getCategoryID() == cate.getCategoryID()}">
                                                                                            <li><a href="<%=path%>/productList?categoryID=${cate.getCategoryID()}">${cate.getCategoryName()}</a></li>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                        <c:forEach items="${genreList}" var="genre">
                                                                                            <c:if test="${product.getGenreID() == genre.getGenreID()}">
                                                                                            <li><a href="<%=path%>/productList?genreID=${genre.getGenreID()}">${genre.getGenreName()}</a></li>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                </ul>
                                                                                <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                                <div class="tg-booktitle">
                                                                                    <h3><a href="<%=path%>/productDetail?proID=${product.getProductID()}">${product.getProductName()}</a></h3>
                                                                                </div>
                                                                                <span class="tg-bookwriter">By:
                                                                                    <c:forEach items="${authorList}" var="author">
                                                                                        <c:if test="${author.getAuthorID() == product.getAuthorID()}">
                                                                                            <a href="javascript:void(0);">${author.getAuthorName()}</a>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                </span>
                                                                                <c:choose>
                                                                                    <c:when test="${product.getAverageRating()>0 && product.getAverageRating()<0.5}">
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:when>
                                                                                    <c:when test="${product.getAverageRating()>=0.5 && product.getAverageRating()<1.5}">
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:when>
                                                                                    <c:when test="${product.getAverageRating()>=1.5 && product.getAverageRating()<2.5}">
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:when>
                                                                                    <c:when test="${product.getAverageRating()>=2.5 && product.getAverageRating()<3.5}">
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:when>
                                                                                    <c:when test="${product.getAverageRating()>=3.5 && product.getAverageRating()<4.5}">
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                <span class="tg-bookprice">
                                                                                    <ins>${product.getSalePrice()}</ins>
                                                                                    <del>${product.getCoverPrice()}</del>
                                                                                </span>
                                                                                <c:url value="/cart" var="AddToCart">
                                                                                    <c:param name="previousURL" value="productList" />
                                                                                    <c:param name="proID" value="${product.getProductID()}" />
                                                                                </c:url>
                                                                                <a class="tg-btn tg-btnstyletwo" href="${AddToCart}">
                                                                                    <i class="fa fa-shopping-basket"></i>
                                                                                    <em>Add To Cart</em>
                                                                                </a>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </c:forEach>
                                                            </div>

                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                                                                <aside id="tg-sidebar" class="tg-sidebar">
                                                                    <!--                            <div class="tg-widget tg-widgetsearch">
                                                                                                    <form class="tg-formtheme tg-formsearch">
                                                                                                        <div class="form-group">
                                                                                                            <button type="submit"><i class="icon-magnifier"></i></button>
                                                                                                            <input onchange="searchByName(this)" type="text" name="search" class="form-group" placeholder="Search by title...">
                                                                                                        </div>
                                                                                                    </form>
                                                                                                </div>-->
                                                                    <div class="tg-widget tg-catagories">
                                                                        <div class="tg-widgettitle" >
                                                                            <h3>Categories</h3>
                                                                        </div>
                                                                        <div class="tg-widgetcontent" style="overflow: auto;
                                                                             height: 265px;">
                                                                            <ul>
                                                                                <c:forEach items="${cateList}" var="cate">
                                                                                    <li>
                                                                                        <input onclick="searchByCategory(${cate.getCategoryID()})" type="radio" id="checkbox1" name="category">   <span>${cate.getCategoryName()}</span>
                                                                                    </li>
                                                                                </c:forEach>
                                                                                <li><a href="<%=path%>/productList"><span>View All</span></a></li>

                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                    <div class="tg-widget ">
                                                                        <div class="tg-widgettitle">
                                                                            <h3>Price</h3>
                                                                        </div>
                                                                        <div class="tg-widgetcontent">
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByPriceDomain(1)" type="radio" id="checkbox1" name="price"> 0đ - 150,000đ
                                                                                </li>
                                                                            </ul>
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByPriceDomain(2)" type="radio" id="checkbox2" name="price"> 150,000đ - 300,000đ
                                                                                </li>
                                                                            </ul>
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByPriceDomain(3)" type="radio" id="checkbox3" name="price"> 300,000đ - 500,000đ
                                                                                </li>
                                                                            </ul>
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByPriceDomain(4)" type="radio" id="checkbox3" name="price"> 500,000đ - Above
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>

                                                                    <div class="tg-widget ">
                                                                        <div class="tg-widgettitle" >
                                                                            <h3>Supplier</h3>
                                                                        </div>
                                                                        <div class="tg-widgetcontent" style="overflow: auto;
                                                                             height: 265px;">
                                                                            <ul>
                                                                                <c:forEach items="${SupList}" var="supplier">
                                                                                    <li>
                                                                                        <input onclick="searchBySupplier(${supplier.getSupplierID()})" type="radio" id="checkbox1" name="supplier">    <span>${supplier.getSupplierName()}</span>
                                                                                    </li>
                                                                                </c:forEach>
                                                                            </ul>
                                                                        </div>
                                                                    </div>

                                                                    <div class="tg-widget ">
                                                                        <div class="tg-widgettitle">
                                                                            <h3>Language</h3>
                                                                        </div>
                                                                        <div class="tg-widgetcontent">
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByLanguage(1)" type="radio" id="checkbox" name="laguage"> Vietnamese
                                                                                </li></ul>
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByLanguage(2)" type="radio" id="checkbox" name="laguage"> English
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>

                                                                    <div class="tg-widget ">
                                                                        <div class="tg-widgettitle">
                                                                            <h3>Format</h3>
                                                                        </div>
                                                                        <div class="tg-widgetcontent">
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByFormat(1)" name="format" type="radio" id="checkbox1" > Hardcover
                                                                                </li></ul>
                                                                            <ul>
                                                                                <li>
                                                                                    <input onclick="searchByFormat(2)" name="format" type="radio" id="checkbox1"> Paperback
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </aside>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <!--************************************
                                                                            News Grid End
                                                            *************************************-->
                                                            </main>
                                                            <!--************************************
                                                                            Main End
                                                            *************************************-->
                                                            <%@include file="templates/footer.jsp" %>
                                                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                                            <script>
                                                                                                            function loadMore() {
                                                                                                                var amount = document.getElementsByClassName("product").length;
                                                                                                                $.ajax({
                                                                                                                    url: "/Project_banhang/load",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        exits: amount
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("content");
                                                                                                                        row.innerHTML += data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByName(param) {
                                                                                                                var txtSearch = param.value;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txt: txtSearch
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByCategory(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtCategory: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByGenre(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtGenre: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchBySupplier(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtSupplier: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByLanguage(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtLanguage: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByFormat(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtFormat: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function searchByPriceDomain(param) {

                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtPrice: param
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function sortByName() {
                                                                                                                var value = 1;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtsortByName: value
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function sortByIncreasePrice() {
                                                                                                                var value = 1;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtsortByIncreasePrice: value
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function sortByDecreasePrice() {
                                                                                                                var value = 1;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtsortByDecreasePrice: value
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function sortByNewest() {
                                                                                                                var value = 1;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtsortByNewest: value
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                                                                            function sortByOldest() {
                                                                                                                var value = 1;
                                                                                                                $.ajax({
                                                                                                                    url: "/G3_ProjectSwp/searchAjax",
                                                                                                                    type: "get", //send it through get method
                                                                                                                    data: {
                                                                                                                        txtsortByOldest: value
                                                                                                                    },
                                                                                                                    success: function (data) {
                                                                                                                        var row = document.getElementById("ajax");
                                                                                                                        row.innerHTML = data;
                                                                                                                    },
                                                                                                                    error: function (xhr) {
                                                                                                                        //Do Something to handle error
                                                                                                                    }
                                                                                                                });
                                                                                                            }
                                                            </script>  