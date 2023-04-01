<%@include file="templates/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="form" style="text-align: center;">
    <h3 style="font-weight: 600; ">Forgot your account password?</h3>
    <div style="padding: 0px 20px 10px; width: 800px; margin: auto auto;">
        Please enter the email address registered with us to create a new password. We will send an email to the email address provided and require verification before we can generate a new password
    </div>
    <div id="form-content">
        <form action="<%=path%>/account/forgotpass" method="POST" >
            <label>Enter your registered email address<span style="color: red;">*</span></label><br/>
            <input type="text" id="email" name="txtEmail" style="width: 300px;" value="${emailSession}"/><br/>
            
            <c:if test="${msg!=null}"><div style="color: red; text-align: center;">${msg}</div></c:if>
            
            <input type="submit" value="GET PASSWORD" style="margin-bottom: 30px; margin-top: 25px;"/><br/>
        </form>
    </div>
</div>

<%@include file="templates/footer.jsp" %>
