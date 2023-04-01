<%@include file="templates/header.jsp" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="<%=path%>/css/profile.css">  
<script src="https://kit.fontawesome.com/6d68bb11b2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://kit.fontawesome.com/6d68bb11b2.css" crossorigin="anonymous">



<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="profile-nav col-md-3">
            <div class="panel">
                <div class="user-heading round">
                    <a href="#">
                        <img src="${AccCustomerSession.getImage().replace("=s96-c", "")}" alt="">
                    </a>
                    <h1>${userGoogle.getName()}</h1>
                    <p style="color: black;">${userGoogle.getEmail()}</p>

                </div>

                <ul class="nav nav-pills nav-stacked">
                    <li><a href="<%=path%>/account/profile"> <i class="fa fa-user"></i> Profile</a></li>
                    <li class="active"><a href="<%=path%>/account/profile_myOrder"> <i class="fa fa-calendar"></i> All Order <span class="label label-warning r-activity">9</span></a></li>
                    <li ><a href="<%=path%>/account/profile1"> <i class="fa fa-edit"></i> Edit profile</a></li>
                </ul>
            </div>
        </div>
        <div class="profile-info col-md-9">
            <div class="panel">
                <div class="bio-graph-heading">
                    My Orders
                </div>
                <div class="panel-body bio-graph-info">
                    <section class="gradient-custom">
                        <div class="row d-flex justify-content-center align-items-center">
                            <div>
                                <div class="card" style="border-radius: 10px;">
                                    <div class="card-body p-4">


                                        <div class="card shadow-0 border mb-4">
                                            <div class="col-12 odt-title d-flex">

                                                <span>OrderID: ${order.getOrderID()}</span>
                                                <span>Order date: ${order.getOrderDate()}</span>
                                                <span>Status: Delivered</span>
                                            </div>
                                                <br>
                                            <c:forEach items="${orderDetailList}" var="odDetailList">
                                                <c:if test="${order.getOrderID() == odDetailList.getOrderID() && odDetailList.isReviewed()==false}">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <c:forEach items="${productList}" var="product">
                                                                <c:if test="${product.getProductID() == odDetailList.getProductID()}">
                                                                    <div class="col-md-2">
                                                                        <img style="width: 90%;" src="<%=path%>/products/${product.getImage()}"
                                                                             class="img-fluid" alt="Phone">
                                                                    </div>
                                                                    <div style="padding: 8px;" class="col-md-4">
                                                                        <p style="margin-bottom: 15px;">${product.getProductName()}</p>
                                                                        <p style="margin-bottom: 15px;">${product.getNumberOfPage()} pages</p>
                                                                        <p style="margin-bottom: 15px;">${odDetailList.getSalePrice()} </p>
                                                                        <p style="margin-bottom: 0px">x${odDetailList.getQuantity()}</p>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                            <form method="POST" action="AccountProfile2_review" enctype="multipart/form-data">

                                                                <div class="col-md-6" style="display: flex; flex-wrap: wrap"> 
                                                                    <strong style="    margin-top: 5px;
                                                                            margin-right: 20px;    color: #555555;">Rating:</strong>
                                                                    <section id="rate" class="rating">
                                                                        <!-- FIFTH STAR -->
                                                                        <input type="radio" id="star_5" name="rate" value="5" />
                                                                        <label for="star_5" title="Five">&#9733;</label>
                                                                        <!-- FOURTH STAR -->
                                                                        <input type="radio" id="star_4" name="rate" value="4" />
                                                                        <label for="star_4" title="Four">&#9733;</label>
                                                                        <!-- THIRD STAR -->
                                                                        <input type="radio" id="star_3" name="rate" value="3" />
                                                                        <label for="star_3" title="Three">&#9733;</label>
                                                                        <!-- SECOND STAR -->
                                                                        <input type="radio" id="star_2" name="rate" value="2" />
                                                                        <label for="star_2" title="Two">&#9733;</label>
                                                                        <!-- FIRST STAR -->
                                                                        <input type="radio" id="star_1" name="rate" value="1" />
                                                                        <label for="star_1" title="One">&#9733;</label>
                                                                    </section>

                                                                    <div class="file-upload">
                                                                        <div class="file-select">
                                                                            <div class="file-select-button" id="fileName">Add image Review</div>
                                                                            <div class="file-select-name" id="noFile" style="width: 403px;">No image chosen...</div> 
                                                                            <input type="file" name="chooseFile" accept="image/*,.jpg,.jepg,.png" id="chooseFile">
                                                                        </div>
                                                                    </div>

                                                                    <input style="display: none;" name="orderID" value="${odDetailList.getOrderID()}">
                                                                    <input style="display: none;" name="productID" value="${odDetailList.getProductID()}">

                                                                    <textarea rows="4" cols="50" style="    background: #eeeeee;
                                                                              width: 408px;
                                                                              height: 73px;
                                                                              position: relative;" name="txtComment" type="text" placeholder="Enter your review"/></textarea>
                                                                    <input style="position: absolute;
                                                                           padding: 3px;
                                                                           bottom: 4px;
                                                                           right: 20px;
                                                                           width: 70px;
                                                                           border-radius: inherit;
                                                                           background: #ffa000;
                                                                           color: #393939;
                                                                           border-radius: 5px;" 
                                                                           type="submit" value="Review" />
                                                                </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                    <hr style="margin: 10px; border-top: 1px solid black;">
                                                </c:if>
                                                <c:if test="${order.getOrderID() == odDetailList.getOrderID() && odDetailList.isReviewed()==true}">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <c:forEach items="${productList}" var="product">
                                                                <c:if test="${product.getProductID() == odDetailList.getProductID()}">
                                                                    <div class="col-md-2">
                                                                        <img style="width: 90%;" src="<%=path%>/products/${product.getImage()}"
                                                                             class="img-fluid" alt="Phone">
                                                                    </div>
                                                                    <div style="padding: 8px;" class="col-md-4">
                                                                        <p style="margin-bottom: 15px;">${product.getProductName()}</p>
                                                                        <p style="margin-bottom: 15px;">${product.getNumberOfPage()} pages</p>
                                                                        <p style="margin-bottom: 15px;">${odDetailList.getSalePrice()} </p>
                                                                        <p style="margin-bottom: 0px">x${odDetailList.getQuantity()}</p>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                            <div style="display: flex; flex-wrap: wrap;">
                                                                <c:forEach items="${reviewList}" var="review">
                                                                    <c:if test="${review.getProductID() == odDetailList.getProductID()}">
                                                                        <div style="flex: 100%;">
                                                                            Feedback:
                                                                        </div>
                                                                        <div style="flex: 30%;">
                                                                            <img src="<%=path%>/uploads/${review.getImage()}" alt="review" style="width: 75%;">
                                                                        </div>

                                                                        <div style="flex: 70%;">Rating: 
                                                                            <c:choose>
                                                                                <c:when test="${review.getRating()>=0 && review.getRating()<0.5}">
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                </c:when>
                                                                                <c:when test="${review.getRating()>=0.5 && review.getRating()<1.5}">
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                </c:when>
                                                                                <c:when test="${review.getRating()>=1.5 && review.getRating()<2.5}">
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                </c:when>
                                                                                <c:when test="${review.getRating()>=2.5 && review.getRating()<3.5}">
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #f7e400;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                    <i class="fa-solid fa-star" style="color: #bcbcb5;"></i>
                                                                                </c:when>
                                                                                <c:when test="${review.getRating()>=3.5 && review.getRating()<4.5}">
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
                                                                            <div>Comment: ${review.getComment()} </div>
                                                                        </div>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <hr style="margin: 10px; border-top: 1px solid black;">
                                                </c:if>
                                            </c:forEach>
<!--                                            <div class="card-footer" >
                                                <h5>Total paid: <span class="h2 mb-0 ms-2">$1040</span></h5>
                                                <div class="card-footer"></div>
                                            </div>-->
                                            <hr>
                                        </div>    

                                    </div>
                                </div>
                            </div>

                        </div>
                    </section>                            
                </div>
            </div>
        </div>
<!--        </section>-->
    </div>
</div>
    <script>
        $('#chooseFile').bind('change', function () {
            var filename = $("#chooseFile").val();
            if (/^\s*$/.test(filename)) {
                $(".file-upload").removeClass('active');
                $("#noFile").text("No file chosen...");
            } else {
                $(".file-upload").addClass('active');
                $("#noFile").text(filename.replace("C:\\fakepath\\", ""));
            }
        });
    </script>

    <%@include file="templates/footer.jsp" %>
