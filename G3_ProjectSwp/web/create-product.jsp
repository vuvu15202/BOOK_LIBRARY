<%@include file="templates/header_admin.jsp" %>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="content-right">

    <c:if test="${create1_edit2 == 2}">
        <div class="path-admin">UPDATE PRODUCT INFOMATION</b></div>
        <c:url var="formAction" value="editProduct_admin" />
    </c:if>
    <c:if test="${create1_edit2 == 1}">
        <div class="path-admin">CREATE A NEW PRODUCT</b></div>
        <c:url var="formAction" value="createProduct_admin" />
    </c:if>
    <div class="content-main">
        <form id="content-main-product" action="${formAction}" method="post" enctype="multipart/form-data">
            <div class="content-main-1">
                <input type="hidden" name="pid" value="${p.getProductID()}">
                <label>Product Name : <span style="color: red" id="errorProductName"></span></label><br/>
                <input type="text" name="txtProductName" id="txtProductName" value="${p.getProductName()}"><br/>
                <label>Category Name(*):</label><br/>
                <select name="ddlCategory">
                    <c:forEach items="${listc}" var="c">
                        <option ${p.getCategoryID()==c.getCategoryID()?"selected":""} value=${c.getCategoryID()}>${c.getCategoryName()}</option>
                    </c:forEach>
                </select>
                <label>Genre Name:</label><br/>
                <select name="ddlGenre">
                    <c:forEach items="${listg}" var="g">
                        <option ${p.getGenreID()==g.getGenreID()?"selected":""} value=${g.getGenreID()}>${g.getGenreName()}</option>
                    </c:forEach>
                </select> <br>
                <label>Cover Price: <span style="color: red" id="errorCoverPrice"></span></label><br/>
                <input value="${p.getCoverPrice()}" id="txtCoverPrice" type="text" name="txtCoverPrice" id=""><br/>
                <label>Sale Price: <span style="color: red" id="errorSalePrice"></span></label><br/>
                <input value="${p.getSalePrice()}" type="text" name="txtSalePrice" id="txtSalePrice"><br/>
                <label>Author Name:</label><br/>
                <select name="ddlAuthor">
                    <c:forEach items="${lista}" var="a">
                        <option ${p.getAuthorID()==a.getAuthorID()?"selected":""} value=${a.getAuthorID()}>${a.getAuthorName()}</option>
                    </c:forEach>
                </select>
                <label>Discontinued (*): </label>
                <input style="    width: 15px;
                       position: relative;
                       top: 5px;
                       left: 5px;" ${p.isDiscontinued()==true?"checked":""} type="checkbox" name="chkDiscontinued" value="1" id=""><br/>

            </div>
            <div class="content-main-1">
                <label>Translator: <span style="color: red" id="errorTranslator"></span></label><br/>
                <input value="${p.getTranslator()}" type="text" name="txtTranslator" id="txtTranslator"><br/>
                <label>Publisher Name:</label><br/>
                <select name="ddlPublisher">
                    <c:forEach items="${lists}" var="s">
                        <option ${p.getPublisherID()==s.getSupplierID()?"selected":""} value=${s.getSupplierID()}>${s.getSupplierName()}</option>
                    </c:forEach>
                </select>
                <label>Supplier Name:</label><br/>
                <select name="ddlSupplier">
                    <c:forEach items="${lists}" var="s">
                        <option ${p.getSupplierID()==s.getSupplierID()?"selected":""} value=${s.getSupplierID()}>${s.getSupplierName()}</option>
                    </c:forEach>
                </select>
                <label>Language: <span style="color: red" id="errorLanguage"></span></label><br/>
                <input value="${p.getLanguage()}" type="text" name="txtLanguage" id="txtLanguage"><br/>
                <label>Book Size: <span style="color: red" id="errorSize"></span></label><br/>
                <input value="${p.getSize()}" type="text" name="txtSize" id="txtSize"><br/>
                <label>Book Weight: <span style="color: red" id="errorWeight"></span></label><br/>
                <input value="${p.getWeight()}" type="text" name="txtWeight" id="txtWeight"><br/>

            </div>
            <div class="content-main-1">
                <label>Number Of Page: <span style="color: red" id="errorPage"></span></label><br/>
                <input value="${p.getNumberOfPage()}" type="text" name="txtPage" id="txtPage"><br/>
                <label>Format: <span style="color: red" id="errorFormat"></span></label><br/>
                <input value="${p.getFormat()}" type="text" name="txtFormat" id="txtFormat"><br/>
                <label>Image:</label><br/>
                <!--<input value="${p.getImage()}" type="text" name="txtImg" id=""><br/>-->
                <input style="background: white" type="file" name="chooseFile"/>
                <label>Publish Date: <span style="color: red" id="errorpl"></span></label><br/>
                <input value="${p.getPublishDate()}" type="date" name="txtPublishDate" id="txtPublishDate"><br/>
                <label>Publish License:</label><br/>
                <input value="${p.getPublishingLicense()}" type="text" name="txtLicense" id=""><br/>
                <label>Description: <span style="color: red" id="errorDescription"></span></label><br/>
                <input value="${p.getDescription()}" type="text" name="txtDescription" id="txtDescription"><br/>
                <br/> 
            </div>

            <input onclick="return validate()" style="margin: auto;" type="submit" value="Save"/>

        </form>
    </div>


    <!--<input style="margin: auto;" type="submit" value="Save"/>-->

</form>
</div>
</div>


<div id="footer-admin">Mai la anh em</div>
</div>
</body>
<script>
    function validate() {
        let i = 1;
        let txtProductName = document.getElementById('txtProductName').value.trim();
        let txtSalePrice = document.getElementById('txtSalePrice').value.trim();
        let txtCoverPrice = document.getElementById('txtCoverPrice').value.trim();
        let txtTranslator = document.getElementById('txtTranslator').value.trim();
        let txtWeight = document.getElementById('txtWeight').value.trim();
        let txtSize = document.getElementById('txtSize').value.trim();
        let txtPage = document.getElementById('txtPage').value.trim();
        let txtDescription = document.getElementById('txtDescription').value.trim();
        let txtLanguage = document.getElementById('txtLanguage').value.trim();
        let txtFormat = document.getElementById('txtFormat').value.trim();
        let txtPublishDate = document.getElementById('txtPublishDate').value;

//        let currentDate = new Date();
//        let selectedDate = new Date(txtPublishDate);
//        if (selectedDate > currentDate) {
//            alert('Invalid time selection!');
//            i++;
//        }
        if (txtPublishDate == '') {
            errorpl.innerHTML = "Publish Date cannot null!";
            i++;
        } else {
            errorpl.innerHTML = "";
        }
        
        const regexName = /^[\p{L} ]+$/u;
        const regexNumber = /^[0-9.]+$/;
        const regexSize = /^[0-9 .x]+$/;
        const regexPage = /^[0-9]+$/;
        const regexDescription = /^.+$/;

        if (txtProductName === '') {
            errorProductName.innerHTML = "Product Name cannot be empty!";
            i++;
        } else if (txtProductName.length > 70) {
            errorProductName.innerHTML = "ID cannot be more than 20 characters!";
            i++;
        } else {
            errorProductName.innerHTML = "";
        }

        if (txtCoverPrice === '') {
            errorCoverPrice.innerHTML = "Cover Price cannot be empty!";
            i++;
        } else if (!regexNumber.test(txtCoverPrice)) {
            errorCoverPrice.innerHTML = "Cover Price must be positive number!";
            i++;
        } else {
            errorCoverPrice.innerHTML = "";
        }

        if (txtSalePrice === '') {
            errorSalePrice.innerHTML = "Cover Price cannot be empty!";
            i++;
        } else if (!regexNumber.test(txtSalePrice)) {
            errorSalePrice.innerHTML = "Cover Price must be positive number!";
            i++;
        } else {
            errorSalePrice.innerHTML = "";
        }

        if (txtSalePrice > txtCoverPrice) {
            alert("Sale Price cannot be more than Cover Price");
            i++;
        }

        if (txtTranslator !== '') {
            if (txtTranslator.length < 2) {
                errorTranslator.innerHTML = "Translator Name cannot be less than 2 characters!";
                i++;
            } else if (txtTranslator.length > 30) {
                errorTranslator.innerHTML = "Translator Name cannot be more than 30 characters!";
                i++;
            } else if (txtTranslator.match(regexName)) {
                errorTranslator.innerHTML = "";
            } else {
                errorTranslator.innerHTML = "Translator Name cannot contain numbers or special characters!";
                i++;
            }
        }

        if (txtLanguage !== '') {
            if (txtLanguage.length < 2) {
                errorLanguage.innerHTML = "Language name cannot be less than 2 characters!";
                i++;
            } else if (txtLanguage.length > 30) {
                errorLanguage.innerHTML = "Name cannot be more than 30 characters!";
                i++;
            } else if (txtLanguage.match(regexName)) {
                errorLanguage.innerHTML = "";
            } else {
                errorLanguage.innerHTML = "Name cannot contain numbers or special characters!";
                i++;
            }
        }

        if (txtSize !== '') {
            if (txtSize.match(regexSize)) {
                errorSize.innerHTML = "";
            } else {
                errorSize.innerHTML = "Enter in the form width x length";
                i++;
            }
        }

        if (txtWeight == '') {
            errorWeight.innerHTML = "Weight cannot be empty";
            i++
        }
        if (!regexNumber.test(txtWeight) || txtWeight == 0) {
            errorWeight.innerHTML = "Weight must be positive number!";
            i++;
        } else {
            errorWeight.innerHTML = "";
        }


        if (txtPage == '') {
            errorPage.innerHTML = "NOP cannot be empty!";
            i++;
        } else if (!regexPage.test(txtPage) || txtPage == 0) {
            errorPage.innerHTML = "NOP must be positive number!";
            i++;
        } else {
            errorPage.innerHTML = "";
        }


        if (txtDescription !== '') {
            if (txtDescription.length < 10) {
                errorDescription.innerHTML = "Description cannot be less than 10 characters";
                i++;
            } else if (!regexDescription.test(txtDescription)) {
                errorDescription.innerHTML = "The Description must contain words";
                i++;
            } else {
                errorDescription.innerHTML = "";
            }
        }

        if (txtFormat == '') {
            errorFormat.innerHTML = "Format cannot be empty!";
            i++;
        } else if (txtFormat.length < 5) {
            errorFormat.innerHTML = "Format cannot be less than 5 characters";
            i++;
        } else if (txtFormat.length > 40) {
            errorFormat.innerHTML = "Format cannot be more than 40 characters";
            i++;
        } else if (!regexDescription.test(txtFormat)) {
            errorFormat.innerHTML = "The Format must contain words";
            i++;
        } else {
            errorFormat.innerHTML = "";
        }


        if (i > 1) {
            return false;
        } else {
            if (confirm("confirm change?") == true) {
                return true;
            } else {
                return false;
            }
        }

    }


</script>
</html>