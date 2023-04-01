<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <div class="path-admin">PRODUCTS LIST</div>
    <div class="content-main">
        <div id="content-main-dashboard" style="height: 590px;">
            <hr>
            <div id="product-title-header">
                <div id="product-title-1" style="width: 30%;">

                    <form action="productManage_admin" method="">
                        <!--<b>Filter by Category:</b>-->
                        <select name="categoryFilter">
                            <option value="0">No Filter</option>
                            <c:forEach items="${categoryList}" var="cate">
                                <c:choose>
                                    <c:when test="${cate.getCategoryID() == categoryIDSession}">
                                        <option value="${cate.getCategoryID()}" selected="selected">${cate.getCategoryName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${cate.getCategoryID()}">${cate.getCategoryName()}</option>
                                    </c:otherwise>
                                </c:choose>                               
                            </c:forEach>
                        </select>
                        <input type="submit" value="Apply">
                    </form>
                    <form style="margin-bottom: 20px" action="productManage_admin" method="POST">
                        <!--<strong>Filter by Quantity:</strong>-->
                        <input style="margin-left: 2px;" type="radio" name="discontinued" value="1"> <label style="margin-left: -3px; margin-right: 15px" for="discontinued">Discontinued</label>
                        <input type="radio" name="outofstock"> <label style="margin-left: -3px;" for="">Out of stock</label>
                        <input type="submit" value="Apply">
                    </form>
                </div>
 
                <div id="product-title-2" style="width: 55%;">
                    <form style="padding-bottom: 40px;" action="productManage_admin" method="post">
                        <input style="padding: 4px; border: 1px solid blue;" type="text" name="txtSearch2" value="${sampleSession}" placeholder="Enter product name to search"/>
                        <input type="submit" value="Search">
                    </form>
                </div>
                <div id="product-title-3" style="width: 20%;">
                    <a href="createProduct_admin">Create a new Product</a>
                </div>
            </div>
            <div id="order-table-admin">
                <table id="orders">
                    <tr>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Genre</th>
                        <th>Cover Price</th>
                        <th>Sale Price</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th>Supplier</th>
                        <th>Language</th>
                        <th>Size</th>
                        <th>Weight</th>
                        <th>Page</th>
                        <th>Format</th>
                        <th>Publish Date</th>
                        <th>Discontinued</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${productList}" var="product">
                                    <tr>
                                        <td style="padding: 0px;"><img style="width: 50px;" src="<%=path%>/products/${product.getImage()}"></td>
                                    <td><a href="order-detail.html?id=5">${product.getProductID()}</a></td>
                                    <td>${product.getProductName()}</td>
                                    <td>
                                        <c:forEach var="li" items="${listc}">
                                            <c:if test="${product.getCategoryID() == li.getCategoryID() }">${li.getCategoryName()}</c:if>
                                        </c:forEach>
                                    </td>
                                     <td>
                                        <c:forEach var="u" items="${listg}">
                                            <c:if test="${product.getGenreID() == u.getGenreID()}">${u.getGenreName()}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${product.getCoverPrice()}</td>
                                    <td>${product.getSalePrice()}</td>
                                     <td>
                                        <c:forEach var="a" items="${lista}">
                                            <c:if test="${product.getAuthorID()== a.getAuthorID()}">${a.getAuthorName()}</c:if>
                                        </c:forEach>
                                    </td>
<!--                                    <td>${product.getTranslator()}</td>-->
<!--                                    <td>${product.getPublisherID()}</td>-->
                                     <td>
                                        <c:forEach var="s" items="${lists}">
                                            <c:if test="${product.getPublisherID()== s.getSupplierID()}">${s.getSupplierName()}</c:if>
                                        </c:forEach>
                                    </td>
                                     <td>
                                        <c:forEach var="s" items="${lists}">
                                            <c:if test="${product.getSupplierID()== s.getSupplierID()}">${s.getSupplierName()}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${product.getLanguage()}</td>
                                    <td>${product.getSize()}</td>
                                    <td>${product.getWeight()}</td>
                                    <td>${product.getNumberOfPage()}</td>
                                    <td>${product.getFormat()}</td>
                                    <td>${product.getPublishDate()}</td>

                                    <!--<td>${product.getPublishingLicense()}</td>-->
                                    <!--<td>${product.getDescription()}</td>-->

                                    <td>${product.isDiscontinued()}</td>
                                    <td>
                                        <a class="update" href="editProduct_admin?id=${product.getProductID()}">Edit</a> &nbsp; | &nbsp
                                        <a class="delete" href="deleteProduct_admin?id=${product.getProductID()}">Delete</a>
                                    </td>
                                </tr>
                                </c:forEach>


                </table>
            </div>
            <div id="paging">
                <div class="pagination">

                    <c:if test="${currentPage>1}">
                        <c:url value="/productManage_admin" var="paginationPrevous">
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
                                <c:url value="/productManage_admin" var="pagination">
                                    <c:param name="currentPage" value="${stepValue}" />
                                </c:url>
                                <a href="${pagination}">${stepValue}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage<numberOfPage}">
                        <c:url value="/productManage_admin" var="paginationNext">
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
<div id="footer-admin">2023 All Rights Reserved By &copy; Book Library</div>
</div>
</body>
</html>