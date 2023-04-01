<%@include file="templates/header_admin.jsp" %>
<!-- The Modal -->

<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="close">&times;</div> <br>
        <div class="path-admin">CREATE A NEW EMPLOYEE</b></div>
        <div class="content-main">
            <form id="content-main-product">
                <div class="content-main-1">
                    <label>Last Name (*):</label><br/>
                    <input type="text" name="txtProductName" id=""><br/>
                    <label>First Name:</label><br/>
                    <input type="text" name="txtUnitPrice" id=""><br/>
                    <label>Gender:</label><br/>
                    <select name="ddlCategory">
                        <option value="catid1">Smart Phone</option>
                        <option value="catid2">Computer</option>
                    </select>
                </div>
                <div class="content-main-1">
                    <label>ContactTitle:</label><br/>
                    <input type="text" name="txtUnitPrice" id=""><br/>
                    <label>Date Of Birth:</label><br/>
                    <input type="text" name="txtUnitPrice" id=""><br/>
                    <label>Address:</label><br/>
                    <input type="text" name="txtUnitsInStock" id=""><br/>
                    <br/>
                </div>
                <div class="content-main-1">
                    <label>Phone Number:</label><br/>
                    <input type="text" name="txtUnitsInStock" id=""><br/>
                    <label>Create Date:</label><br/>
                    <input type="date" name="txtUnitsInStock" id=""><br/>
                    <br/> 
                </div>


                <input style="margin: auto;" type="submit" value="Save"/>

            </form>
        </div>
    </div>

</div>
<div id="content-right">
    <div class="path-admin">CUSTOMERS LIST</b></div>
    <div class="content-main">
        <hr/>
        <div id="content-main-dashboard">
            <div id="product-title-header">
                <div id="product-title-1" style="width: 25%;">
<!--                    <b>Filter by Employees:</b>
                    <form>
                        <select name="ddlCategory">
                            <option value="catid1">--- Select ---</option>
                            <option value="catid1">Smart Phone</option>
                            <option value="catid2">Computer</option>
                            <option value="catid3">Television</option>
                            <option value="catid4">Electronic</option>
                        </select>
                        <input type="submit" value="Filter">
                    </form>-->
                </div>
                <div id="product-title-2" style="width: 55%;">
                    <form style="padding-bottom: 40px;" action="search_cus" method="post">
                        <input type="text" name="txtSearch" value="${searchValue}" placeholder="Enter customer name to search"/>
                        <input type="submit" value="Search">
                    </form>
                </div>
            </div>
            <div id="order-table-admin">
                <table id="orders">
                    <tr>
                        <th>CustomerID</th>  
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>ContactTitle</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${listInCurrentPage}" var="c">
                        <tr>
                            <td>${c.getCustomerID()}</td>
                            <td>${c.getFirstName()}</td>
                            <td>${c.getLastName()}</td>
                            <td>${c.getContactTitle()}</td>
                            <td>${c.isGender()==true?"Male":"Female"}</td>
                            <td>${c.getAddress()}</td>

                            <td>
                                <div style="display: flex">
                                    <!--<a id="myBtn">Edit</a> &nbsp; | &nbsp;--> 
                                    <a class="delete" href="delete_cus?id=${c.getCustomerID()}">Delete</a>
                                </div>
                            </td>

                        </tr>
                    </c:forEach>

                </table>
            </div>
            <c:if test="${sessionMsg!=null}"><div>${sessionMsg}</div> </c:if>
                <div id="paging">
                    <div class="pagination">

                    <c:if test="${currentPage>1}">
                        <c:url value="/customerManage_admin" var="paginationPrevous">
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
                                <c:url value="/customerManage_admin" var="pagination">
                                    <c:param name="currentPage" value="${stepValue}" />
                                </c:url>
                                <a href="${pagination}">${stepValue}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage<numberOfPage}">
                        <c:url value="/customerManage_admin" var="paginationNext">
                            <c:param name="currentPage" value="${currentPage+1}" />
                        </c:url>
                        <a href="${paginationNext}">&raquo;</a>
                    </c:if>


                </div>
            </div>
        </div>
    </div>

    <div id="footer-admin">2023 All Rights Reserved By &copy; Book Library</div>

</div>
</body>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
        modal.style.display = "block";
    };

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    };

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
</script>
</html>