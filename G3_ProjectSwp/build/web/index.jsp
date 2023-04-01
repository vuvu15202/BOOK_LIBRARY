<%@include file="templates/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/6d68bb11b2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://kit.fontawesome.com/6d68bb11b2.css" crossorigin="anonymous">
<!--************************************
                Header End
*************************************-->

<!--************************************
                Carousel Start
*************************************--> <br><br><br><br><br>

<section id="carousel">
    <div id="Advertising" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#Advertising" data-slide-to="0" class="active"></li>
            <li data-target="#Advertising" data-slide-to="1"></li>
            <li data-target="#Advertising" data-slide-to="2"></li>
        </ol>
        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="images/carousel-1.jpg" alt=""/>
            </div>
            <div class="item">
                <img src="images/carousel-2.jpg" alt=""/>
            </div>
        </div>
    </div>
</section>
<!--************************************
                Carousel End
*************************************-->

<!--************************************
                Main Start
*************************************-->

<main>
    <!--************************************
                    Best Selling Start
    *************************************--> 
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="tg-sectionhead">
                        <h2><span>People's Choice</span>Bestselling Books</h2>
                        <a class="tg-btn" href="<%=path%>/productList">View All</a>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div id="tg-bestsellingbooksslider"
                         class="tg-bestsellingbooksslider tg-bestsellingbooks owl-carousel">

                        <c:forEach items="${productList}" var="product">
                            <div class="item">
                                <div class="tg-postbook">
                                    <figure class="tg-featureimg">
                                        <div class="tg-bookimg">
                                            <div class="tg-frontcover"><img src="<%=path%>/products/${product.getImage()}" alt="image description"></div>
                                            <div class="tg-backcover"><img src="<%=path%>/products/${product.getImage()}" alt="image description"></div>
                                        </div>
<!--                                        <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                            <i class="icon-heart"></i>
                                            <span>add to wishlist</span>
                                        </a>-->
                                    </figure>
                                    <div class="tg-postbookcontent">
                                        <ul class="tg-bookscategories">
                                            <li>
                                                <c:forEach items="${cateList}" var="cate">
                                                    <c:if test="${product.getCategoryID() == cate.getCategoryID()}">
                                                        <a href="<%=path%>/productList?categoryID=${product.getCategoryID()}">${cate.getCategoryName()}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </li>
                                            <li>
                                                <c:forEach items="${genreList}" var="genre">
                                                    <c:if test="${product.getGenreID() == genre.getGenreID()}">
                                                        <a href="<%=path%>/productList?genreID=${product.getGenreID()}">${genre.getGenreName()}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </li>
                                        </ul>
                                        <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                        <div class="tg-booktitle">
                                            <h3><a href="<%=path%>/productDetail?proID=${product.getProductID()}">${product.getProductName()}</a></h3>
                                        </div>
                                        <span class="tg-bookwriter">By: 
                                            <c:forEach items="${authorList}" var="author">
                                                <c:if test="${product.getAuthorID() == author.getAuthorID()}">
                                                    <a href="<%=path%>/productList?authorID=${product.getAuthorID()}">${author.getAuthorName()}</a>
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                        <!--<span class="tg-stars"><span></span></span>-->
                                        <c:choose>
                                            <c:when test="${product.getAverageRating()>=0 && product.getAverageRating()<0.5}">
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
                                                <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="tg-bookprice">
                                            <ins>${product.getSalePrice()}</ins>
                                            <del>${product.getCoverPrice()}</del>
                                        </span>
                                        <c:url value="/cart" var="AddToCart">
                                            <c:param name="previousURL" value="homepage" />
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
    </section>
    <!--************************************
                    Best Selling End
    *************************************-->

    <!--************************************
                    Featured Item Start
    *************************************-->
    <section class="tg-bglight tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="tg-featureditm">
                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 hidden-sm hidden-xs">
                        <div class="component">
				<ul class="align">
					<li>
						<figure class='book'>

							<!-- Front -->

							<ul class='hardcover_front'>
                                                            <img style="width: 258px;" src="<%=path%>/products/${comingSoon.getImage()}" alt="image description">

							</ul>

							<!-- Pages -->

							<ul class='page'>
								<li></li>
								<li>
                                                                    <div style="padding: 8px; height: 85%; overflow: hidden;">${comingSoon.getDescription()}</div>
								</li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</figure>
					</li>
				</ul>
			</div>
                        <!--<figure><img src="images/img-02.png" alt="image description"></figure>-->
                        <!--<figure><img style="width: 300px;" src="${comingSoon.getImage()}" alt="image description"></figure>-->
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                        <div class="tg-featureditmcontent">
                            <div class="tg-themetagbox"><span class="tg-themetag">featured</span></div>
                            <div class="tg-booktitle">
                                <h3><a href="javascript:void(0);">${comingSoon.getProductName()}</a>
                                </h3>
                            </div>
                            <span class="tg-bookwriter">By: 
                                <c:forEach items="${authorList}" var="author">
                                    <c:if test="${comingSoon.getAuthorID() == author.getAuthorID()}">
                                        <a href="<%=path%>/productList?authorID=${product.getAuthorID()}">${author.getAuthorName()}</a>
                                    </c:if>
                                </c:forEach>
                            </span>
                            <span class="tg-stars"><span></span></span>
                            <div class="tg-priceandbtn">
                                <span class="tg-bookprice">
                                    <ins>${comingSoon.getSalePrice()}</ins>
                                    <del>${comingSoon.getCoverPrice()}</del>
                                </span>
                                <a class="tg-btn tg-btnstyletwo tg-active" href="javascript:void(0);">
                                    <i class="fa fa-shopping-basket"></i>
                                    <em>Coming Soon</em>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    Featured Item End
    *************************************-->
    <!--************************************
                    New Release Start
    *************************************--> <br><br><br><br><br>
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="tg-newrelease">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="tg-sectionhead">
                            <h2><span>Taste The New Spice</span>New Release Books</h2>
                        </div>
                        <div class="tg-description">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                        <div class="tg-btns">
<!--                            <a class="tg-btn tg-active" href="javascript:void(0);">View All</a>
                            <a class="tg-btn" href="javascript:void(0);">Read More</a>-->
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="row">
                            <div class="tg-newreleasebooks">
                                <c:forEach items="${newReleaseList}" var="newRelease">
                                    <div class="col-xs-4 col-sm-4 col-md-6 col-lg-4">
                                        <div class="tg-postbook">
                                            <figure class="tg-featureimg">
                                                <div class="tg-bookimg">
                                                    <div class="tg-frontcover"><img src="<%=path%>/products/${newRelease.getImage()}"></div>
                                                    <div class="tg-backcover"><img src="<%=path%>/products/${newRelease.getImage()}"alt="image description"></div>
                                                </div>
<!--                                                <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                    <i class="icon-heart"></i>
                                                    <span>add to wishlist</span>
                                                </a>-->
                                            </figure>
                                            <div class="tg-postbookcontent">
                                                <ul class="tg-bookscategories">
                                                    <c:forEach items="${cateList}" var="cate">
                                                        <c:if test="${newRelease.getCategoryID() == cate.getCategoryID()}">
                                                            <li><a href="<%=path%>/productList?categoryID=${cate.getCategoryID()}">${cate.getCategoryName()}</a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:forEach items="${genreList}" var="genre">
                                                            <c:if test="${newRelease.getGenreID() == genre.getGenreID()}">
                                                            <li><a href="<%=path%>/productList?genreID=${genre.getGenreID()}">${genre.getGenreName()}</a></li>
                                                            </c:if>
                                                        </c:forEach>
                                                </ul>
                                                <div class="tg-booktitle">
                                                    <h3><a href="<%=path%>/productDetail?proID=${newRelease.getProductID()}">${newRelease.getProductName()}</a>
                                                    </h3>
                                                </div>
                                                <span class="tg-bookwriter">By: 
                                                    <c:forEach items="${authorList}" var="author">
                                                        <c:if test="${newRelease.getAuthorID() == author.getAuthorID()}">
                                                            <a href="<%=path%>/productList?authorID=${author.getAuthorID()}">${author.getAuthorName()}</a>
                                                        </c:if>
                                                    </c:forEach>

                                                </span>
                                                <c:choose>
                                                    <c:when test="${newRelease.getAverageRating()>0 && newRelease.getAverageRating()<0.5}">
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${newRelease.getAverageRating()>=0.5 && newRelease.getAverageRating()<1.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${newRelease.getAverageRating()>=1.5 && newRelease.getAverageRating()<2.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${newRelease.getAverageRating()>=2.5 && newRelease.getAverageRating()<3.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${newRelease.getAverageRating()>=3.5 && newRelease.getAverageRating()<4.5}">
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
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    New Release End
    *************************************-->

    <!--************************************
                    Picked By Author Start
    *************************************-->
    <section class="tg-sectionspace tg-haslayout">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="tg-sectionhead">
                        <h2><span>Some Great Books</span>Highest Rating</h2>
                        <!--<a class="tg-btn" href="javascript:void(0);">View All</a>-->
                    </div>
                </div>
                <div id="tg-pickedbyauthorslider"
                     class="tg-pickedbyauthor tg-pickedbyauthorslider owl-carousel">
                    <c:forEach items="${listHighRating}" var="product">
                        <div class="item">
                            <div class="tg-postbook">
                                <figure class="tg-featureimg">
                                    <div class="tg-bookimg">
                                        <div class="tg-frontcover"><img src="<%=path%>/products/${product.getImage()}"
                                                                        alt="image description"></div>
                                    </div>
                                    <div class="tg-hovercontent">
                                        <div class="tg-description">
                                            <p>${product.getDescription()}</p>
                                        </div>
                                        <strong class="tg-bookpage">Book Pages: ${product.getNumberOfPage()}</strong>
                                        <c:forEach items="${cateList}" var="cate">
                                            <c:if test="${product.getCategoryID() == cate.getCategoryID()}">
                                                <strong class="tg-bookcategory"><a style="color: #484848" href="<%=path%>/productList?categoryID=${cate.getCategoryID()}">${cate.getCategoryName()}</a></strong>
                                                </c:if>
                                            </c:forEach>
                                        <strong style="display: flex" class="tg-bookprice">Price: ${product.getSalePrice()} <del>${product.getCoverPrice()}</del></strong>
                                        <div class="tg-ratingbox"><span><c:choose>
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
                                                    <c:when test="${product.getAverageRating()>=4.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:otherwise>
                                                </c:choose></span></div>
                                    </div>
                                </figure>
                                <div class="tg-postbookcontent">
                                    <div class="tg-booktitle">
                                        <h3><a href="javascript:void(0);">${product.getProductName()}</a></h3>
                                    </div>
                                    <c:url value="/cart" var="AddToCart">
                                            <c:param name="previousURL" value="homepage" />
                                            <c:param name="proID" value="${product.getProductID()}" />
                                        </c:url>
                                    <c:forEach items="${authorList}" var="author">
                                        <c:if test="${product.getAuthorID() == author.getAuthorID()}">
                                            <span class="tg-bookwriter">By: <a href="<%=path%>/productList?authorID=${author.getAuthorID()}">${author.getAuthorName()}</a></span>
                                            <a class="tg-btn tg-btnstyletwo" href="${AddToCart}">
                                                <i class="fa fa-shopping-basket"></i>
                                                <em>Add To Cart</em>
                                            </a>
                                        </c:if>
                                        </c:forEach>
                                    
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!--************************************
                    Picked By Author End
    *************************************-->

</main>

<!--************************************
                Main End
*************************************-->
<!--************************************
                Footer Start
*************************************-->
<%@include file="templates/footer.jsp" %>
<style>
    
::before,
::after {
	content: "";
}



/*body {
	background: #deebef;
	color: #34495e;
	font-family: 'Lato', 'Arial', sans-serif;
	font-weight: 400;
	line-height: 1.2;
}*/

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	color: #2c3e50;
	text-decoration: none;
}

.btn {
	display: inline-block;
	text-transform: uppercase;
	border: 2px solid #2c3e50;
	margin-top: 100px; 
	font-size: 0.7em;
	font-weight: 700;
	padding: 0.1em 0.4em;
	text-align: center;
	-webkit-transition: color 0.3s, border-color 0.3s;
	-moz-transition: color 0.3s, border-color 0.3s;
	transition: color 0.3s, border-color 0.3s;
}

.btn:hover {
	border-color: #16a085;
	color: #16a085;
}

/* basic grid, only for this demo */

.align {
	clear: both;
	margin: 90px auto 20px;
	width: 100%;
	max-width: 500px; /*                       1170px*/
	text-align: center;
}

.align > li {
	width: 500px;
	min-height: 300px;
	display: inline-block;
	margin: 30px 20px 30px 30px;
	padding: 0 0 0 60px;
	vertical-align: top;
}

/* ///////////////////////////////////////////////////

HARDCOVER
Table of Contents

1. container
2. background & color
3. opening cover, back cover and pages
4. position, transform y transition
5. events
6. Bonus
	- Cover design
	- Ribbon
	- Figcaption
7. mini-reset

/////////////////////////////////////////////////////*/

/*
	1. container
*/

.book {
	position: relative;
	width: 160px; 
	height: 220px;
	-webkit-perspective: 1000px;
	-moz-perspective: 1000px;
	perspective: 1000px;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

/*
	2. background & color
*/

/* HARDCOVER FRONT */
.hardcover_front li:first-child {
	background-color: #eee;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
}

/* reverse */
.hardcover_front li:last-child {
	background: #fffbec;
}

/* HARDCOVER BACK */
.hardcover_back li:first-child {
	background: #fffbec;
}

/* reverse */
.hardcover_back li:last-child {
	background: #fffbec;
}

.book_spine li:first-child {
	background: #eee;
}
.book_spine li:last-child {
	background: #333;
}

/* thickness of cover */

.hardcover_front li:first-child:after,
.hardcover_front li:first-child:before,
.hardcover_front li:last-child:after,
.hardcover_front li:last-child:before,
.hardcover_back li:first-child:after,
.hardcover_back li:first-child:before,
.hardcover_back li:last-child:after,
.hardcover_back li:last-child:before,
.book_spine li:first-child:after,
.book_spine li:first-child:before,
.book_spine li:last-child:after,
.book_spine li:last-child:before {
	background: #999;
}

/* page */

.page > li {
	background: -webkit-linear-gradient(left, #e1ddd8 0%, #fffbf6 100%);
	background: -moz-linear-gradient(left, #e1ddd8 0%, #fffbf6 100%);
	background: -ms-linear-gradient(left, #e1ddd8 0%, #fffbf6 100%);
	background: linear-gradient(left, #e1ddd8 0%, #fffbf6 100%);
	box-shadow: inset 0px -1px 2px rgba(50, 50, 50, 0.1), inset -1px 0px 1px rgba(150, 150, 150, 0.2);
	border-radius: 0px 5px 5px 0px;
}

/*
	3. opening cover, back cover and pages
*/

.hardcover_front {
	-webkit-transform: rotateY(-34deg) translateZ(8px);
	-moz-transform: rotateY(-34deg) translateZ(8px);
	transform: rotateY(-34deg) translateZ(8px);
	z-index: 100;
}

.hardcover_back {
	-webkit-transform: rotateY(-15deg) translateZ(-8px);
	-moz-transform: rotateY(-15deg) translateZ(-8px);
	transform: rotateY(-15deg) translateZ(-8px);
}

.page li:nth-child(1) {
	-webkit-transform: rotateY(-28deg);
	-moz-transform: rotateY(-28deg);
	transform: rotateY(-28deg);
}

.page li:nth-child(2) {
	-webkit-transform: rotateY(-30deg);
	-moz-transform: rotateY(-30deg);
	transform: rotateY(-30deg);
}

.page li:nth-child(3) {
	-webkit-transform: rotateY(-32deg);
	-moz-transform: rotateY(-32deg);
	transform: rotateY(-32deg);
}

.page li:nth-child(4) {
	-webkit-transform: rotateY(-34deg);
	-moz-transform: rotateY(-34deg);
	transform: rotateY(-34deg);
}

.page li:nth-child(5) {
	-webkit-transform: rotateY(-36deg);
	-moz-transform: rotateY(-36deg);
	transform: rotateY(-36deg);
}

/*
	4. position, transform & transition
*/

.hardcover_front,
.hardcover_back,
.book_spine,
.hardcover_front li,
.hardcover_back li,
.book_spine li {
	position: absolute;
	top: 0;
	left: 0;
	width: 75%;
	height: 130%;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.hardcover_front,
.hardcover_back {
	-webkit-transform-origin: 0% 100%;
	-moz-transform-origin: 0% 100%;
	transform-origin: 0% 100%;
}

.hardcover_front {
	-webkit-transition: all 0.8s ease, z-index 0.6s;
	-moz-transition: all 0.8s ease, z-index 0.6s;
	transition: all 0.8s ease, z-index 0.6s;
}

/* HARDCOVER front */
.hardcover_front li:first-child {
	cursor: default;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
	-webkit-transform: translateZ(2px);
	-moz-transform: translateZ(2px);
	transform: translateZ(2px);
}

.hardcover_front li:last-child {
	-webkit-transform: rotateY(180deg) translateZ(2px);
	-moz-transform: rotateY(180deg) translateZ(2px);
	transform: rotateY(180deg) translateZ(2px);
}

/* HARDCOVER back */
.hardcover_back li:first-child {
	-webkit-transform: translateZ(2px);
	-moz-transform: translateZ(2px);
	transform: translateZ(2px);
}

.hardcover_back li:last-child {
	-webkit-transform: translateZ(-2px);
	-moz-transform: translateZ(-2px);
	transform: translateZ(-2px);
}

/* thickness of cover */
.hardcover_front li:first-child:after,
.hardcover_front li:first-child:before,
.hardcover_front li:last-child:after,
.hardcover_front li:last-child:before,
.hardcover_back li:first-child:after,
.hardcover_back li:first-child:before,
.hardcover_back li:last-child:after,
.hardcover_back li:last-child:before,
.book_spine li:first-child:after,
.book_spine li:first-child:before,
.book_spine li:last-child:after,
.book_spine li:last-child:before {
	position: absolute;
	top: 0;
	left: 0;
}

/* HARDCOVER front */
.hardcover_front li:first-child:after,
.hardcover_front li:first-child:before {
	width: 4px;
	height: 100%;
}

.hardcover_front li:first-child:after {
	-webkit-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	-moz-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	transform: rotateY(90deg) translateZ(-2px) translateX(2px);
}

.hardcover_front li:first-child:before {
	-webkit-transform: rotateY(90deg) translateZ(158px) translateX(2px);
	-moz-transform: rotateY(90deg) translateZ(158px) translateX(2px);
	transform: rotateY(90deg) translateZ(158px) translateX(2px);
}

.hardcover_front li:last-child:after,
.hardcover_front li:last-child:before {
	width: 4px;
	height: 160px;
}

.hardcover_front li:last-child:after {
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(-2px) translateY(-78px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(-2px) translateY(-78px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(-2px) translateY(-78px);
}
.hardcover_front li:last-child:before {
	box-shadow: 0px 0px 30px 5px #333;
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(-2px) translateY(-78px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(-2px) translateY(-78px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(-2px) translateY(-78px);
}

/* thickness of cover */

.hardcover_back li:first-child:after,
.hardcover_back li:first-child:before {
	width: 4px;
	height: 100%;
}

.hardcover_back li:first-child:after {
	-webkit-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	-moz-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	transform: rotateY(90deg) translateZ(-2px) translateX(2px);
}
.hardcover_back li:first-child:before {
	-webkit-transform: rotateY(90deg) translateZ(158px) translateX(2px);
	-moz-transform: rotateY(90deg) translateZ(158px) translateX(2px);
	transform: rotateY(90deg) translateZ(158px) translateX(2px);
}

.hardcover_back li:last-child:after,
.hardcover_back li:last-child:before {
	width: 4px;
	height: 160px;
}

.hardcover_back li:last-child:after {
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(2px) translateY(-78px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(2px) translateY(-78px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(80px) translateX(2px) translateY(-78px);
}

.hardcover_back li:last-child:before {
	box-shadow: 10px -1px 80px 20px #666;
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(2px) translateY(-78px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(2px) translateY(-78px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(-140px) translateX(2px) translateY(-78px);
}

/* BOOK SPINE */
.book_spine {
	-webkit-transform: rotateY(60deg) translateX(-5px) translateZ(-12px);
	-moz-transform: rotateY(60deg) translateX(-5px) translateZ(-12px);
	transform: rotateY(60deg) translateX(-5px) translateZ(-12px);
	width: 16px;
	z-index: 0;
}

.book_spine li:first-child {
	-webkit-transform: translateZ(2px);
	-moz-transform: translateZ(2px);
	transform: translateZ(2px);
}

.book_spine li:last-child {
	-webkit-transform: translateZ(-2px);
	-moz-transform: translateZ(-2px);
	transform: translateZ(-2px);
}

/* thickness of book spine */
.book_spine li:first-child:after,
.book_spine li:first-child:before {
	width: 4px;
	height: 100%;
}

.book_spine li:first-child:after {
	-webkit-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	-moz-transform: rotateY(90deg) translateZ(-2px) translateX(2px);
	transform: rotateY(90deg) translateZ(-2px) translateX(2px);
}

.book_spine li:first-child:before {
	-webkit-transform: rotateY(-90deg) translateZ(-12px);
	-moz-transform: rotateY(-90deg) translateZ(-12px);
	transform: rotateY(-90deg) translateZ(-12px);
}

.book_spine li:last-child:after,
.book_spine li:last-child:before {
	width: 4px;
	height: 16px;
}

.book_spine li:last-child:after {
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(8px) translateX(2px) translateY(-6px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(8px) translateX(2px) translateY(-6px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(8px) translateX(2px) translateY(-6px);
}

.book_spine li:last-child:before {
	box-shadow: 5px -1px 100px 40px rgba(0, 0, 0, 0.2);
	-webkit-transform: rotateX(90deg) rotateZ(90deg) translateZ(-210px) translateX(2px) translateY(-6px);
	-moz-transform: rotateX(90deg) rotateZ(90deg) translateZ(-210px) translateX(2px) translateY(-6px);
	transform: rotateX(90deg) rotateZ(90deg) translateZ(-210px) translateX(2px) translateY(-6px);
}

.page,
.page > li {
	position: absolute;
	top: 0;
	left: 0;
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	transform-style: preserve-3d;
}

.page {
	width: 100%;
	height: 98%;
	top: 1%;
	left: 3%;
	z-index: 10;
}
/*here*/
.page > li {
	width: 57%;
	height: 170%;
	-webkit-transform-origin: left center;
	-moz-transform-origin: left center;
	transform-origin: left center;
	-webkit-transition-property: transform;
	-moz-transition-property: transform;
	transition-property: transform;
	-webkit-transition-timing-function: ease;
	-moz-transition-timing-function: ease;
	transition-timing-function: ease;
}

.page > li:nth-child(1) {
	-webkit-transition-duration: 0.6s;
	-moz-transition-duration: 0.6s;
	transition-duration: 0.6s;
}

.page > li:nth-child(2) {
	-webkit-transition-duration: 0.6s;
	-moz-transition-duration: 0.6s;
	transition-duration: 0.6s;
}

.page > li:nth-child(3) {
	-webkit-transition-duration: 0.4s;
	-moz-transition-duration: 0.4s;
	transition-duration: 0.4s;
}

.page > li:nth-child(4) {
	-webkit-transition-duration: 0.5s;
	-moz-transition-duration: 0.5s;
	transition-duration: 0.5s;
}

.page > li:nth-child(5) {
	-webkit-transition-duration: 0.6s;
	-moz-transition-duration: 0.6s;
	transition-duration: 0.6s;
}

/*
	5. events
*/

.book:hover > .hardcover_front {
	-webkit-transform: rotateY(-145deg) translateZ(0);
	-moz-transform: rotateY(-145deg) translateZ(0);
	transform: rotateY(-145deg) translateZ(0);
	z-index: 0;
}

.book:hover > .page li:nth-child(1) {
	-webkit-transform: rotateY(-30deg);
	-moz-transform: rotateY(-30deg);
	transform: rotateY(-30deg);
	-webkit-transition-duration: 1.5s;
	-moz-transition-duration: 1.5s;
	transition-duration: 1.5s;
}

.book:hover > .page li:nth-child(2) {
	-webkit-transform: rotateY(-35deg);
	-moz-transform: rotateY(-35deg);
	transform: rotateY(-35deg);
	-webkit-transition-duration: 1.8s;
	-moz-transition-duration: 1.8s;
	transition-duration: 1.8s;
}

.book:hover > .page li:nth-child(3) {
	-webkit-transform: rotateY(-118deg);
	-moz-transform: rotateY(-118deg);
	transform: rotateY(-118deg);
	-webkit-transition-duration: 1.6s;
	-moz-transition-duration: 1.6s;
	transition-duration: 1.6s;
}

.book:hover > .page li:nth-child(4) {
	-webkit-transform: rotateY(-130deg);
	-moz-transform: rotateY(-130deg);
	transform: rotateY(-130deg);
	-webkit-transition-duration: 1.4s;
	-moz-transition-duration: 1.4s;
	transition-duration: 1.4s;
}

.book:hover > .page li:nth-child(5) {
	-webkit-transform: rotateY(-140deg);
	-moz-transform: rotateY(-140deg);
	transform: rotateY(-140deg);
	-webkit-transition-duration: 1.2s;
	-moz-transition-duration: 1.2s;
	transition-duration: 1.2s;
}

/*
	6. Bonus
*/

/* cover CSS */

.coverDesign {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	overflow: hidden;
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
}

.coverDesign::after {
	background-image: -webkit-linear-gradient( -135deg, rgba(255, 255, 255, 0.45) 0%, transparent 100%);
	background-image: -moz-linear-gradient( -135deg, rgba(255, 255, 255, 0.45) 0%, transparent 100%);
	background-image: linear-gradient( -135deg, rgba(255, 255, 255, 0.45) 0%, transparent 100%);
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}

.coverDesign h1 {
	color: #fff;
	font-size: 2.2em;
	letter-spacing: 0.05em;
	text-align: center;
	margin: 54% 0 0 0;
	text-shadow: -1px -1px 0 rgba(0,0,0,0.1);
}

.coverDesign p {
	color: #f8f8f8;
	font-size: 1em;
	text-align: center;
	text-shadow: -1px -1px 0 rgba(0,0,0,0.1);
}

.yellow {
	background-color: #f1c40f;
	background-image: -webkit-linear-gradient(top, #f1c40f 58%, #e7ba07 0%);
	background-image: -moz-linear-gradient(top, #f1c40f 58%, #e7ba07 0%);
	background-image: linear-gradient(top, #f1c40f 58%, #e7ba07 0%);
}

.blue {
	background-color: #3498db;
	background-image: -webkit-linear-gradient(top, #3498db 58%, #2a90d4 0%);
	background-image: -moz-linear-gradient(top, #3498db 58%, #2a90d4 0%);
	background-image: linear-gradient(top, #3498db 58%, #2a90d4 0%);
}

.grey {
	background-color: #f8e9d1;
	background-image: -webkit-linear-gradient(top, #f8e9d1 58%, #e7d5b7 0%);
	background-image: -moz-linear-gradient(top, #f8e9d1 58%, #e7d5b7 0%);
	background-image: linear-gradient(top, #f8e9d1 58%, #e7d5b7 0%);
}

/* Basic ribbon */

.ribbon {
	background: #c0392b;
	color: #fff;
	display: block;
	font-size: 0.7em;
	position: absolute;
	top: 11px;
	right: 1px;
	width: 40px;
	height: 20px;
	line-height: 20px;
	letter-spacing: 0.15em; 
	text-align: center;
	-webkit-transform: rotateZ(45deg) translateZ(1px);
	-moz-transform: rotateZ(45deg) translateZ(1px);
	transform: rotateZ(45deg) translateZ(1px);
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	backface-visibility: hidden;
	z-index: 10;
}

.ribbon::before,
.ribbon::after{
	position: absolute;
	top: -20px;
	width: 0;
	height: 0;
	border-bottom: 20px solid #c0392b;
	border-top: 20px solid transparent;
}

.ribbon::before{
	left: -20px;
	border-left: 20px solid transparent;
}

.ribbon::after{
	right: -20px;
	border-right: 20px solid transparent;
}

/* figcaption */

figcaption {
	padding-left: 40px;
	text-align: left;
	position: absolute;
	top: 0%;
	left: 160px;
	width: 310px;
}

figcaption h1 {
	margin: 0;
}

figcaption span {
	color: #16a085;
	padding: 0.6em 0 1em 0;
	display: block;
}

figcaption p {
	color: #63707d;
	line-height: 1.3;
}

/* Media Queries */
@media screen and (max-width: 37.8125em) {
	.align > li {
		width: 100%;
		min-height: 440px;
		height: auto;
		padding: 0;
		margin: 0 0 30px 0;
	}

	.book {
		margin: 0 auto;
	}

	figcaption {
		text-align: center;
		width: 320px;
		top: 250px;
		padding-left: 0;
		left: -80px;
		font-size: 90%;
	}
}
</style>
    