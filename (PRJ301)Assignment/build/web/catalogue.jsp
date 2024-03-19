<%-- 
    Document   : catalogue
    Created on : Mar 15, 2024, 4:51:55 PM
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
    List<Restaurant> allRest = rd.getRestaurants();
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

            #display-only:hover,
            #display-only:focus {
                -webkit-transform: translateY(-3rem);
  -ms-transform: translateY(-3rem);
                transform: translateY(-3rem);
            }

            #display-only:hover:after,
            #display-only:focus:after {
                opacity: 1; /* or whatever value you want */
            }
        </style>
    </head>
    <body>
        <main class="main" id="top">
            <jsp:include page="navbar.jsp"></jsp:include>

                <section class="py-5 overflow-hidden bg-primary" id="home">
                    <div class="container">
                        <div class="row flex-center">
                            <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0 img-landing-banner" id="display-only"><img class="img-fluid" src="public/assets/img/gallery/hero-header.png" alt="hero-header" /></div>
                            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
                                <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">Catalogue</h1>
                                <h1 class="text-800 mb-5 fs-4">Enjoy our top meals <br class="d-xxl-none d-block" />made with love</h1>

                            </div>
                        </div>
                    </div>
                </section>

                <section class="py-0">
                    <div class="container">
                        <div class="row h-100 gx-2 mt-7" id="foodSection">
                            <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-dark">All Food</h1>
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
                        <button type="button" class="btn btn-primary mt-3 expand-button">Expand</button>
                    </div>


<!--                    <div class="row h-100 gx-2 mt-7">
                        <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-dark">Restaurants</h1>
                        <%counter = 0;
                        for(Restaurant x:allRest){%>
                        <div class="food-item col-sm-2 col-lg-2 mb-3 mb-md-0 h-100 pb-2 <% if(counter >= 6) { %>d-none<% } %>">
                            <div class="card card-span h-100">
                                <div class="position-relative"> <img class="img-fluid rounded-3 w-100" src="public/assets/img/gallery/food-world.png" alt="..." />
                                </div>
                                <div class="card-body px-0">
                                    <h5 class="fw-bold text-1000 text-truncate sale-link"><%=x.getName()%></h5>
                                </div>
                                <a class="stretched-link" href="#"></a>
                            </div>
                        </div>
                        <%counter++;
                            }%>
                        <button type="button" class="btn btn-primary mt-3 expand-button">Expand</button>
                    </div>-->
                </div><!-- end of .container-->
            </section>

            <section class="pt-5"></section>

            <jsp:include page="footer.jsp"></jsp:include>

            </main>

        <jsp:include page="javascript.jsp"></jsp:include>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const expandButtons = document.querySelectorAll('.expand-button');

                expandButtons.forEach(button => {
                    button.dataset.expanded = 'true';

                    button.addEventListener('click', function () {
                        const section = this.closest('.row.h-100.gx-2.mt-7');
                        const items = section.querySelectorAll('.food-item');
                        let expanded = this.dataset.expanded === 'true';

                        items.forEach((item, index) => {
                            if (expanded) {
                                item.classList.remove('d-none');
                                this.textContent = 'Collapse';
                            } else {
                                if (index >= 6) {
                                    item.classList.add('d-none');
                                }
                                this.textContent = 'Expand';
                            }
                        });
                        this.dataset.expanded = expanded ? 'false' : 'true';
                    });
                });
            });
        </script>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
