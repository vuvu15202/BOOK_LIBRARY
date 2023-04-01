<%@include file="templates/header.jsp" %>

<link href="<%=path%>/css/shopping-cart.css" rel="stylesheet" type="text/css"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<main id="tg-main page" class="tg-main tg-haslayout">
    <div class="tg-sectionspace tg-haslayout">
        <section class="shopping-cart dark">
            <div class="container">
                <div class="py-5 text-center">
                    <h2 style="margin-top: -20px; margin-bottom: 100px;">My Cart</h2>
                </div>
                <c:if test="${msgOutOfStock!=null}"><div style="color: red; font-size: 20px;margin: 10px 0px; text-align: center;">${msgOutOfStock}</div></c:if>
                <c:if test="${msgWrongDiscountID!=null}">${msgWrongDiscountID}</c:if>
                    <div class="content" id="content" style="padding-bottom: 25px;">
                        <div class="row" >
                            <div class="col-md-12 col-lg-8">
                                <div class="items">
                                <c:forEach items="${cartList}" var="cartItem">
                                    <div class="product">
                                        <div class="row">
                                            <c:forEach items="${productList}" var="product">
                                                <c:if test="${product.getProductID() == cartItem.getProductID()  }">
                                                    <div class="col-md-3">
                                                        <img class="img-fluid mx-auto d-block image" src="<%=path%>/products/${product.getImage()}">
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <div class="col-md-8">
                                                <div class="info">
                                                    <div class="row">
                                                        <c:forEach items="${productList}" var="product">
                                                            <c:if test="${product.getProductID() == cartItem.getProductID()}">
                                                                <div class="col-md-5 product-name">
                                                                    <div class="product-name">
                                                                        <a href="<%=path%>/productDetail?proID=${product.getProductID()}">${product.getProductName()}</a>
                                                                        <div class="product-info">
                                                                            <div>Language: <span class="value">${product.getLanguage()}</span></div>
                                                                            <div>Format: <span class="value">${product.getFormat()}</span></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                        <div class="col-md-4 quantity">
                                                            <label for="quantity">Quantity:</label>
                                                            <input id="quantity" type="number" min="1" value ="${cartItem.getQuantity()}" class="form-control quantity-input" onchange="changeQuantity(this, ${cartItem.getProductID()})">
                                                        </div>
                                                        <c:forEach items="${productList}" var="product">
                                                            <c:if test="${product.getProductID() == cartItem.getProductID()}">

                                                                <div class="col-md-3 price">
                                                                    <span>${product.getSalePrice()}</span> <span>   </span>
                                                                    <i class="fa fa-trash-o" aria-hidden="true" onclick="deleteCartItem(this, ${cartItem.getProductID()})"></i>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="summary">
                                <h3>Summary</h3>
                                <div class="summary-item"><span class="text">Subtotal</span><span class="price">${subTotal}đ</span></div>
                                <div class="summary-item"><span class="text">Discount</span><span class="price">0đ</span></div>
                                <div class="summary-item"><span class="text">Shipping</span><span class="price">${shipping}đ</span></div>
                                <div class="summary-item"><span class="text">Total</span><span class="price">${subTotal + shipping}đ</span></div>
                                <a class="tg-btn tg-btns tg-active" href="<%=path%>/checkout">
                                    <i class="fa fa-shopping-basket"></i>
                                    <em>Check out</em>
                                </a>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </section>
    </div>

</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                                                                        function changeQuantity(param, param1) {

                                                                            $.ajax({
                                                                                url: "/G3_ProjectSwp/cartAjax",
                                                                                type: "get", //send it through get method
                                                                                data: {
                                                                                    txtProductID: param1,
                                                                                    txtQuantity: param.value
                                                                                },
                                                                                success: function (data) {
                                                                                    var row = document.getElementById("content");
                                                                                    row.innerHTML = data;
                                                                                },
                                                                                error: function (xhr) {
                                                                                    //Do Something to handle error
                                                                                }
                                                                            });
                                                                        }
                                                                        function deleteCartItem(param, param1) {

                                                                            $.ajax({
                                                                                url: "/G3_ProjectSwp/cartAjax",
                                                                                type: "get", //send it through get method
                                                                                data: {
                                                                                    txtProductIDToDelete: param1
                                                                                },
                                                                                success: function (data) {
                                                                                    var row = document.getElementById("content");
                                                                                    row.innerHTML = data;
                                                                                },
                                                                                error: function (xhr) {
                                                                                    //Do Something to handle error
                                                                                }
                                                                            });
                                                                        }
</script>
<%@include file="templates/footer.jsp" %>



