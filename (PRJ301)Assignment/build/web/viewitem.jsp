<%-- 
    Document   : viewitem
    Created on : Mar 15, 2024, 9:20:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<%
    FoodDAO fd = new FoodDAO();
    RestaurantDAO rd = new RestaurantDAO();
    OrderDAO od = new OrderDAO();
    OrderedFoodDAO ofd = new OrderedFoodDAO();
    UserDAO ud = new UserDAO();
    CityDAO cd = new CityDAO();
    List<Food> topSale = fd.getFourTopSale();
    List<Food> popular = fd.getPopular();
    List<Food> lessPopular = fd.getLessPopular();
    List<Restaurant> featured = rd.getSixRating();
    List<Food> allFood = fd.getFoods();
    List<City> topCity = cd.getEightTop();
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Foodwagon</title>


        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="public/assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="public/assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="public/assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="public/assets/img/favicons/favicon.ico">
        <link rel="manifest" href="public/assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="public/assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">


        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="public/assets/css/theme.css" rel="stylesheet" />
        <style>
            .usermenu{
                display:none;
            }

            .userbutton:hover .usermenu{
                display:block;
            }
        </style>
    </head>
    <body>
        <main>
            <jsp:include page="navbar.jsp"></jsp:include>
                <section class="py-0">
                    <div class="container">
                        <div class="row h-100 gx-2 mt-7" id="foodSection">
                        <%int id = Integer.parseInt(request.getParameter("viewid"));
                            Food f = fd.getFood(id);%>
                        <div class="row mb-1 mb-md-0 h-100 pb-2">
                            <div class="card card-span h-100 position-relative col-sm-6 col-lg-6">
                                <img class="img-fluid rounded-3 w-100" src="<%= fd.verifyImagePath(f.getId()) %>" alt="..." />
                            </div>
                            <div class="card card-span position-relative col-sm-6 col-lg-6">
                                <h1 class="fw-bold text-1000 text-truncate text-dark fs-md-4 fs-lg-5 fs-xl-7"><%= f.getName() %></h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempor dapibus ante ac rhoncus. Ut nec mi at turpis tristique consectetur sed tincidunt nisi. Nulla convallis urna nec sollicitudin interdum. Etiam convallis felis et nibh maximus, nec aliquet ex pulvinar. Nulla justo arcu, imperdiet non faucibus ac, mollis et erat. Aliquam maximus neque ante, laoreet rhoncus nulla rutrum dapibus. Aenean sed molestie sem. Praesent egestas fringilla pellentesque. Phasellus tristique efficitur ultrices. Vestibulum ut dictum enim.</p>
                                <p>Aliquam aliquam urna ac diam pellentesque, sed vulputate libero rutrum. Praesent aliquam maximus turpis, a aliquet nisi hendrerit et. Phasellus nulla elit, porttitor ac tristique dapibus, dapibus eu quam. Sed ut tempus sapien, ut hendrerit felis. Maecenas lacinia enim vel odio pulvinar viverra. Duis in consectetur dui, vel auctor metus. Maecenas sed mauris vulputate, pretium purus vitae, commodo massa. Curabitur ultrices euismod orci a ornare. Curabitur gravida non nunc non laoreet.</p>
                                <div class="mt-5" style="position: relative; bottom: 0; left: 0;">
                                    <div style="display: flex; align-items: center;">
                                        <button type="button" onclick="decreaseQuantity()" style="margin-right: 5px;">-</button>
                                        <input type="number" id="quantityInput" value="1" style="width: 50px;">
                                        <button type="button" onclick="increaseQuantity()" style="margin-left: 5px;">+</button>
                                        &nbsp;<div class="col-12 d-flex justify-content-left"> <a class="btn btn-lg btn-primary <%=(User) (session.getAttribute("loggedUser"))==null ? "disabled":""%>" href="catalogue">Add To Cart</a></div>

                                    </div>
                                    <c:if test="${sessionScope.loggedUser eq null}">
                                        <div class="text-warning fw-bold fs-md--2 fs-lg--1 fs-xl-1">You must <a class="text-success" href="login">log in</a> first to use this feature.</div>    
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row h-100 gx-2 mt-7" id="browseSection">
                        <h2 class="display-1 fs-md-4 fs-lg-5 fs-xl-7 mb-5 text-dark text-center">View More</h2>
                        <% int counter = 0; %>
                        <% for(Food x : allFood) { %>
                        <div class="food-item col-sm-6 col-lg-2 mb-1 mb-md-0 h-100 pb-2 <% if(counter >= 6) { %>d-none<% } %>">
                            <div class="card card-span h-100">
                                <div class="position-relative">
                                    <img class="img-fluid rounded-3 w-100" src="<%= fd.verifyImagePath(x.getId()) %>" alt="..." />
                                </div>
                                <div class="card-body px-0">
                                    <h5 class="fw-bold text-1000 text-truncate sale-link"><%= x.getName() %></h5>
                                </div>
                                <a class="stretched-link" href="viewitem?viewid=<%=x.getId()%>"></a>
                            </div>
                        </div>
                        <% counter++; %>
                        <% } %>
                        <button type="button" class="btn btn-primary mt-3 expand-button"><a href="catalogue" class="text-light">View All</a></button>
                    </div>
                </div><!-- end of .container-->
            </section>
            <section class="pt-5"></section>
                <jsp:include page="footer.jsp"></jsp:include>
            </main>

        <jsp:include page="javascript.jsp"></jsp:include>
        <script>
            function increaseQuantity() {
                var input = document.getElementById('quantityInput');
                input.value = parseInt(input.value) + 1;
            }

            function decreaseQuantity() {
                var input = document.getElementById('quantityInput');
                if (parseInt(input.value) > 1) {
                    input.value = parseInt(input.value) - 1;
                }
            }

            function addToCart() {
                var quantity = document.getElementById('quantityInput').value;
                // Add your logic to add the item to the cart with the specified quantity
                console.log("Added " + quantity + " items to cart.");
            }
        </script>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
