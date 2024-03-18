<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thống kê</title>
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
                        <h3 class="card-header">Top 5 khách hàng mua nhiều nhất</h3>
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên khách hàng</th>
                                                <th>Email</th>
                                                <th>Tổng chi tiêu</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listTop5Cus}" var="t">
                                            <c:forEach items="${listAllAccount}" var="o">
                                                <c:if test="${o.uID==t.id}">
                                                    <tr>
                                                        <td>${o.uID}</td>
                                                        <td>${o.user}</td>
                                                        <td>${o.email}</td>
                                                        <td>${t.totalPay}</td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>