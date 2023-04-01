<%@include file="templates/header_admin.jsp" %>
<div id="content-right">
    <c:if test="${sessionEdit == null}">
        <div class="path-admin">CREATE A NEW VOUCHER</div>
        <c:url var="action" value="/CreateVoucher_admin"/>
    </c:if>
    <c:if test="${sessionEdit !=null}">
        <div class="path-admin" id="update">UPDATE VOUCHER</div>
        <c:url var="action" value="/voucherManage_admin"/>
    </c:if>

    <div class="content-main">
        <form action="${action}" method="post" id="content-main-product" name="content-main-product">
            <div class="content-main-1">
                <label>DiscountID (*): <span style="color: red" id="errorDiscountID"></span></label><br/>
                <input type="text" name="txtDiscountID" id="" value="${VoucherEdit.getDiscountID()}"><br/>
                <label>Title: <span style="color: red" id="errorTitle"></span></label><br/>
                <input type="text" name="txtTitle" id="" value="${VoucherEdit.getTitle()}"><br/>
                <label>Description: <span style="color: red" id="errorDescription"></span></label><br/>
                <input type="text" name="txtDescription" id="" value="${VoucherEdit.getDescription()}"><br/>
            </div>
            <div class="content-main-1">
                <label>Start Date: <span style="color: red" id="errorStartDate"></span></label><br/>
                <input type="datetime-local" name="txtStartDate" id="txtStartDate" value="${VoucherEdit.getStartDate()}"><br/>
                <label>End Date: <span style="color: red" id="errorEndDate"></span></label><br/>
                <input type="datetime-local" name="txtEndDate" id="txtEndDate" value="${VoucherEdit.getEndDate()}"><br/>
                <br/>
            </div>
            <div class="content-main-1">
                <label>Percentage: <span style="color: red" id="errorPercentage"></span></label><br/>
                <input type="text" name="txtPercentage" id="" value="${VoucherEdit.getPercentage()}"><br/>
                <label>Quantity: <span style="color: red" id="errorQuantity"></span></label><br/>
                <input type="text" name="txtQuantity" id="" value="${VoucherEdit.getQuantity()}"><br/>
            </div>

            <input onclick="return validate()" style="margin: auto;" type="submit" value="Save"/>

        </form>
    </div>
</div>
</div>

<div id="footer-admin">2023 All Rights Reserved By © Book Library</div>
</div>
<script>
    function validate() {
        let i = 1;
        let txtQuantity = document.forms["content-main-product"]["txtQuantity"].value.trim();
        let txtPercentage = document.forms["content-main-product"]["txtPercentage"].value.trim();
        let txtEndDate = document.forms["content-main-product"]["txtEndDate"].value;
//        let minEndDate = document.forms["content-main-product"]["txtEndDate"];
        let txtStartDate = document.forms["content-main-product"]["txtStartDate"].value;
//        let minStartDate = document.forms["content-main-product"]["txtStartDate"];
        let txtDescription = document.forms["content-main-product"]["txtDescription"].value.trim();
        let txtTitle = document.forms["content-main-product"]["txtTitle"].value.trim();
        let txtDiscountID = document.forms["content-main-product"]["txtDiscountID"].value.trim();

        const regexID = /^[a-zA-Z0-9]*$/;
        const regexDescription = /^.+$/;
        const regexNumber = /^[0-9.-]+$/;

        if (txtDiscountID.trim() === '') {
            errorDiscountID.innerHTML = "ID cannot be empty!";
            i++;
        } else if (txtDiscountID.length < 2) {
            errorDiscountID.innerHTML = "ID cannot be less than 2 characters!";
            i++;
        } else if (txtDiscountID.length > 20) {
            errorDiscountID.innerHTML = "ID cannot be more than 20 characters!";
            i++;
        } else if (txtDiscountID.match(regexID)) {
            errorDiscountID.innerHTML = "";
        } else {
            errorDiscountID.innerHTML = "ID only allow characters and numbers";
            i++;
        }

        if (txtTitle.trim() === '') {
            errorTitle.innerHTML = "Title cannot be empty!";
            i++;
        } else if (txtTitle.length < 10) {
            errorTitle.innerHTML = "Title cannot be less than 10 characters!";
            i++;
        } else if (txtTitle.length > 40) {
            errorTitle.innerHTML = "ID cannot be more than 40 characters!";
            i++;
        } else if (!regexDescription.test(txtTitle)) {
            errorDescription.innerHTML = "The Title must contain words";
            i++;
        } else {
            errorTitle.innerHTML = "";
        }

        if (txtDescription.trim() !== '') {
            if (txtDescription.length < 10) {
                errorDescription.innerHTML = "Description cannot be less than 10 characters";
                i++;
            } else if (txtDescription.length > 300) {
                errorDescription.innerHTML = "Description cannot be more than 300 characters";
                i++;
            } else if (!regexDescription.test(txtDescription)) {
                errorDescription.innerHTML = "The Description must contain words";
                i++;
            } else {
                errorDescription.innerHTML = "";
            }
        }

        if (txtStartDate == "") {
            errorStartDate.innerHTML = "Start Date cannot be empty!";
            i++;
        }
        if (txtEndDate == "") {
            errorEndDate.innerHTML = "End Date cannot be empty!";
            i++;
        }
        if (txtStartDate != "") {
            errorStartDate.innerHTML = "";
        }
        if (txtEndDate != "") {
            errorEndDate.innerHTML = "";
        }
        if (txtStartDate >= txtEndDate) {
            alert("Start date cannot be later than end date");
            i++;
        }

        function isPositiveInteger(value) {
            return Number.isInteger(value) && value > 0;
        }

        if (txtQuantity.trim() === '') {
            errorQuantity.innerHTML = "Quantity cannot be empty!";
            i++;
        } else if (!regexNumber.test(txtQuantity)) {
            errorQuantity.innerHTML = "Quantity must be integer!";
            i++;
        } else if (isPositiveInteger(parseFloat(txtQuantity))) {
            errorQuantity.innerHTML = "";
        } else {
            errorQuantity.innerHTML = "Quantity must be integer and more than 0";
            i++;
        }

        function isDoubleInRange(num) {
            return typeof num === "number" && !isNaN(num) && num >= 0 && num <= 1;
        }

        if (txtPercentage.trim() === '') {
            errorPercentage.innerHTML = "Percentage cannot be empty!";
            i++;
        } else if (!regexNumber.test(txtPercentage)) {
            errorPercentage.innerHTML = "Percentage must be a number!";
            i++;
        } else if (isDoubleInRange(parseFloat(txtPercentage))) {
            errorPercentage.innerHTML = "";
        } else {
            errorPercentage.innerHTML = "Percentage must be between 0 and 1!";
            i++;
        }

        if (i > 1) {
            return false;
        } else {
            if (confirm("Confirm creating a new voucher?") == true) {
                return true
            } else {
                return false;
            }
        }
    }
</script>
</body>
</html>