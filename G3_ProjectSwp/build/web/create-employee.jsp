<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <div class="path-admin">CREATE A NEW EMPLOYEES</b></div>
    <div class="content-main">
        <c:set var="e" value="${employee}"></c:set>
            <form action="createEmployee_admin" method="get" id="content-main-product">
                <div class="content-main-1">
                    <label>Last Name (*): <span style="color: red" id="errorLName"></span></label><br/>
                    <input type="text" name="lastName" id="txtLastName" value="${e.getLastName()}"><br/>
                <label>First Name: <span style="color: red" id="errorFName"></span></label><br/>
                <input type="text" name="firstName" id="txtFirstName" value="${e.getFirstName()}"><br/>
                <label>Title: <span style="color: red" id="errorCTitle"></span></label><br/>
                <input type="text" name="title" id="txtTitle" value="${e.getTitle()}"><br/>
                <label>Status:</label><br/>
                <select name="status" value="${e.isStatus()}">
                    <option value="catid1">1</option>                                
                </select>
            </div>
            <div class="content-main-1">
                <label>TitleOfCourtesy: <span style="color: red" id="errorTitleC"></span></label><br/>
                <input type="text" name="titleOfCourtesy" id="txtTitleOfCourtesy" value="${e.getTitleOfCourtesy()}"><br/>
                <label>Address: <span style="color: red" id="errorAddress"></span></label><br/>
                <input type="text" name="address" id="txtAddress" value="${e.getAddress()}"><br/>
                <label>Department (*):</label><br/>
                <select name="departmentID">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <br/>
            </div>
            <div class="content-main-1">
                <label>Birth Date: <span style="color: red" id="errorDiscountID"></span></label><br/>
                <input min="1900-01-01" max="2005-03-21" type="date" name="birthDate" id="txtBirthDate"><br/>
                <label>Phone number: <span style="color: red" id="errorPhone"></span></label><br/>
                <input type="text" name="phoneNumber" id="txtPhoneNumber"><br/>
                <label>Gender:</label><br/>
                <select name="gender">
                    <option value="empid1">Male</option>
                    <option value="empid2">Female</option>
                </select>
                <br/> 
            </div>

            <input onclick="return validate()" style="margin: auto;" type="submit" value="Save"/>

        </form>
    </div>
</div>
</div>
<div id="footer-admin">2023 All Rights Reserved By &copy; Book Library
</div>
</div>
</body>
<script>
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