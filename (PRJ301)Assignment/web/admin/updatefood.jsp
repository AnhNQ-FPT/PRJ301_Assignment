<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
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
                    <form action="updatefood" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Update Food Information</h4>
                            <button type="button" class="close" onclick="window.history.back()">&times;</button>
                        </div>

                        <div class="modal-body">
                            <%FoodDAO fd = new FoodDAO();
                            int fid = Integer.parseInt(request.getParameter("fid"));
                                Food f = fd.getFood(fid);%>
                            <input value="<%=f.getId()%>" name="ufid" type="hidden" class="form-control">
                            Name<input value="<%=f.getName()%>" name="ufname" type="text" class="form-control" required>
                            Image Path<input value="<%=fd.getImagePath(f.getId())%>" name="ufimage" type="text" class="form-control">
                            Cost<input value="<%=f.getCost()%>" name="ufcost" type="text" class="form-control">
                            Price<input value="<%=f.getPrice()%>" name="ufprice" type="text" class="form-control">
                            Sale<input value="<%=f.getSale()%>" name="ufsale" type="text" class="form-control">
                            Sold<input value="<%=f.getSold()%>" name="ufsold" type="text" class="form-control">
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