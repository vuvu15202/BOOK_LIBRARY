<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <div class="path-admin">VOUCHERS LIST
    <c:if test="${msg!=null}">
        <strong style="margin-left: 16%; color: #09b83e">${msg}</strong>
    </c:if>
    <c:if test="${msg1!=null}">
        <strong style="margin-left: 16%; color: red">${msg1}</strong>
    </c:if>
    </div>
    
    <div class="content-main">
        <hr/>
        <div id="content-main-dashboard">

            <div id="product-title-header">
                <div id="product-title-1" style="width: 25%;">
                </div>
                <div id="product-title-2" style="width: 55%;">
                    <form action="<%=path%>/SearchVoucher"  method="post" style="padding-bottom: 40px;">
                        <input type="text" name="txtSearch" value="${searchValue}" placeholder="Enter Voucher ID to search"/>
                        <input type="submit" value="Search"/>
                    </form>                 
                </div>
                <div id="product-title-3" style="width: 20%;">
                    <a href="create-voucher.jsp">Create a new Voucher</a>
                </div>
            </div>
            <div id="order-table-admin">
                <table id="orders">
                    <tr>
                        <th>DiscountID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>StartDate</th>
                        <th>EndDate</th>
                        <th>Percentage</th>
                        <th>Quantity</th>
                        <th></th>
                    </tr>
                    <c:forEach items = "${vList}" var="x" >
                        <c:url value="/CreateVoucher_admin" var="Edit">
                            <c:param name="id" value="${x.getDiscountID()}" />
                        </c:url>
                        <c:url value="/deleteVoucher_admin" var="Delete">
                            <c:param name="id" value="${x.getDiscountID()}" />
                        </c:url>
                        <tr>
                            <td>${x.getDiscountID()}</td>
                            <td>${x.getTitle()}</td>
                            <td>${x.getDescription()}</td>
                            <td>${x.getStartDate()}</td>
                            <td>${x.getEndDate()}</td>
                            <td>${x.getPercentage()}</td>
                            <td>${x.getQuantity()}</td>
                            <td><a href="${Edit}">Edit</a> &nbsp; | &nbsp; 
                                <a class="s" onclick="window.confirm('Confirm delete this voucher?')" href="${Delete}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
<!--            <div id="paging">
                <div class="pagination">
                    <a href="#">&laquo;</a>
                    <a href="#">1</a>
                    <a href="#" class="active">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>-->
        </div>
    </div>
</div>
</div>
<div id="footer-admin">2023 All Rights Reserved By &copy; Book Library</div>
</div>
</body>
</html>