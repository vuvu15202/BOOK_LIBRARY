<%@include file="templates/header_admin.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content-right">
    <div class="path-admin">DASHBOARD</b></div>
    <div class="content-main">
        <hr/>
        <div id="content-main-dashboard">
            <div id="dashboard-1">
                <div id="dashboard-1-container">
                    <div class="dashboard-item">
                        <div class="dashboard-item-title">Today Revenue</div>
                        <div class="dashboard-item-content">${todayRevenue}</div>
                    </div>
                    <div class="dashboard-item">
                        <div class="dashboard-item-title">Total Orders</div>
                        <div class="dashboard-item-content">${totalOrderInMonth}</div>
                    </div>
                    <div class="dashboard-item">
                        <div class="dashboard-item-title">Monthly Revenue</div>
                        <div class="dashboard-item-content">${monthlyRevenue}</div>
                    </div>
                    <div class="dashboard-item">
                        <div class="dashboard-item-title">New Customers</div>
                        <div class="dashboard-item-content">${totalNewCusInMonth}</div>
                    </div>
                </div>
            </div>
            <div id="dashboard-2">
                <div id="chart" style="text-align: center;">
                    <div id="chart1">
                        <span>Statistic Revenue </span>
                        <select id="staticYear" name="staticYear"  onchange="statisticYear()">
                            <option value="2023">Year</option>
                            <c:forEach items="${years}" var="i">
                                <c:choose>
                                    <c:when test="${i==yearSession}">
                                        <option selected="true" value="${yearSession}">${yearSession}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${i}">${i}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <canvas id="myChart1" style="width: 100%;"></canvas>
                    </div> 
                    <div id="chart2"> <br> 
                        <canvas id="myChart2" style="width: 80%;"></canvas>
<!--                        <input name="radioDiagram" id="radioDiagram" type="radio" value="" >6 months earlier
                        <input name="radioDiagram" id="radioDiagram" type="radio" value="" >This month-->

<!--                        <b>Filter:</b>
                         <br>

                        <b>Filter by Date:</b>
                        <form style="padding-bottom: 10px;">
                            <b>From</b>: <input type="date" name="txtStartOrderDate"/> <br>
                            <b>To</b>: <input type="date" name="txtEndOrderDate"/>
                            <input type="submit" value="Filter">
                            </form> -->

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
function statisticYear() {
    var year = document.getElementById("staticYear").value;
    window.location.href = '<%=request.getContextPath()%>/dashboard_admin?year=' + year ;
}

function thisMonth() {
    window.location.href = '<%=request.getContextPath()%>/dashboard_admin?thisMonth=true' ;
}
</script>
<%@include file="templates/footer_admin.jsp" %>