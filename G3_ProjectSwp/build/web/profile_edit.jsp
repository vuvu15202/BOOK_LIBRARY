<%@include file="templates/header.jsp" %>
<link rel="stylesheet" href="<%=path%>/css/profile.css">  
<c:set var="a" value="${account}" />
<c:set var="c" value="${customer}" />     
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
                    <li><a href="<%=path%>/account/profile_myOrder"> <i class="fa fa-calendar"></i> All Order <span class="label label-warning r-activity">9</span></a></li>
                    <li class="active"><a href="<%=path%>/account/profile1"> <i class="fa fa-edit"></i> Edit profile</a></li>
                </ul>
            </div>
        </div>
        <div class="profile-info col-md-9">
            <div class="panel">
                <div class="bio-graph-heading">
                    Update Profile
                </div>
                <div class="panel-body bio-graph-info">
                    <form name="form-edit" action="<%=path%>/account/profile1" method="post">  
                        <div class="row">
                            <div style="display: none">
                                <p><span></span> <input type="text" name="txtCustomerID" value="${c.getCustomerID()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>First Name : <span style="color: red" id="errorFName"></span></span> <input type="text" name="txtFirstName" value="${c.getFirstName()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Last Name : <span style="color: red" id="errorLName"></span></span> <input type="text" name="txtLastName" value="${c.getLastName()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Address : <span style="color: red" id="errorAddress"></span></span> <input type="text" name="txtAddress" value="${c.getAddress()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Contact Title : <span style="color: red" id="errorCTitle"></span></span> <input type="text" name="txtContactTitle" value="${c.getContactTitle()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Birthday :</span> <input min="1900-01-01" max="2012-12-31" type="date" name="txtBirthday" value="${c.getDateOfBirth()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Phone : <span style="color: red" id="errorPhone"></span></span> <input type="text" name="txtPhone" value="${c.getPhoneNumber()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Create Date : </span> <input readonly type="date" name="txtCreatDate" value="${c.getCreateDate()}"></p>
                            </div>
                            <div class="bio-row1">
                                <p><span>Gender </span>: <select name="txtGender" >
                                        <c:if test="${c.isGender()==true}">
                                            <option selected value="true">Male</option>
                                            <option value="false">Female</option>
                                        </c:if>
                                        <c:if test="${c.isGender()!=true}">
                                            <option value="true">Male</option>
                                            <option selected="false">Female</option>
                                        </c:if>
                                    </select></p></p>
                            </div>
                            <input onclick="return validate()" type="submit" value="Save" />
                    </form>
                </div>
            </div>
        </div>
        <div>
        </div>
    </div>
</div>
</div>    <%@include file="templates/footer.jsp" %>
<script>
    function validate() {
        let i = 1;
        let fName = document.forms["form-edit"]["txtFirstName"].value.trim();
        let lName = document.forms["form-edit"]["txtLastName"].value.trim();
        let address = document.forms["form-edit"]["txtAddress"].value.trim();
        let contactTitle = document.forms["form-edit"]["txtContactTitle"].value.trim();
        let birthDay = document.forms["form-edit"]["txtBirthday"].value;
        let phone = document.forms["form-edit"]["txtPhone"].value.trim();
        const regexName = /^[\p{L} ]+$/u;
        const regexPhone = /^(0|84)\d{9}$/;
        const regexAdresss = /['"\\?!^*%$@]/;

        if (fName === '') {
            errorFName.innerHTML = "Name cannot be empty!";
            i++;
        } else if (fName.length < 2) {
            errorFName.innerHTML = "Name cannot be less than 2 characters!";
            i++;
        } else if (fName.length > 30) {
            errorFName.innerHTML = "Name cannot be more than 30 characters!";
            i++;
        } else if (fName.match(regexName)) {
            errorFName.innerHTML = "";
        } else {
            errorFName.innerHTML = "Name cannot contain numbers or special characters!";
            i++;
        }

        if (lName === '') {
            errorLName.innerHTML = "Name cannot be empty!";
            i++;
        } else if (lName.length < 2) {
            errorLName.innerHTML = "Name cannot be less than 2 characters!";
            i++;
        } else if (lName.length > 30) {
            errorLName.innerHTML = "Name cannot be more than 30 characters!";
            i++;
        } else if (lName.match(regexName)) {
            errorLName.innerHTML = "";
        } else {
            errorLName.innerHTML = "Name cannot contain numbers or special characters!";
            i++;
        }

        if (address !== '') {
            if (address.length < 20) {
                errorAddress.innerHTML = "address cannot be less than 20 characters";
                i++;
            } else if (address.length > 100) {
                errorAddress.innerHTML = "address cannot be more than 100 characters";
                i++;
            } else if (!regexAdresss.test(address)) {
                errorAddress.innerHTML = "";
            } else {
                errorAddress.innerHTML = "address cannot contain special characters: '\"\?^*%!@$";
                i++;
            }
        }

        if (contactTitle !== '') {
            if (contactTitle.length < 10) {
                errorCTitle.innerHTML = "contactTitle cannot be less than 10 characters";
                i++;
            } else if (contactTitle.length > 40) {
                errorCTitle.innerHTML = "contactTitle cannot be more than 40 characters";
                i++;
            } else if (!regexAdresss.test(contactTitle)) {
                errorCTitle.innerHTML = "";
            } else {
                errorCTitle.innerHTML = "contactTitle cannot contain special characters: '\"\?^*%!@$";
                i++;
            }
        }


        if (phone !== '') {
            if (regexPhone.test(phone)) {
                errorPhone.innerHTML = "";
            } else {
                errorPhone.innerHTML = "invalid phone number";
                i++;
            }
        }

        if (i > 1) {
            return false
        } else {
            if(confirm("Confirm update your profile?")==true){
                return true;
            }else{
                return false;
            }
        }
    }


</script>