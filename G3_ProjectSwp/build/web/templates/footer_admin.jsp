</div>
        <div id="footer-admin">2023 All Rights Reserved By &copy; Book Library</div>
    </div>
</body>
</html>
<script>
    function OrdersChart(){
        var temp = ["1", "2", "3", "4", "5", "6"];
        var xValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        var yValues = ${statisticRevenue};
        new Chart("myChart1", {
        type: "line",
        data: {
            labels: xValues,
            datasets: [{ 
            data: yValues,
            borderColor: "green",
            fill: true
            }]
        },
        options: {
            legend: {display: false}
        }
        });
    }

    function CustomersChart(){
        var xValues = ${statisticOrderIn6Month_param};
        var yValues = ${statisticOrderIn6Month};
        var barColors = ["green", "red", "red", "red", "red", "red"];

        new Chart("myChart2", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
            backgroundColor: barColors,
            data: yValues
            }]
        },
        options: {
            legend: {display: false},
            title: {
            display: true,
            text: "New Order (6 month earlier)"
            }
        }
        });
    }
    
    OrdersChart();
    CustomersChart();
    </script>