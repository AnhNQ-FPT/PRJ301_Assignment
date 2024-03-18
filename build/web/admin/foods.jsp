<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <header>
            <jsp:include page="leftadmin.jsp"></jsp:include>
            </header>
            <main>
                <div class="container pt-4">
                    <div class="card text-center">
                        <h3 class="card-header">
                            All Food Items<a href="#addProductModal"  data-toggle="modal">&nbsp;<button style="border:none;border-radius:50%;color:green">+</button></a>  
                        </h3>
                    <c:if test="${fSucc!=null }">
                        <div class="alert alert-success" role="alert">
                            ${fSucc}
                        </div>
                    </c:if>
                    <c:if test="${fErr!=null }">
                        <div class="alert alert-danger" role="alert">
                            ${fErr}
                        </div>
                    </c:if>    
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Image</th>
                                            <th>Cost</th>
                                            <th>Price</th>
                                            <th>Sale</th>
                                            <th>Sold</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%FoodDAO fd = new FoodDAO();
                                        List<Food> list = fd.getFoods();
                                        for(Food x:list){%>
                                        <tr>
                                            <td><%=x.getId()%></td>
                                            <td style="white-space: normal;"><%=x.getName()%></td>
                                            <td style="max-width: 150px;">
                                                <img src="<%=fd.getImagePath(x.getId())%>" class="img-fluid" alt="Product Image">
                                            </td>
                                            <td><%=x.getCost()%></td>
                                            <td><%=x.getPrice()%></td>
                                            <td><%=x.getSale()%>%</td>
                                            <td><%=x.getSold()%></td>
                                            <td>
                                                <a href="updatefood?fid=<%=x.getId()%>"><button type="button" class="btn btn-warning">Update</button></a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="deletefood?fid=<%=x.getId()%>"><button type="button" class="btn btn-danger">Delete</button></a>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </main>

        <div id="addProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addfood" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add A New Item</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="border:none;border-radius:50%;color:red">X</button>
                        </div>
                        <div class="modal-body">					
                            <p>Name<input name="fname" type="text" class="form-control" required>
                            <p>Image Path<input name="fimage" type="text" class="form-control" required>
                            <p>Cost<input name="fcost" type="text" class="form-control" required>
                            <p>Price<input name="fprice" type="text" class="form-control" required>
                            <p>Sale<input name="fsale" type="number" class="form-control">
                            <p>Restaurant
                                <select name="frest" class="form-select">
                                    <%RestaurantDAO rd = new RestaurantDAO();
                                    List<Restaurant> rest = rd.getRestaurants();
                                    for(Restaurant x:rest){%>
                                    <option value="<%=x.getId()%>"><%=x.getName()%></option>
                                    <%}%>
                                </select>
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
