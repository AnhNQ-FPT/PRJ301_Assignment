<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<c:if test="${empty sessionScope.loggedUser || !sessionScope.loggedUser.admin}">
    <c:redirect url="../denied" />
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">

        <link rel="apple-touch-icon" sizes="180x180" href="../public/assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../public/assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../public/assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="../public/assets/img/favicons/favicon.ico">
        <link rel="manifest" href="../public/assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="../public/assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">

        <link href="../public/assets/css/theme.css" rel="stylesheet"/>

        <style>
            @media (min-width: 991.98px) {
                main {
                    padding-left: 20vw;
                }
            }

            .sidebar {
                position: fixed;
                transform: translate(0,25%);
                padding: 20px 20px;
                box-shadow: 0 0px 5px 0 rgb(0 0 0 / 10%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                /*width: 240px;*/
                /*z-index: 600;*/
            }
        </style>
    </head>
    <body>
        <div id="editEmployeeModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateaccount" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update User Information</h4>
                            <button type="button" class="close" onclick="window.history.back()">&times;</button>
                        </div>

                        <div class="modal-body">
                            <%UserDAO ud = new UserDAO();
                            int aid = Integer.parseInt(request.getParameter("aid"));
                                User u = ud.getUser(aid);%>
                            <input value="<%=u.getId()%>" name="uaid" type="hidden" class="form-control">
                            Name<input value="<%=u.getName()%>" name="uaname" type="text" class="form-control" required>
                            Password<input value="<%=u.getPassword()%>" name="uapass" type="text" class="form-control">
                            Email<input value="<%=u.getEmail()%>" name="uaemail" type="text" class="form-control">
                            Balance<input value="<%=u.getBalance()%>" name="uabal" type="text" class="form-control">
                            Role
                                <select name="uarole" class="form-select">
                                    <%boolean currentRole = u.isAdmin();%>
                                        <option value="1" <%=currentRole ? "selected":""%>>Admin</option>
                                        <option value="0" <%=currentRole ? "":"selected"%>>Customer</option>
                                </select>
                        </div>

                        <div class="modal-footer">
                            <input type="submit" class="btn btn-success" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>