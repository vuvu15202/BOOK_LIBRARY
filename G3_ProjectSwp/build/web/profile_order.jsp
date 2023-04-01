<%@include file="templates/header.jsp" %>
<link rel="stylesheet" href="<%=path%>/css/profile.css">  

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
                                        <c:forEach items="${orderList}" var="odList">

                                            <div class="card shadow-0 border mb-4" style="background-color: #f6f6f6;    border: solid 1px grey;
                                                 border-radius: 8px;margin-bottom: 40px;">
                                                <div class="col-12 odt-title d-flex">

                                                    <span>OrderID: ${odList.getOrderID()}</span>
                                                    <span>Order date: ${odList.getOrderDate()}</span>

                                                    <span>Status:</span>
                                                    <c:choose>
                                                        <c:when test="${odList.getStatus()==1}"><span style="color: blue; margin-right: 35px; background-color: white;  padding: 5px;">Pending</span></c:when>
                                                        <c:when test="${odList.getStatus()==2}"><span style="color: cornflowerblue; margin-right: 35px; background-color: white;  padding: 5px;">Approved</span></c:when>
                                                        <c:when test="${odList.getStatus()==3}"><span style="color: #46b8da; margin-right: 35px; background-color: white;  padding: 5px;">Delivering</span></c:when>
                                                        <c:when test="${odList.getStatus()==4}"><span style="color: green; margin-right: 35px; background-color: white;  padding: 5px;">Delivered</span></c:when>
                                                        <c:when test="${odList.getStatus()==5}"><span style="color: orange; margin-right: 35px; background-color: white;  padding: 5px;">Refunding</span></c:when>
                                                        <c:when test="${odList.getStatus()==6}"><span style="color: red; margin-right: 35px; background-color: white; padding: 5px;">Canceled</span></c:when>
                                                        <c:otherwise><td></td></c:otherwise>
                                                    </c:choose>
                                                </div>
                                                    <br>
                                                <c:forEach items="${orderDetailList}" var="odDetailList">
                                                    <c:if test="${odList.getOrderID() == odDetailList.getOrderID()}">
                                                        <c:forEach items="${productList}" var="product">
                                                            <c:if test="${odDetailList.getProductID() == product.getProductID()}">
                                                                
                                                                <div class="card-body">
                                                                    <div class="row">
                                                                        <div class="col-md-2" style=" margin: 8px;">
        <!--                                                                    <img src="<%=path%>/images/books/img-04.jpg"
                                                                                 class="img-fluid" alt="Phone" style="width:70px;">-->
                                                                            <img src="<%=path%>/products/${product.getImage()}"
                                                                                 class="img-fluid" alt="Phone" style="width:70px;">

                                                                        </div>
                                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                            <p class="text-muted mb-0">${product.getProductName()}</p>
                                                                        </div>
                                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                            <p class="text-muted mb-0 small">${product.getNumberOfPage()} page</p>
                                                                        </div>
<!--                                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                            <p class="text-muted mb-0 small">${product.getFormat()}</p>

                                                                        </div>-->
                                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                            <p class="text-muted mb-0 small">${odDetailList.getSalePrice()}</p>
                                                                        </div>
                                                                        <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                            <p class="text-muted mb-0 small">x${odDetailList.getQuantity()}</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <hr style="border-top: 1px solid cornflowerblue; margin: 1px;">
                                                            </c:if>
                                                        </c:forEach>

                                                    </c:if>
                                                </c:forEach>
                                                <div class="card-footer" style="margin: 10px;">
                                                    <c:url value="/AccountProfile2_review" var="review">
                                                        <c:param name="id" value="${odList.getOrderID()}" />
                                                    </c:url>
                                                    <h4>Total paid: <span class="h2 mb-0 ms-2">${odList.getTotalAmount()}</span></h4>
                                                        <c:if test="${odList.getStatus()==4}">
                                                            <div class="card-footer"><div id="box">
                                                                <a href="${review}" id="Review">Review</a>
                                                            </div></div>
                                                        </c:if>
                                                        <c:if test="${odList.getStatus()==1}">
                                                        <div class="card-footer"><div id="box">
                                                                <button onclick="window.location.href = '<%=request.getContextPath()%>/ChangeorderStatus_customer?orderId=${odList.getOrderID()}&status=6'" value="${odList.getOrderID()}" style="color: #cf142b; margin-right: 25px; background-color: bisque;  padding: 5px; border-radius: 10px; border: 1px solid green;">Cancel</button>
                                                            </div></div>
                                                        </c:if>
                                                        <c:if test="${odList.getStatus()==2}">
                                                        <div class="card-footer"><div id="box">
                                                                <button onclick="window.location.href = '<%=request.getContextPath()%>/ChangeorderStatus_customer?orderId=${odList.getOrderID()}&status=6'" value="${odList.getOrderID()}" style="color: #cf142b; margin-right: 25px; background-color: bisque;  padding: 5px; border-radius: 10px; border: 1px solid green;">Cancel</button>
                                                            </div></div>
                                                        </c:if>
                                                        <c:if test="${odList.getStatus()==3}">
                                                        <div class="card-footer"><div id="box">
                                                                <button onclick="window.location.href = '<%=request.getContextPath()%>/ChangeorderStatus_customer?orderId=${odList.getOrderID()}&status=4'" value="${odList.getOrderID()}" style="color: green; margin-right: 25px; background-color: bisque;  padding: 5px; border-radius: 10px; border: 1px solid green;">Delivered</button>
                                                                <button onclick="window.location.href = '<%=request.getContextPath()%>/ChangeorderStatus_customer?orderId=${odList.getOrderID()}&status=5'" value="${odList.getOrderID()}" style="color: #cf142b; margin-right: 25px; background-color: bisque;  padding: 5px; border-radius: 10px; border: 1px solid green;">Refund</button>
                                                            </div></div>
                                                        </c:if>
                                                    

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
        <!--</section>-->
    </div>
</div>
<%@include file="templates/footer.jsp" %>
