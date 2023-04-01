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
                            <div class="tg-productdetail">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                        <div class="tg-postbook">
                                            <figure class="tg-featureimg"><img src="<%=path%>/products/${productInfor.getImage()}"></figure>
                                            <div class="tg-postbookcontent">
                                                <span class="tg-bookprice">
                                                    <ins>${productInfor.getSalePrice()}</ins>
                                                    <del>${productInfor.getCoverPrice()}</del>
                                                </span>
                                                <span class="tg-bookwriter">You save ${productInfor.getCoverPrice()-productInfor.getSalePrice()} đ̲</span>
                                                <ul class="tg-delevrystock">
                                                    <li><i class="icon-rocket"></i><span>Free delivery worldwide</span></li>
                                                    <li><i class="icon-checkmark-circle"></i><span>Dispatch from the Vietnam in 2 working days </span></li>
                                                            <c:choose>
                                                                <c:when test="${availableInStock > 0}">
                                                            <li><i class="icon-store"></i><span>Status: <em>In Stock: ${availableInStock}</em></span></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                            <li><i class="icon-store"></i><span>Status: <em>Out Of Stock</em></span></li>
                                                                </c:otherwise>
                                                            </c:choose>

                                                </ul>
                                                <div class="tg-quantityholder">
                                                    <em class="minus">-</em>
                                                    <input min="1" type="text" class="result" value="1" id="quantity1" name="quantity">
                                                    <em class="plus">+</em>
                                                </div>
                                                <c:url value="cart" var="AddToCart">
                                                    <c:param name="previousURL" value="../productDetail?proID=${productInfor.getProductID()}" />
                                                    <c:param name="proID" value="${productInfor.getProductID()}" />
                                                </c:url>
                                                <c:set var = "previousURL" scope = "page" value="../productDetail?proID=${productInfor.getProductID()}" />
                                                <!--<a class="tg-btn tg-active tg-btn-lg" href="${AddToCart}">Add To Cart</a>-->
                                                    <div class="tg-btn tg-active tg-btn-lg" onclick="addToCart(${productInfor.getProductID()})">Add To Cart</div>
<!--                                                <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                    <span>add to wishlist</span>
                                                </a>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                        <div class="tg-productcontent">
                                            <ul class="tg-bookscategories">
                                                <li>
                                                    <c:forEach items="${cateList}" var="cate"> 
                                                        <c:if test="${cate.getCategoryID() == productInfor.getCategoryID()}">
                                                            <a href="javascript:void(0);">
                                                                ${cate.getCategoryName()}
                                                            </a>
                                                        </c:if>
                                                    </c:forEach>

                                                </li>
                                            </ul>
                                            <c:choose>
                                                <c:when test="${availableInStock > 0}">
                                                    <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>

                                                </c:when>
                                                <c:otherwise>
                                                    <div class="tg-themetagbox"><span class="tg-themetag">Out Of Stock</span></div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="tg-booktitle">
                                                <h3>${productInfor.getProductName()}</h3>
                                            </div>
                                            <span class="tg-bookwriter">By: 
                                                <c:forEach items="${authorList}" var="author"> 
                                                    <c:if test="${author.getAuthorID() == productInfor.getAuthorID()}">
                                                        <a href="<%=path%>/productList?authorID=${author.getAuthorID()}">${author.getAuthorName()}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </span>
                                            <c:choose>
                                                    <c:when test="${productInfor.getAverageRating()>0 && productInfor.getAverageRating()<0.5}">
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${productInfor.getAverageRating()>=0.5 && productInfor.getAverageRating()<1.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${productInfor.getAverageRating()>=1.5 && productInfor.getAverageRating()<2.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${productInfor.getAverageRating()>=2.5 && productInfor.getAverageRating()<3.5}">
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                    </c:when>
                                                    <c:when test="${productInfor.getAverageRating()>=3.5 && productInfor.getAverageRating()<4.5}">
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
                                                        

                                            <div class="tg-share">
                                                <span>Share:</span>
                                                <ul class="tg-socialicons">
                                                    <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                    <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                    <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                    <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                    <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="tg-description">
                                                <p>${productInfor.getDescription()}</p>
                                            </div>
                                            <div class="tg-sectionhead">
                                                <h2>Product Details</h2>
                                            </div>
                                            <ul class="tg-productinfo">

                                                <li><span>Author: </span>
                                                    <c:forEach items="${authorList}" var="author"> 
                                                        <c:if test="${author.getAuthorID() == productInfor.getAuthorID()}">
                                                            <span>${author.getAuthorName()}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </li>
                                                <li><span>Translator: </span><span>${productInfor.getTranslator()}</span></li>
                                                <li><span>Language: </span><span>${productInfor.getLanguage()}</span></li>
                                                <li><span>Format: </span><span>${productInfor.getFormat()}</span></li>
                                                <li><span>Size: </span><span>${productInfor.getSize()}cm | ${productInfor.getWeight()}g</span></li>
                                                <li><span>Number of page: </span><span>${productInfor.getNumberOfPage()}</span></li>
                                                <li><span>Category: </span>
                                                    <c:forEach items="${cateList}" var="cate"> 
                                                        <c:if test="${cate.getCategoryID() == productInfor.getCategoryID()}">
                                                            <span>${cate.getCategoryName()}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </li>
                                                <li><span>Genre: </span>
                                                    <c:forEach items="${genreList}" var="genre"> 
                                                        <c:if test="${genre.getGenreID() == productInfor.getGenreID()}">
                                                            <span>${genre.getGenreName()}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </li>
                                                <li><span>Publisher: </span>
                                                    <c:forEach items="${supplierList}" var="publisher"> 
                                                        <c:if test="${publisher.getSupplierID() == productInfor.getPublisherID()}">
                                                            <span>${publisher.getSupplierName()}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </li>
                                                <li><span>Supplier: </span>
                                                    <c:forEach items="${supplierList}" var="supplier"> 
                                                        <c:if test="${supplier.getSupplierID() == productInfor.getSupplierID()}">
                                                            <span>${supplier.getSupplierName()}</span>
                                                        </c:if>
                                                    </c:forEach>
                                                </li>
                                                <li><span>Publish date: </span><span>${productInfor.getPublishDate()}</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="tg-productdescription">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="tg-sectionhead">
                                                <h2>Product Description</h2>
                                            </div>
                                            <ul class="tg-themetabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#description" data-toggle="tab">Description</a></li>
                                                <li role="presentation"><a href="#review" data-toggle="tab">Reviews</a></li>
                                            </ul>
                                            <div class="tg-tab-content tab-content">

                                                <div role="tabpanel" class="tg-tab-pane tab-pane active" id="description">
                                                    <div class="tg-description">
                                                        <p>${productInfor.getDescription()}</p>                                                      
                                                    </div>
                                                </div>
                                                    <div role="tabpanel" class="tg-tab-pane tab-pane" id="review" >
                                                    <c:forEach items="${reviewList}" var="review">
                                                        
                                                        <div style="margin-left: 20px;">
                                                            <span><img src="<%=path%>/images/users/icon-user.png" alt="anh customer"></span>
                                                            <span>
                                                                <c:forEach items="${cusList}" var="cus">
                                                                    <c:if test="${review.getCustomerID() == cus.getCustomerID()}">${cus.getFirstName() }</c:if>
                                                                </c:forEach>
                                                            </span>
                                                        </div>
                                                        <div style="margin-left: 70px; display: flex; flex-wrap: wrap ">
                                                            <div style="width: 30%">
                                                                <c:choose>
                                                                    <c:when test="${review.getImage()!=null}">
                                                                        <img style="max-width: 40%;" src="<%=path%>/uploads/${review.getImage()}" alt="abc">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img style="max-width: 40%;" src="<%=path%>/uploads/img-10.jpg" alt="abc">
                                                                    </c:otherwise>
                                                                        
                                                                </c:choose>
                                                                
                                                            </div>
                                                            <div style="width: 70%;padding-top: 1%;">
                                                            
                                                            <c:choose>
                                                                <c:when test="${review.getRating() ==0}">
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                </c:when>
                                                                <c:when test="${review.getRating()==1}">
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                </c:when>
                                                                <c:when test="${review.getRating()==2}">
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                </c:when>
                                                                <c:when test="${review.getRating()==3}">
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                </c:when>
                                                                <c:when test="${review.getRating()==4}">
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
                                                                    <br>
                                                            <div>${review.getComment()}</div><br>
                                                            
                                                            <div>${review.getReviewDate()}</div>
                                                        </div>
                                                        </div>
                                                            <hr/>
                                                        <!--</div>-->
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tg-aboutauthor">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="tg-sectionhead">
                                                <h2>About Author</h2>
                                            </div>
                                            <div class="tg-authorbox">
                                                <figure class="tg-authorimg">
                                                    <img src="images/users/icon-user.png" alt=""/>
                                                </figure>
                                                <div class="tg-authorinfo">
                                                    <div class="tg-authorhead">
                                                        <div class="tg-leftarea">
                                                            <div class="tg-authorname">
                                                                <h2 style="padding: 10px">
                                                                    <c:forEach items="${authorList}" var="author"> 
                                                                        <c:if test="${author.getAuthorID() == productInfor.getAuthorID()}">
                                                                            <a href="<%=path%>/productList?authorID=${author.getAuthorID()}">${author.getAuthorName()}</a>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </h2>
                                                                <span>Author Since: June 27, 2017</span>
                                                            </div>
                                                        </div>
                                                        <div class="tg-rightarea">
                                                            <ul class="tg-socialicons">
                                                                <li class="tg-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook"></i></a></li>
                                                                <li class="tg-twitter"><a href="javascript:void(0);"><i class="fa fa-twitter"></i></a></li>
                                                                <li class="tg-linkedin"><a href="javascript:void(0);"><i class="fa fa-linkedin"></i></a></li>
                                                                <li class="tg-googleplus"><a href="javascript:void(0);"><i class="fa fa-google-plus"></i></a></li>
                                                                <li class="tg-rss"><a href="javascript:void(0);"><i class="fa fa-rss"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="tg-description">
                                                        <p></p>
                                                    </div>
                                                    <a class="tg-btn tg-active" href="javascript:void(0);">View All Books</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tg-relatedproducts">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="tg-sectionhead">
                                                <h2><span>Related Products</span>You May Also Like</h2>
                                                <a class="tg-btn" href="javascript:void(0);">View All</a>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="tg-relatedproductslider" class="tg-relatedproductslider tg-relatedbooks owl-carousel">
                                                <c:forEach items="${similarProductList}" var="similarProduct">
                                                    <div class="item">
                                                        <div class="tg-postbook">
                                                            <figure class="tg-featureimg">
                                                                <div class="tg-bookimg">
                                                                    <!--                                                                    <div class="tg-frontcover"><img src="images/books/img-01.jpg" alt="image description"></div>-->
                                                                    <div class="tg-frontcover"><img src="<%=path%>/products/${similarProduct.getImage()}" alt="image description"></div>
                                                                    <div class="tg-backcover"><img src="<%=path%>/products/${similarProduct.getImage()}" alt="image description"></div>
                                                                </div>
<!--                                                                <a class="tg-btnaddtowishlist" href="javascript:void(0);">
                                                                    <i class="icon-heart"></i>
                                                                    <span>add to wishlist</span>
                                                                </a>-->
                                                            </figure>
                                                            <div class="tg-postbookcontent">
                                                                <ul class="tg-bookscategories">
                                                                    <c:forEach items="${cateList}" var="cate">
                                                                        <c:if test="${similarProduct.getCategoryID() == cate.getCategoryID()}">
                                                                            <li><a href="<%=path%>/productList?categoryID=${similarProduct.getCategoryID()}">${cate.getCategoryName()}</a></li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <c:forEach items="${genreList}" var="genre">
                                                                            <c:if test="${similarProduct.getGenreID() == genre.getGenreID()}">
                                                                            <li><a href="<%=path%>/productList?categoryID=${similarProduct.getGenreID()}">${genre.getGenreName()}</a></li>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                </ul>
                                                                <div class="tg-themetagbox"><span class="tg-themetag">sale</span></div>
                                                                <div class="tg-booktitle">
                                                                    <h3><a href="<%=path%>/productDetail?proID=${similarProduct.getProductID()}">${similarProduct.getProductName()}</a></h3>
                                                                </div>
                                                                <span class="tg-bookwriter">By: 
                                                                    <c:forEach items="${authorList}" var="author">
                                                                        <c:if test="${similarProduct.getAuthorID() == author.getAuthorID()}">
                                                                            <a href="<%=path%>/productList?authorID=${similarProduct.getAuthorID()}">${author.getAuthorName()}</a>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </span>
                                                                <c:choose>
                                                                    <c:when test="${similarProduct.getAverageRating()>0 && similarProduct.getAverageRating()<0.5}">
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    </c:when>
                                                                    <c:when test="${similarProduct.getAverageRating()>=0.5 && similarProduct.getAverageRating()<1.5}">
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    </c:when>
                                                                    <c:when test="${similarProduct.getAverageRating()>=1.5 && similarProduct.getAverageRating()<2.5}">
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    </c:when>
                                                                    <c:when test="${similarProduct.getAverageRating()>=2.5 && similarProduct.getAverageRating()<3.5}">
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                        <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                    </c:when>
                                                                    <c:when test="${similarProduct.getAverageRating()>=3.5 && similarProduct.getAverageRating()<4.5}">
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
                                                                    <ins>${similarProduct.getSalePrice()}</ins>
                                                                    <del>${similarProduct.getCoverPrice()}</del>
                                                                </span>
                                                                <c:url value="/cart" var="AddToCart">
                                                                    <c:param name="previousURL" value="../productDetail"/>
                                                                    <c:param name="proID" value="${similarProduct.getProductID()}" />
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
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-left">
                        <aside id="tg-sidebar" class="tg-sidebar">
                            <div class="tg-widget tg-catagories">
                                <div class="tg-widgettitle">
                                    <h3>Categories</h3>
                                </div>
                                <div class="tg-widgetcontent" style="overflow: auto;
                                                                             height: 265px;">
                                    <ul>
                                        <c:forEach items="${cateList}" var="cate">
                                            <li>
                                                <a href="<%=path%>/productList?categoryID=${cate.getCategoryID()}" > <span>${cate.getCategoryName()}</span></a>
                                            </li>
                                        </c:forEach>
                                        <!--<li><a href="<%=path%>/productList"><span>View All</span></a></li>-->

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
                                <div class="tg-widgettitle">
                                    <h3>Supplier</h3>
                                </div>
                                <div class="tg-widgetcontent" style="overflow: auto;
                                                                             height: 265px;">
                                    <ul>
                                        <c:forEach items="${SupList}" var="supplier">
                                            <li>
                                                <a href="<%=path%>/productList?supplierID=${supplier.getSupplierID()}"> <span>${supplier.getSupplierName()}</span></a>
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
                                            <a href="<%=path%>/productList?language=1"> <span>Vietnamese</span></a>
                                        </li></ul>
                                    <ul>
                                        <li>
                                            <a href="<%=path%>/productList?language=2"> <span>Foreign</span></a>
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
                                            <a href="<%=path%>/productList?format=1"> <span>Softcover</span></a>
                                        </li></ul>
                                    <ul>
                                        <li>
                                            <a href="<%=path%>/productList?format=2"> <span>Hardcover</span></a>
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
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
        <script>
            function addToCart(param,param1){
                var quantity = document.getElementById("quantity1").value;
                window.location.href = '<%=request.getContextPath()%>/cart?proID=' + param + '&quantity=' + quantity +'&previousURL=<%=request.getContextPath()%>/productDetail?proID='+param;
            }
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
                        function searchByName(param){
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
                        function searchByCategory(param){
                            
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
                        
                        function searchByGenre(param){
                            
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
                        
                        function searchBySupplier(param){
                            
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
                        function searchByLanguage(param){
                            
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
                        function searchByFormat(param){
                            
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
                        function searchByPriceDomain(param){
                            
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
                        function sortByName(){
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
                        function sortByIncreasePrice(){
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
                        function sortByDecreasePrice(){
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
                        function sortByNewest(){
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
                        function sortByOldest(){
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