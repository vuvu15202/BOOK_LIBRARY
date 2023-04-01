<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index</title>
        <%
            String path = request.getContextPath();
        %>
        <link href="<%=path%>/css/style-admin.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <script src="https://kit.fontawesome.com/6d68bb11b2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://kit.fontawesome.com/6d68bb11b2.css" crossorigin="anonymous">
    </head>
    <body>
        <div id="container">
            <div id="header">
                <div id="logo-admin">
                    <img style="width: 90%;" src="http://localhost:8080/G3_ProjectSwp/images/logo.png" alt="">
                </div>
                <div id="banner-admin">
                    <h1>Ecommerce Admin</h1>
                    <ul>
                        <li><a href="<%=path%>/account/login">SignOut</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
                <div id="content-left">
                    <ul>
                        <h6><a href="<%=path%>/StoreManager_admin"><li><i class="fa-solid fa-house"></i> Store managerment</li> </a></h6>
                        <c:if test="${AdminSession!=null}">
                            <h6><a href="<%=path%>/dashboard_admin"><li><i class="fa-solid fa-chart-line"></i> Dashboard</li></a></h6>
                        </c:if>
                        
                        <h6><a href="<%=path%>/orderManage_admin"><li><i class="fa-solid fa-cart-shopping"></i> Orders </li></a></h6>
                        <h6><a href="<%=path%>/productManage_admin"><li><i class="fa-solid fa-book"></i> Products</li></a></h6>
                        <h6><a href="<%=path%>/customerManage_admin"><li><i class="fa-solid fa-users"></i> Customers</li></a></h6>
                        <c:if test="${AdminSession!=null}">
                            <h6><a href="<%=path%>/employeeManager_admin"><li><i class="fa-solid fa-user"></i> Employees</li></a></h6>
                        </c:if>
                        
                        <h6><a href="<%=path%>/voucherManage_admin"><li><i class="fa-solid fa-ticket"></i> Voucher</li></a></h6>
                    </ul>
                </div>