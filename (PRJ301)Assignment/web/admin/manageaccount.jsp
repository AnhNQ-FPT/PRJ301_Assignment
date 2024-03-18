<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản Lý Tài Khoản</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
            <jsp:include page="leftadmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <div class="card text-center">
                        <h3 class="card-header">
                            Quản lý tài khoản<a href="#addEmployeeModal"  data-toggle="modal"><button>+</button></a>  
                        </h3>
                    <c:if test="${error!=null }">
                        <div class="alert alert-danger" role="alert">
                            ${error}
                        </div>
                    </c:if>
                    <c:if test="${mess!=null }">
                        <div class="alert alert-success" role="alert">
                            ${mess}
                        </div>
                    </c:if>
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên đăng nhập</th>
                                            <th>Nhân viên</th>
                                            <th>Admin</th>
                                            <th>Email</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listA}" var="o">
                                            <tr>
                                                <td>${o.uID}</td>
                                                <td>${o.user}</td>
                                                <td>${o.isSell}</td>
                                                <td>${o.isAdmin}</td>
                                                <td>${o.email}</td>
                                                <td>
                                                    <a href="deleteaccount?id=${o.uID}"><button type="button" class="btn btn-danger"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button></a>
                                                </td>
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
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Thêm tài khoản</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">	
                            <p>Tên đăng nhập <input name="user" type="text" class="form-control" required>
                            <p>Mật khẩu<input name="pass" type="password" class="form-control" required>
                            <div class="form-check">
                                <input name="isSell" value="1" type="checkbox" class="form-check-input" id="isSell">
                                <label class="form-check-label" for="isSell">Là User
                            </div>
                            <div class="form-check">
                                <input name="isAdmin" value="1" type="checkbox" class="form-check-input" id="isAdmin">
                                <label class="form-check-label" for="isAdmin">Là Admin
                            </div>
                            <p>Email<input name="email" type="text" class="form-control" required>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
    </body>
</html>