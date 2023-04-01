<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <div class="path-admin">ORDERS LIST</b></div>
    <div class="content-main">
        <div id="content-main-dashboard">
            <hr>
            <div id="order-title">

                <form style="padding-bottom: 10px;">
                    <span>From</span>: <input type="date" name="txtStartOrderDate" style="margin-right: 20px"/>
                    <span>To</span>: <input type="date" name="txtEndOrderDate"/>
                    <br/>
                    <input type="radio" name="status" value="1"> <label for="Pending"style="margin-right: 15px">Pending</label>
                    <input type="radio" name="status" value="2"> <label for="Approved"style="margin-right: 15px">Approved</label>
                    <input type="radio" name="status" value="3"> <label for="Delivering"style="margin-right: 15px">Delivering</label>
                    <input type="radio" name="status" value="4"> <label for="Delivered"style="margin-right: 15px">Delivered</label>
                    <input type="radio" name="status" value="5"> <label for="Refunding"style="margin-right: 15px">Refunding</label>
                    <input type="radio" name="status" value="6"> <label for="Canceled"style="margin-right: 15px">Cancelled</label>
                    <input type="submit" value="Apply">
                </form>
            </div>
            <div id="order-table">
                <table id="orders">
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Employee</th>
                        <th>Order Date</th>
                        <th>Required Date</th>
                        <th>Shipped Date</th>
                        <th style="width: 200px;">Ship Address</th>
                        <th>Ship City</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                    <c:forEach var="od" items="${listInCurrentPage}">
                        <tr>
                            <td><a href="<%=path%>/orderManage_admin?idOdDetail=${od.getOrderID()}">${od.getOrderID()}</a></td>
                            <td>
                                <c:forEach var="cus" items="${cusList}"> 
                                    <c:if test="${od.getCustomerID() == cus.getCustomerID()}">${cus.getFirstName()}</c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="emp" items="${empList}">
                                    <c:if test="${od.getEmployeeID() == emp.getEmployeeID()}">${emp.getFirstName()}</c:if>
                                </c:forEach>
                            </td>
                            <td>${od.getOrderDate()}</td>
                            <td>${od.getRequiredDate()}</td>
                            <td>${od.getShippedDate()}</td>
                            <td>${od.getShipAddress()}</td>
                            <td>${od.getShipCity()}</td> 
                            <!--<td>${od.getShipCountry()}</td>--> 

                            <c:choose>
                                <c:when test="${od.getStatus()==1}"><td style="color: blue;">Pending</td></c:when>
                                <c:when test="${od.getStatus()==2}"><td style="color: #34b233;">Approved</td></c:when>
                                <c:when test="${od.getStatus()==3}"><td style="color: #f2c205;">Delivering</td></c:when>
                                <c:when test="${od.getStatus()==4}"><td style="color: green;">Delivered</td></c:when>
                                <c:when test="${od.getStatus()==5}"><td style="color: orange;">Refunding</td></c:when>
                                <c:when test="${od.getStatus()==6}"><td style="color: red;">Canceled</td></c:when>
                                <c:otherwise><td></td></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${od.getStatus()==1}">
                                    <td style="padding: unset;">
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=2'" value="${od.getOrderID()}" style="color: #34b233;">Approve</button>
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=6'" value="${od.getOrderID()}" style="color: #cf142b;">Cancel</button>
                                    </td>
                                </c:when>

                                <c:when test="${od.getStatus()==2}">
                                    <td style="padding: unset;">
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=3'" value="${od.getOrderID()}" style="color: #f2c205;">Delivering</button>
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=6'" value="${od.getOrderID()}" style="color: #cf142b;">Cancel</button>
                                    </td>
                                </c:when>

                                <c:when test="${od.getStatus()==3}">
                                    <td style="padding: unset;">
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=4'" value="${od.getOrderID()}" style="color: green;">Delivered</button>
                                    </td>
                                </c:when>


                                <c:when test="${od.getStatus()==5}">
                                    <td style="padding: unset;">
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=4'" value="${od.getOrderID()}" style="color: green;">Delivered</button>
                                        <button onclick="window.location.href = 'ChangorderStatus_admin1?orderId=${od.getOrderID()}&status=6'" value="${od.getOrderID()}" style="color: #cf142b;">Cancel</button>
                                    </td>
                                </c:when>
                                <c:otherwise><td></td></c:otherwise>
                            </c:choose>

                        </tr>
                    </c:forEach>
                </table>
            </div>

            <c:if test="${CancelMsg!=null}"><div  style="color: orange; text-align: center;">${CancelMsg}</div> </c:if>
            <c:if test="${emptyListMsg!=null}"><div style="color: orange; text-align: center;">${emptyListMsg}</div> </c:if>

                <div id="paging">
                    <div class="pagination">

                    <c:if test="${currentPage>1}">
                        <c:url value="/orderManage_admin" var="paginationPrevous">
                            <c:param name="currentPage" value="${currentPage-1}" />
                        </c:url>
                        <a href="${paginationPrevous}">&laquo;</a>
                    </c:if>

                    <c:forEach begin="1" end="${numberOfPage}" step="1" var="stepValue">
                        <c:choose>
                            <c:when test="${stepValue == currentPage}">
                                <a href="#" class="active">${stepValue}</a>
                            </c:when>
                            <c:otherwise>
                                <c:url value="/orderManage_admin" var="pagination">
                                    <c:param name="currentPage" value="${stepValue}" />
                                </c:url>
                                <a href="${pagination}">${stepValue}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage<numberOfPage}">
                        <c:url value="/orderManage_admin" var="paginationNext">
                            <c:param name="currentPage" value="${currentPage+1}" />
                        </c:url>
                        <a href="${paginationNext}">&raquo;</a>
                    </c:if>

                </div>
            </div> 
        </div>
    </div>
</div>
</div>
<div id="footer-admin">
    2023 All Rights Reserved By © Book Library
</div>
</div>
<script>
    function cancle(id, curentPage) {

        var result = confirm("Do you want to cancel this order?!");
        if (result === true) {
            var url = "/G3_ProjectSwp/orderManage_admin?idCancel=" + id + "&currentPage=" + curentPage;
            document.location.href = url;
        }

    }
</script>

</body>
</html>