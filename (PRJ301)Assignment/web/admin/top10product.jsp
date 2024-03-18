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
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="leftadmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <div class="card text-center">
                        <h3 class="card-header">Top 10 sản phẩm bán chạy nhất</h3>
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Hình ảnh</th>
                                                <th>Giá tiền</th>
                                                <th>Số lượng đã bán</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listTop10Product}" var="t">
                                            <c:forEach items="${listAllProduct}" var="o">
                                                <c:if test="${t.productID==o.id }">
                                                    <tr>
                                                        <td style="width: 50px;">${o.id}</td>
                                                        <td>${o.name}</td>
                                                        <td style="max-width: 150px;">
                                                            <img src="${o.image}" class="img-fluid" alt="Product Image">
                                                        </td>
                                                        <td style="width: 100px;">${o.price}</td>
                                                        <td style="width: 150px;">${t.soLuongDaBan}</td>
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