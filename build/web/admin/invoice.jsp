<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hóa đơn</title>
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
                        <h3 class="card-header">Hóa đơn</h3>
                        <p><h6>Tổng: ${sumAllInvoice}</h6>
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-md-8">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Mã Hóa Đơn</th>
                                                <th>Tài khoản</th>
                                                <th>Tổng tiền</th>
                                                <th>Ngày Xuất</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listAllInvoice}" var="i">
                                            <tr>
                                                <td>${i.invoiceID}</td>
                                                <c:forEach items="${listAllAccount}" var="a">
                                                    <c:if test="${i.accountID==a.uID}">
                                                        <td>${a.user}</td>
                                                    </c:if>
                                                </c:forEach>
                                                <td>${String.format("%.1f",i.total)}</td>
                                                <td>${i.dateInvoice}</td>
                                            </tr>
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