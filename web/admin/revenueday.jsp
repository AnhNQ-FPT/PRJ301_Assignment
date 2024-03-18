<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doanh thu ngày</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <style>
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }
            /* Sidebar */
            .sidebar {
                position: fixed;
                padding: 58px 0 0;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="/admin/leftadmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                        <div class="card text-center">
                            <h3 class="card-header">Doanh thu theo ngày</h3>
                            <div class="card-body">
                                <canvas class="w-100" id="pieChart" height="350"></canvas>
                            </div>
                        </div>
                </div>
            </main>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
            <script>
                var a = document.getElementById("pieChart").getContext('2d');
                var myPieChart = new Chart(a, {
                    type: 'pie',
                    data: {
                        labels: ["Sunday", "Saturday", "Friday", "Thursday", "Wednesday", "Tuesday", "Monday"],
                        datasets: [{
                                data: [${totalMoney1}, ${totalMoney7}, ${totalMoney6}, ${totalMoney5}, ${totalMoney4}, ${totalMoney3}, ${totalMoney2}],
                                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#1874CD", "#CDB5CD"]
                            }]
                    }
                });
        </script>
    </body>
</html>