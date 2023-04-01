<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        String path = request.getContextPath();
        %>
        <title>Login</title>
        <link rel="stylesheet" href="<%=path%>/css/login.css">
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v16.0&appId=718155789958513&autoLogAppEvents=1"nonce="LpjM0yAZ"></script>
</head>

<body>
    <p><a href="<%=path%>/homepage">Back to home</a></p>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form method="POST" action="<%=path%>/account/signup">
                <h1>Create Account</h1>
                <input type="text" placeholder="First Name" id="firstName" name="firstName" />
                <input type="text" placeholder="Last Name" id="lastName" name="lastName"/>
                <input type="email" placeholder="Email" name="email"/>
                <input type="password" placeholder="Password" minlength="8" required id="passWord" name="password"/>
                <button onclick="return validate()" type="submit">Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form id="sign-in-form" method="POST" action="<%=path%>/account/login">  
                <h1>Sign In</h1>
                <div class="social-container">
                    <div class="fb-login-button" data-width="204" data-size="medium" data-button-type="continue_with"
                         data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"
                         scope="public_profile,email" onlogin="checkLoginState();" id="facebooklogin"></div>
                    <span><a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20&redirect_uri=http://localhost:8080/G3_ProjectSwp/LoginGoogleHandler&response_type=code
                             &client_id=895751570738-42rl81djmdp03l773ltga54oe9in6kj6.apps.googleusercontent.com&approval_prompt=force"><img src="<%=path%>/images/btn_google.png" style="width: 210px" alt=""></a></span>
                    <!--                    <div id="g_id_onload"
                                             data-client_id="1050564579754-430rd5eoroffdc7umpogphsqmbvhj9es.apps.googleusercontent.com"
                                             data-context="signin" data-ux_mode="popup" data-callback="handleCredentialResponse"
                                             data-auto_prompt="false">
                                        </div>
                                        
                                        <div class="g_id_signin" data-type="standard" data-shape="rectangular" data-theme="outline"
                                             data-text="signin_with" data-size="" data-logo_alignment="left" type="submit">
                                        </div>-->

                </div>
                <span>or use your account</span>  
                <c:if test="${msgEmail!=null}"><div style="color: red;">${msgEmail}</div></c:if>
                <input type="email" placeholder="Email" name="txtEmail" value="${emailSession}"/>
                <c:if test="${msgPass!=null}"><div style="color: red;">${msgPass}</div></c:if>
                <input type="password" placeholder="Password" name="txtPassword" value="${passwordSession}"/>
                <p class="forgot-password"><a href="<%=path%>/account/forgotpass">Forgot your password?</a></p>
                <button class="control-button in">Sign In</button>
                <c:if test="${msg!=null}"><div style="color: red;">${msg}</div></c:if>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Welcome!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                    <div class="overlay-panel overlay-left">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <p> P.s: Staff only &#128521; </p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="<%=path%>/js/login.js"></script>
</body>
<script>
                    function validate() {
                        let i = 1;
                        let firstName = document.getElementById('firstName').value.trim();
                        let lastName = document.getElementById('lastName').value.trim();
                        let passWord = document.getElementById('passWord').value.trim();

                        const regexName = /^[\p{L} ]+$/u;

                        if (firstName === '') {
                            alert('First Name cannot be empty!')
                            i++;
                        } else if (firstName.length < 2) {
                            alert('First Name cannot be less than 2 characters!')
                            i++;
                        } else if (firstName.length > 30) {
                            alert('First Name cannot be more than 30 characters!')
                            i++;
                        } else if (firstName.match(regexName)) {

                        } else {
                            alert('First Name cannot contain numbers or special characters!')
                            i++;
                        }

                        if (lastName === '') {
                            alert('Last Name cannot be empty!')
                            i++;
                        } else if (lastName.length < 2) {
                            alert('Last Name cannot be less than 2 characters!')
                            i++;
                        } else if (lastName.length > 30) {
                            alert('Last Name cannot be more than 30 characters!')
                            i++;
                        } else if (lastName.match(regexName)) {
                        } else {
                            alert('Last Name cannot contain numbers or special characters!')
                            i++;
                        }

                        if (i > 1) {
                            return false;
                        } else {

                            return true;
                        }
                    }

                    

</script>
</html>