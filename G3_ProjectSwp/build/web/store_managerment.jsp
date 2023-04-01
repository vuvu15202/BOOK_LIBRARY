<%@include file="templates/header_admin.jsp" %>
<!-- The Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="close">&times;</div> <br>
        <div class="path-admin">EDIT YOUR INFOMATION</div>
        <div class="content-main">
            <form action="<%=path%>/StoreManager_admin" method="post" id="content-main-product">
                <div class="content-main-1">
                    <input style="display: none" type="text" name="txtEmployeeID" id="txtEmployeeID" value="${em.getEmployeeID()}">
                    <label>Last Name: <span style="color: red" id="errorLName"></span></label><br/>
                    <input type="text" name="txtLastName" id="txtLastName" value="${em.getLastName()}"><br/>
                    <label>First Name: <span style="color: red" id="errorFName"></span></label><br/>
                    <input type="text" name="txtFirstName" id="txtFirstName" value="${em.getFirstName()}"><br/>
                    <label>Title: <span style="color: red" id="errorCTitle"></span></label><br/>
                    <input type="text" name="txtTitle" id="txtTitle" value="${em.getTitle()}"><br/>
                    <label>Status:</label><br/>
                    <input readonly type="text" value="<c:choose><c:when test="${em.isStatus() == true}">Active</c:when><c:when test="${em.isStatus() == false}">Suspended</c:when></c:choose>"/>
                        </div>
                        <div class="content-main-1">
                            <label>Phone Number: <span style="color: red" id="errorPhone"></span></label><br/>
                                <input type="text" name="txtPhoneNumber" id="txtPhoneNumber" value="${em.getPhoneNumber()}"><br/>
                    <label>Title Of Courtesy: <span style="color: red" id="errorTitleC"></span></label><br/>
                    <input type="text" name="txtTitleOfCourtesy" id="txtTitleOfCourtesy" value="${em.getTitleOfCourtesy()}"><br/>
                    <label>Address: <span style="color: red" id="errorAddress"></span></label><br/>
                    <input type="text" name="txtAddress" id="txtAddress" value="${em.getAddress()}"><br/>
                    <label>Department:</label><br/>
                    <input readonly type="text" name="txtDepartment" id="txtDepartment" value="<c:forEach var="dep" items="${depart}"> <c:if test="${em.getDepartmentID() == dep.getDepartmentID()}">${dep.getDepartmentName()}</c:if></c:forEach>"><br/>
                        </div>
                        <div class="content-main-1">
                            <label>Birth Date: <span style="color: red" id="errorDiscountID"></span></label><br/>
                            <input min="1900-01-01" max="2012-12-31" type="date" name="txtBirthDate" id="txtBirthDate" value="${em.getBirthDate()}"><br/>
                    <label>Hire Date:</label><br/>
                    <input readonly type="date" name="txtHireDate" id="txtHireDate" value="${em.getHireDate()}"><br/>
                    <label>Gender:</label><br/>
                    <select name="txtGender" >
                        <c:if test="${em.isGender()==true}">
                            <option selected value="true">Male</option>
                            <option value="false">Female</option>
                        </c:if>
                        <c:if test="${em.isGender()!=true}">
                            <option value="true">Male</option>
                            <option selected="false">Female</option>
                        </c:if>
                    </select>
                </div>

                <input onclick="return validate()" style="margin: auto;" type="submit" value="Save"/>

            </form>
        </div>
    </div>

</div>
<div id="content-right">
    <div class="path-admin">STORE MANAGERMENT
        <c:if test="${msg!=null}">
            <strong style="margin-left: 102px; color: #09b83e">${msg}</strong>
        </c:if>
        <c:if test="${msg1!=null}">
            <strong style="margin-left: 188px; color: red">${msg1}</strong>
        </c:if>
    </div>
    <div style="background-color: white;" class="content-main">
        <hr/>
        <div class="msg"><strong>Hello ${em.getFirstName()}</strong><p>, you have a few tasks to handle!</p></div>
        <div class="info-homeadmin">
            <div class="info-homeadmin-left">
                <div style=" width: 100%; border-right: solid 1px black; display: flex;" class="content-main-1">
                    <div style="width: 30%;"><img style="width: 80%;border-radius: 50%;" src="https://ss-images.saostar.vn/wp700/pc/1613810558698/Facebook-Avatar_3.png" alt=""><br>
                    </div>
                    <div class="textInfo">
                        <div><strong>Email</strong>: ${account.getEmail()}</div>

                        <div><strong>Last Name</strong>: ${em.getLastName()}</div>
                        <div><strong>First Name</strong>: ${em.getFirstName()}</div>
                        <div><strong>Title</strong>: ${em.getTitle()}</div>
                        <div><strong>Phone Number</strong>: ${em.getPhoneNumber()}</div>
                        <div><strong>Title Of Courtesy</strong>: ${em.getTitleOfCourtesy()}</div>
                        <div><strong>Address</strong>: ${em.getAddress()}</div>
                        <div><strong>Department</strong>: 
                            <c:forEach var="dep" items="${depart}"> 
                                <c:if test="${em.getDepartmentID() == dep.getDepartmentID()}">${dep.getDepartmentName()}</c:if>
                            </c:forEach>
                        </div>
                        <div><strong>Birth Date</strong>: ${em.getBirthDate()}</div>
                        <div><strong>Hire Date</strong>: ${em.getHireDate()}</div>
                        <div><strong>Gender</strong>: 
                            <c:if test="${em.isGender() == true}">Male</c:if>
                            <c:if test="${em.isGender() == false}">Female</c:if>
                            </div>
                            <div><strong>Status</strong>: 
                            <c:choose>
                                <c:when test="${em.isStatus() == true}">Active</c:when>
                                <c:when test="${em.isStatus() == false}">Suspended</c:when>
                            </c:choose>
                        </div>
                        <button style="    padding: 3px;
                                border: solid 1px #dbdbdb;
                                border-radius: 5px;
                                margin: 4px;
                                cursor: pointer;" id="myBtn">Update Profile <i class="fa-solid fa-pen"></i></button>
                    </div>
                </div>
            </div>
            <div class="info-homeadmin-right">
                <div class="wrapper">
                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=1">
                            <h4>${quantityID1}</h4>
                            <p>Pending orders</p>
                        </a>
                    </div>

                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=2">
                            <h4>${quantityID2}</h4>
                            <p>Approved orders</p>
                        </a>
                    </div>

                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=3">
                            <h4>${quantityID3}</h4>
                            <p>Delivering orders</p>
                        </a>
                    </div>

                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=4">
                            <h4>${quantityID4}</h4>
                            <p>Delivered orders</p>
                        </a>
                    </div>

                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=5">
                            <h4>${quantityID5}</h4>
                            <p>Refunding orders</p>
                        </a>
                    </div>
                    <div class="div-square">
                        <a style="text-decoration: none" href="<%=path%>/orderManage_admin?txtStartOrderDate=&txtEndOrderDate=&status=6">
                            <h4>${quantityID6}</h4>
                            <p>Cancelled orders</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<div id="footer-admin">
    <p>Group 3 SE1639 - Online Shop</p>
</div>
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
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    function validate() {
        let i = 1;
        let txtBirthDate = document.getElementById('txtBirthDate').value;
        let txtAddress = document.getElementById('txtAddress').value.trim();
        let txtPhoneNumber = document.getElementById('txtPhoneNumber').value.trim();
        let txtTitleOfCourtesy = document.getElementById('txtTitleOfCourtesy').value.trim();
        let txtTitle = document.getElementById('txtTitle').value.trim();
        let txtFirstName = document.getElementById('txtFirstName').value.trim();
        let txtLastName = document.getElementById('txtLastName').value.trim();

        const regexName = /^[\p{L} ]+$/u;
        const regexPhone = /^(0|84)\d{9}$/;
        const regexAdresss = /['"\\?!^*%$@]/;

        if (txtLastName === '') {
            errorLName.innerHTML = "Name cannot be empty!";
            i++;
        } else if (txtLastName.length < 2) {
            errorLName.innerHTML = "Name cannot be less than 2 characters!";
            i++;
        } else if (txtLastName.length > 30) {
            errorLName.innerHTML = "Name cannot be more than 30 characters!";
            i++;
        } else if (txtLastName.match(regexName)) {
            errorLName.innerHTML = "";
        } else {
            errorLName.innerHTML = "Name cannot contain numbers or special characters!";
            i++;
        }

        if (txtFirstName === '') {
            errorFName.innerHTML = "Name cannot be empty!";
            i++;
        } else if (txtFirstName.length < 2) {
            errorFName.innerHTML = "Name cannot be less than 2 characters!";
            i++;
        } else if (txtFirstName.length > 30) {
            errorFName.innerHTML = "Name cannot be more than 30 characters!";
            i++;
        } else if (txtFirstName.match(regexName)) {
            errorFName.innerHTML = "";
        } else {
            errorFName.innerHTML = "Name cannot contain numbers or special characters!";
            i++;
        }

        if (txtAddress !== '') {
            if (txtAddress.length < 20) {
                errorAddress.innerHTML = "Address cannot be less than 20 characters";
                i++;
            } else if (txtAddress.length > 100) {
                errorAddress.innerHTML = "Address cannot be more than 100 characters";
                i++;
            } else if (!regexAdresss.test(txtAddress)) {
                errorAddress.innerHTML = "";
            } else {
                errorAddress.innerHTML = "Address cannot contain special characters: '\"\?^*%!@$";
                i++;
            }
        }

        if (txtTitle !== '') {
            if (txtTitle.length < 5) {
                errorCTitle.innerHTML = "contactTitle cannot be less than 5 characters";
                i++;
            } else if (txtTitle.length > 40) {
                errorCTitle.innerHTML = "contactTitle cannot be more than 40 characters";
                i++;
            } else if (!regexAdresss.test(txtTitle)) {
                errorCTitle.innerHTML = "";
            } else {
                errorCTitle.innerHTML = "contactTitle cannot contain special characters: '\"\?^*%!@$";
                i++;
            }
        }

        if (txtTitleOfCourtesy !== '') {
            if (txtTitleOfCourtesy.length < 5) {
                errorTitleC.innerHTML = "Title of course cannot be less than 5 characters";
                i++;
            } else if (txtTitleOfCourtesy.length > 40) {
                errorTitleC.innerHTML = "Title of course cannot be more than 40 characters";
                i++;
            } else if (!regexAdresss.test(txtTitleOfCourtesy)) {
                errorTitleC.innerHTML = "";
            } else {
                errorTitleC.innerHTML = "Title of course cannot contain special characters: '\"\?^*%!@$";
                i++;
            }
        }

        if (txtPhoneNumber == '') {
            errorPhone.innerHTML = "Phone number cannot be empty!";
            i++;
        } else if (regexPhone.test(txtPhoneNumber)) {
            errorPhone.innerHTML = "";
        } else {
            errorPhone.innerHTML = "invalid phone number";
            i++;
        }

        if (i > 1) {
            return false
        } else {
            if (confirm("Confirm update your profile?") == true) {
                return true;
            } else {
                return false;
            }
        }

    }
</script>
</html>