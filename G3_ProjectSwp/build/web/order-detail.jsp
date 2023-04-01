<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <div class="path-admin">ORDER DETAIL</b></div>
    <div class="content-main">
        <div id="content-main-dashboard">
            <div>
                <div class="profile-order-title">
                    <c:set var="od" value="${order}"></c:set>
                    <div class="profile-order-title-left">
                        <div>OrderID: ${od.getOrderID()}</div>
                        <div>Order creation date: ${od.getOrderDate()}</div>
                        <div>Ship Address: ${od.getShipAddress()}</div>
                    </div>
                    <div class="profile-order-title-right">
                        <%--<c:choose>
                            <c:when test="${od.getRequiredDate()!=null && od.getShippedDate()!=null}"><span style="color: green;">Completed</span></c:when>
                            <c:when test="${od.getRequiredDate()!=null && od.getShippedDate()==null}"><td style="color: blue;">Pending|<a style="color: orchid" onclick="return cancelOrder()" href="<%=path%>/account/profile1?idCancel=${od.getOrderID()}">Cancel</a></span></c:when>
                            <c:when test="${od.getRequiredDate()==null && od.getShippedDate()==null}"><td style="color: red;">Canceled</td></c:when>
                        </c:choose>--%>

                    </div>
                </div> <br>
                <c:forEach var="odDetails" items="${orderDetailList}">
                    <c:forEach var = "p" items="${productList}" >
                        <c:if test="${odDetails.getProductID()== p.getProductID()}">
                            <div class="profile-order-content" style="background-color: white;">
                        <div class="profile-order-content-col1">
                            
                            <a href="<%=path%>/index?idProDetail=${odDetails.getProductID()}"><img src="<%=path%>/products/${p.getImage()}" width="50%"/></a>
                       
                            </div>
                        
                            <c:if 
                                test="${p.getProductID()==odDetails.getProductID()}"><div class="profile-order-content-col2">${p.getProductName()}</div>
                            </c:if>
                       
                        <div class="profile-order-content-col3">Quantity: ${odDetails.getQuantity()}</div>
                        <div class="profile-order-content-col4">${odDetails.getSalePrice()}</div>
                    </div> <br>
                        </c:if>
                            
                    
                    </c:forEach>
                </c:forEach>
                </table>
            </div>
        </div>

    </div>
    <div id="footer-admin">
        <p>Group 3 SE1639 - Online Shop</p>
        </body>
        </html>

