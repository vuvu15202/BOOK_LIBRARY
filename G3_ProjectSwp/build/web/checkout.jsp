<%@include file="templates/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .content {
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.075);
        background-color: white;
        padding: 30px;
    }
</style>
<p>

    <script src="<%=path%>/js/countrystatecity.js?v2"></script>
</p>
<main id="tg-main page" class="tg-main tg-haslayout">
    <div class="tg-sectionspace tg-haslayout">
        <section class="shopping-cart dark">
            <div class="container">
                <div class="py-5 text-center">
                    <h2 style="margin-top: -20px; margin-bottom: 20px;">Checkout</h2>
                </div>
                <div class="content">
                    <div class="row">

                        <div class="col-md-8 order-md-1">
                            <h4 class="mb-3" style="font-weight: 600;">Billing address</h4>



                            <form action="checkout" class="needs-validation" novalidate method="POST">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="fullName">Full Name <span style="color: red;font-size: 12px;font-weight: 600;" id="errorName"></span></label>
                                        <input type="text" class="form-control" name="txtReceiver" id="fullName" placeholder="" value="${cus.getFirstName()} ${cus.getLastName()}" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="phone">Phone Number <span style="color: red;font-size: 12px;font-weight: 600;" id="errorPhone"></span></label>
                                        <input type="tel" name="txtPhoneNumber" class="form-control" id="phone" placeholder="" value="${cus.getPhoneNumber()}" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="email">Email <span style="color: red;font-size: 12px;font-weight: 600;" id="errorEmail"></span></label>
                                    <input type="email" name="txtEmail" class="form-control" id="email" placeholder="you@example.com" value="${AccCustomerSession.getEmail()}">
                                </div>

                                <div class="mb-3">
                                    <label for="address">Address <span style="color: red;font-size: 12px;font-weight: 600;" id="errorAddress"></span></label>
                                    <input type="text" name="txtAddress" class="form-control" id="address" placeholder="1234 Main St" required>
                                </div>

                                <div class="row">
                                    <!--                                    <div class="col-md-5 mb-3">
                                                                            <label for="country">Country</label>
                                                                            <select name="country" class="countries form-control" id="countryId">
                                                                                <option value="">Select Country</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-4 mb-3">
                                                                            <label for="state" name="txtShipCity">City</label>
                                                                            <select name="state" class="states form-control" id="stateId">
                                                                                <option value="">Select City</option>
                                                                            </select>
                                    
                                                                        </div>
                                                                        <div class="col-md-3 mb-3">
                                                                            <label for="zip">District</label>
                                                                            <input type="text" class="form-control" id="district" placeholder="" required>
                                    
                                                                        </div>-->
                                    <br>
                                    <div class="col-md-4 mb-3">
                                        <label for="country">Country</label>
                                        <input class="" name="" readonly type="text" value="Viet Nam">
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="City">City <span style="color: red;font-size: 12px;font-weight: 600;" id="errorSelecttp"></span></label>
                                        <select id="selectTp" name="calc_shipping_provinces" required="">
                                            <option value="">Tỉnh / Thành phố</option>
                                        </select>
                                        <input class="billing_address_1" name="txtCity" type="hidden" value="">
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="District">District <span style="color: red;font-size: 12px;font-weight: 600;" id="errorSelecth"></span></label>
                                        <select id="selectH" name="calc_shipping_district" required="">
                                            <option value="">Quận / Huyện</option>
                                        </select>

                                        <input class="billing_address_2" name="txtDistrict" type="hidden" value="">
                                    </div>

                                </div>
                                <hr class="mb-4">

                                <h4 class="mb-3">Payment</h4>

                                <div class="d-block my-3" style="width: 50%;">
                                    <div class="custom-control custom-radio">
                                        <input name="rbPaymentMethod" id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                        <label class="custom-control-label" for="credit">Cash on Delivery (COD)</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input name="rbPaymentMethod" id="credit" name="paymentMethod" type="radio" class="custom-control-input" disabled>
                                        <label class="custom-control-label" for="credit">Credit card</label>
                                    </div>
                                </div>
                                <hr class="mb-4">
                                <button onclick="return validate()" class="tg-btn tg-btns tg-active" type="submit">Confirm to order</button>
                            </form>
                        </div>
                        <div class="col-md-4 order-md-2 mb-4" id="ajax">
                            <h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted" style="font-weight: 600;">Your cart</span>
                                <span class="badge badge-secondary badge-pill"></span>
                            </h4>
                            <ul class="list-group mb-3">
                                <c:forEach items="${cartList}" var="cart">
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                        <div>
                                            <c:forEach items="${proList}" var="product">
                                                <c:if test="${product.getProductID() == cart.getProductID()}">
                                                    <h6 class="my-0">${product.getProductName()}</h6>
                                                </c:if>

                                            </c:forEach>
                                            <c:forEach items="${proList}" var="product">
                                                <c:if test="${product.getProductID() == cart.getProductID()}">
                                                    <small class="text-muted">${product.getSalePrice()}</small>
                                                </c:if>

                                            </c:forEach>
                                        </div>
                                        <span class="text-muted">x${cart.getQuantity()}</span>
                                    </li>
                                </c:forEach>


                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">Voucher code</h6>
                                        <small>No voucher is applied</small>
                                    </div>
                                    <span class="text-success"></span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Shipping: </span>
                                    <strong>30000</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Total (USD): </span>
                                    <strong>${total}</strong>
                                </li>
                            </ul>

                            <!--                            <form class="card p-2">-->
                            <div class="input-group">
                                <input id="vuvu" type="text" class="form-control" name="txtDiscountID" placeholder="Voucher code">
                                <div class="input-group-append">
                                    <button onclick="redeem()" type="submit" class="tg-btn tg-btns " style="background-color: lightgray">Redeem</button>
                                </div>
                            </div>
                            <!--                            </form>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>

<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->

<%@include file="templates/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
                                        function redeem() {
                                            var discount = document.getElementById("vuvu").value;
                                            $.ajax({
                                                url: "/G3_ProjectSwp/checkoutAjax",
                                                type: "get", //send it through get method
                                                data: {
                                                    txtDiscountID: discount
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("ajax");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }

                                        function validate() {
                                            let i = 1;
                                            var mySelecttp = document.getElementById('selectTp').value;
                                            var mySelecth = document.getElementById('selectH').value;
                                            let txtReceiver = document.getElementById('fullName').value.trim();
                                            let txtPhoneNumber = document.getElementById('phone').value.trim();
                                            let txtEmail = document.getElementById('email').value.trim();
                                            let txtAddress = document.getElementById('address').value.trim();
                                            const regexName = /^[\p{L} ]+$/u;
                                            const regexPhone = /^(0|84)\d{9}$/;
                                            const regexAdresss = /['"\\?!^*%$@]/;
                                            var regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                                            if (mySelecttp == "") {
                                                errorSelecttp.innerHTML = "Not null!";
                                                i++;
                                            }
                                            if (mySelecth == "") {
                                                errorSelecth.innerHTML = "Not null!";
                                                i++;
                                            }

                                            if (txtReceiver === '') {
                                                errorName.innerHTML = "Name cannot be empty!";
                                                i++;
                                            } else if (txtReceiver.length < 2) {
                                                errorName.innerHTML = "Name cannot be less than 2 characters!";
                                                i++;
                                            } else if (txtReceiver.length > 30) {
                                                errorName.innerHTML = "Name cannot be more than 30 characters!";
                                                i++;
                                            } else if (txtReceiver.match(regexName)) {
                                                errorName.innerHTML = "";
                                            } else {
                                                errorName.innerHTML = "Name cannot contain numbers or special characters!";
                                                i++;
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
//        
//        
                                            if (txtAddress == '') {
                                                errorAddress.innerHTML = "Address cannot be empty!";
                                                i++;
                                            } else if (txtAddress.length < 10) {
                                                errorAddress.innerHTML = "address cannot be less than 10 characters";
                                                i++;
                                            } else if (txtAddress.length > 100) {
                                                errorAddress.innerHTML = "address cannot be more than 100 characters";
                                                i++;
                                            } else if (!regexAdresss.test(txtAddress)) {
                                                errorAddress.innerHTML = "";
                                            } else {
                                                errorAddress.innerHTML = "address cannot contain special characters: '\"\?^*%!@$";
                                                i++;
                                            }
//        
                                            if (txtEmail === '') {
                                                errorEmail.innerHTML = "Email cannot be empty!";
                                                i++;
                                            } else if (txtEmail.match(regexEmail)) {
                                                errorEmail.innerHTML = "";
                                            } else {
                                                errorEmail.innerHTML = "Wrong email format!";
                                                i++;
                                            }

                                            if (i > 1) {
                                                return false;
                                            } else {
                                                if (confirm("Confirm to order") == true) {
                                                    return true
                                                } else {
                                                    return false;
                                                }
                                            }

                                        }


</script>                 

<script src="https://web8802.com/wp-content/themes/hienads/assets/js/quanhuyen.js"></script>
<script>
                                        if (address_2 = localStorage.getItem('address_2_saved')) {

                                            $('select[name="calc_shipping_district"] option').each(function () {

                                                if ($(this).text() == address_2) {

                                                    $(this).attr('selected', '')

                                                }

                                            })

                                            $('input.billing_address_2').attr('value', address_2)

                                        }

                                        if (district = localStorage.getItem('district')) {

                                            $('select[name="calc_shipping_district"]').html(district)

                                            $('select[name="calc_shipping_district"]').on('change', function () {

                                                var target = $(this).children('option:selected')

                                                target.attr('selected', '')

                                                $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')

                                                address_2 = target.text()

                                                $('input.billing_address_2').attr('value', address_2)

                                                district = $('select[name="calc_shipping_district"]').html()

                                                localStorage.setItem('district', district)

                                                localStorage.setItem('address_2_saved', address_2)

                                            })

                                        }

                                        $('select[name="calc_shipping_provinces"]').each(function () {

                                            var $this = $(this),
                                                    stc = ''

                                            c.forEach(function (i, e) {

                                                e += +1

                                                stc += '<option value=' + e + '>' + i + '</option>'

                                                $this.html('<option value="">T?nh / Thành ph?</option>' + stc)

                                                if (address_1 = localStorage.getItem('address_1_saved')) {

                                                    $('select[name="calc_shipping_provinces"] option').each(function () {

                                                        if ($(this).text() == address_1) {

                                                            $(this).attr('selected', '')

                                                        }

                                                    })

                                                    $('input.billing_address_1').attr('value', address_1)

                                                }

                                                $this.on('change', function (i) {

                                                    i = $this.children('option:selected').index() - 1

                                                    var str = '',
                                                            r = $this.val()

                                                    if (r != '') {

                                                        arr[i].forEach(function (el) {

                                                            str += '<option value="' + el + '">' + el + '</option>'

                                                            $('select[name="calc_shipping_district"]').html('<option value="">Qu?n / Huy?n</option>' + str)

                                                        })

                                                        var address_1 = $this.children('option:selected').text()

                                                        var district = $('select[name="calc_shipping_district"]').html()

                                                        localStorage.setItem('address_1_saved', address_1)

                                                        localStorage.setItem('district', district)

                                                        $('select[name="calc_shipping_district"]').on('change', function () {

                                                            var target = $(this).children('option:selected')

                                                            target.attr('selected', '')

                                                            $('select[name="calc_shipping_district"] option').not(target).removeAttr('selected')

                                                            var address_2 = target.text()

                                                            $('input.billing_address_2').attr('value', address_2)

                                                            district = $('select[name="calc_shipping_district"]').html()

                                                            localStorage.setItem('district', district)

                                                            localStorage.setItem('address_2_saved', address_2)

                                                        })

                                                    } else {

                                                        $('select[name="calc_shipping_district"]').html('<option value="">Qu?n / Huy?n</option>')

                                                        district = $('select[name="calc_shipping_district"]').html()

                                                        localStorage.setItem('district', district)

                                                        localStorage.removeItem('address_1_saved', address_1)

                                                    }

                                                })

                                            })

                                        })

</script>
<!--

<h4 class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted" style="font-weight: 600;">Your cart</span>
                                <span class="badge badge-secondary badge-pill"></span>
                            </h4>
                            <ul class="list-group mb-3">
                                
                                
                                
                                
                                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                                        <div>
                                            
                                                    <h6 class="my-0">${product.getProductName()}</h6>
                                                
                                           
                                                    <small class="text-muted">${product.getSalePrice()}</small>
                                               
                                        </div>
                                        <span class="text-muted">${cart.getQuantity()}</span>
                                    </li>
                                
                                    
                                    
                                    
                                    
                                    
                                    
                                
                                
                                <li class="list-group-item d-flex justify-content-between bg-light">
                                    <div class="text-success">
                                        <h6 class="my-0">Promo code</h6>
                                        <small>EXAMPLECODE</small>
                                    </div>
                                    <span class="text-success">-$5</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Shipping</span>
                                    <strong>$20</strong>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span>Total (VND)</span>
                                    <strong>$20</strong>
                                </li>
                            </ul>

                            <form class="card p-2">
                                <div class="input-group">
                                    <input value="fffff" id="discount" type="text" class="form-control" name="txtDiscountID" placeholder="Promo code">
                                    <div class="input-group-append">
                                        <button onclick="redeem()" type="submit" class="tg-btn tg-btns " style="background-color: lightgray">Redeem</button>
                                    </div>
                                </div>
                            </form>-->