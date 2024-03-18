<%-- 
    Document   : index
    Created on : Mar 10, 2024, 9:46:06 PM
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
<html lang="en-US" dir="ltr">
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
            .sale-link:hover{
                color: white;
                transition: color 0.3s ease;
            }

            .usermenu{
                display:none;
            }

            .userbutton:hover .usermenu{
                display:block;
            }
        </style>
    </head>
    <body>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->
        <main class="main" id="top">
            <jsp:include page="navbar.jsp"></jsp:include>
                <section class="py-5 overflow-hidden bg-primary" id="home">
                    <div class="container">
                        <div class="row flex-center">
                            <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0"><a class="img-landing-banner" href="catalogue"><img class="img-fluid" src="public/assets/img/gallery/hero-header.png" alt="hero-header" /></a></div>
                            <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
                                <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">Are you starving?</h1>
                                <h1 class="text-800 mb-5 fs-4">Within a few clicks, find meals that<br class="d-none d-xxl-block" />are accessible near you</h1>
                                <div class="card w-xxl-75">
                                    <div class="card-body">
                                        <div class="tab-content mt-3" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                                <form class="row gx-2 gy-2 align-items-center" action="index.jsp" method="post">
                                                    <div class="col">
                                                        <div class="input-group-icon"><i class="fas fa-map-marker-alt text-danger input-box-icon"></i>
                                                            <label class="visually-hidden" for="inputDelivery">Address</label>
                                                            <input class="form-control input-box form-foodwagon-control" id="inputDelivery" name="inputDelivery" type="text" placeholder="Enter Your City" />
                                                        </div>
                                                    </div>
                                                    <div class="d-grid gap-3 col-sm-auto">
                                                        <button class="btn btn-danger" type="submit">Find Food</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <!-- ============================================-->
                <!-- <section> begin ============================-->
                <section class="py-0">
                    <div class="container">
                        <div class="row h-100 gx-2 mt-7">
                        <%for(Food x:topSale){%>
                        <div class="col-sm-6 col-lg-3 mb-3 mb-md-0 h-100 pb-4">
                            <div class="card card-span h-100">
                                <div class="position-relative"> <img class="img-fluid rounded-3 w-100" src="<%=fd.verifyImagePath(x.getId())%>" alt="..." />
                                    <div class="card-actions">
                                        <div class="badge badge-foodwagon bg-primary p-4">
                                            <div class="d-flex flex-between-center">
                                                <div class="text-white fs-7"><%=x.getSale()%></div>
                                                <div class="d-block text-white fs-2">% <br/>
                                                    <div class="fw-normal fs-1 mt-2">Off</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body px-0">
                                    <h5 class="fw-bold text-1000 text-truncate sale-link"><%=x.getName()%></h5>
                                </div>
                                <a class="stretched-link" href="viewitem?viewid=<%=x.getId()%>"></a>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="py-0 bg-primary-gradient">
                <div class="container">
                    <div class="row justify-content-center g-0">
                        <div class="col-xl-9">
                            <div class="col-lg-6 text-center mx-auto mb-3 mb-md-5 mt-4">
                                <h5 class="fw-bold text-danger fs-3 fs-lg-5 lh-sm my-6">How it works</h5>
                            </div>
                            <div class="row">
                                <div class="col-sm-6 col-md-3 mb-6">
                                    <div class="text-center"><img class="shadow-icon" src="public/assets/img/gallery/location.png" height="112" alt="..." />
                                        <h5 class="mt-4 fw-bold">Select location</h5>
                                        <p class="mb-md-0">Choose the location where your food will be delivered.</p>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 mb-6">
                                    <div class="text-center"><img class="shadow-icon" src="public/assets/img/gallery/order.png" height="112" alt="..." />
                                        <h5 class="mt-4 fw-bold">Choose order</h5>
                                        <p class="mb-md-0">Check over hundreds of menus to pick your favorite food</p>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 mb-6">
                                    <div class="text-center"><img class="shadow-icon" src="public/assets/img/gallery/pay.png" height="112" alt="..." />
                                        <h5 class="mt-4 fw-bold">Pay advanced</h5>
                                        <p class="mb-md-0">It's quick, safe, and simple. Select several methods of payment</p>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-md-3 mb-6">
                                    <div class="text-center"><img class="shadow-icon" src="public/assets/img/gallery/meals.png" height="112" alt="..." />
                                        <h5 class="mt-4 fw-bold">Enjoy meals</h5>
                                        <p class="mb-md-0">Food is made and delivered directly to your home.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <%if(popular.size()!=0){%>
            <section class="py-4 overflow-hidden">
                <div class="container">
                    <div class="row h-100">
                        <div class="col-lg-7 mx-auto text-center mt-7 mb-5">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm">Popular items</h5>
                        </div>
                        <div class="col-12">
                            <div id="popular-items" class="carousel slide">
                                <div class="carousel-inner">
                                    <% for (int i = 0; i < popular.size(); i++) {
                                    if (i % 4 == 0) { %>
                                    <div class="carousel-item <%= i == 0 ? "active" : "" %>" data-bs-interval="10000">
                                        <div class="row gx-3 h-100 align-items-center">
                                            <% } %>
                                            <%int emptyColumns = 0;
                                                if(i==popular.size()-1){emptyColumns = ((i + 1) % 4 == 0 ? 0 : 4 - ((i + 1) % 4));}%>
                                            <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                                                <div class="card card-span h-100 rounded-3">
                                                    <img class="img-fluid rounded-3 h-100" src="<%=fd.verifyImagePath(popular.get(i).getId())%>" alt="..." />
                                                    <div class="card-body ps-0">
                                                        <h5 class="fw-bold text-1000 text-truncate mb-1"><%= popular.get(i).getName() %></h5>
                                                        <div><span class="text-warning me-2"><i class="fas fa-map-marker-alt"></i></span></div>
                                                        <span class="text-1000 fw-bold">$<%= String.format("%.2f", popular.get(i).getPrice()) %></span>
                                                    </div>
                                                </div>
                                                <div class="d-grid gap-2"><a class="btn btn-lg btn-danger" href="#!" role="button">Order now</a></div>
                                            </div>
                                            <%for (int j = 0; j < emptyColumns; j++) { %>
                                            <div class="col-sm-6 col-md-4 col-xl mb-5 h-100"></div>
                                            <% }
                                            if (i % 4 == 3 || i == popular.size() - 1) { %>
                                        </div>
                                    </div>
                                    <% }
                                    } %>
                                </div>
                                <% if (popular.size() > 4) { %>
                                <button class="carousel-control-prev carousel-icon" type="button" data-bs-target="#popular-items" data-bs-slide="prev"><span class="carousel-control-prev-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Previous</span></button>
                                <button class="carousel-control-next carousel-icon" type="button" data-bs-target="#popular-items" data-bs-slide="next"><span class="carousel-control-next-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Next </span></button>
                                        <% } %>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <%}%>
            <!-- <section> close ============================-->
            <!-- ============================================-->


            <section id="testimonial">
                <div class="container">
                    <div class="row h-100">
                        <div class="col-lg-7 mx-auto text-center mb-6">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm mb-3">Featured Restaurants</h5>
                        </div>
                    </div>
                    <div class="row gx-2">
                        <%for(Restaurant x:featured){%>
                        <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
                            <div class="card card-span h-100 text-white rounded-3"><img class="img-fluid rounded-3 h-100" src="public/assets/img/gallery/food-world.png" alt="..." />
                                <div class="card-img-overlay ps-0"><span class="badge bg-danger p-2 ms-3"><i class="fas fa-tag me-2 fs-0"></i><span class="fs-0"><%=x.getSale()%>% off</span></span></div>
                                <div class="card-body ps-0">
                                    <div class="d-flex align-items-center mb-3"><img class="img-fluid" src="public/assets/img/gallery/food-world-logo.png" alt="" />
                                        <div class="flex-1 ms-3">
                                            <h5 class="mb-0 fw-bold text-1000"><%=x.getName()%></h5><span class="text-primary fs--1 me-1"><i class="fas fa-star"></i></span><span class="mb-0 text-primary"><%=x.getRating()%></span>
                                        </div>
                                        <%boolean open = (x.getOpen().compareTo(LocalTime.now()) < 0 && x.getClose().compareTo(LocalTime.now()) > 0);%>
                                    </div><span class="badge <%=open ? "bg-soft-success":"bg-soft-danger"%> p-2"><span class="fw-bold fs-1 <%=open ? "text-success":"text-danger"%>"><%=open ? "Open Now":"Closed"%></span></span>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <div class="col-12 d-flex justify-content-center mt-5"> <a class="btn btn-lg btn-primary" href="catalogue">View All <i class="fas fa-chevron-right ms-2"> </i></a></div>
                    </div>
                </div>
            </section>


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="py-8 overflow-hidden">
                <div class="container">
                    <div class="row flex-center mb-6">
                        <div class="col-lg-7">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm text-center text-lg-start">Search by Food</h5>
                        </div>
                        <div class="col-lg-4 text-lg-end text-center"><a class="btn btn-lg text-800 me-2" href="catalogue" role="button">VIEW ALL <i class="fas fa-chevron-right ms-2"></i></a></div>
                        <div class="col-lg-auto position-relative">
                            <button class="carousel-control-prev s-icon-prev carousel-icon" type="button" data-bs-target="#carouselSearchByFood" data-bs-slide="prev"><span class="carousel-control-prev-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Previous</span></button>
                            <button class="carousel-control-next s-icon-next carousel-icon" type="button" data-bs-target="#carouselSearchByFood" data-bs-slide="next"><span class="carousel-control-next-icon hover-top-shadow" aria-hidden="true"></span><span class="visually-hidden">Next</span></button>
                        </div>
                    </div>
                    <div class="row flex-center">
                        <div class="col-12">
                            <div class="carousel slide" id="carouselSearchByFood" data-bs-touch="false" data-bs-interval="false">
                                <div class="carousel-inner">
                                    <% for (int i = 0; i < allFood.size(); i++) {
                                    if (i % 6 == 0) { %>
                                    <div class="carousel-item <%= i == 0 ? "active" : "" %>" data-bs-interval="10000">
                                        <div class="row gx-3 h-100 align-items-center justify-content-start">
                                            <% }
                                                Food x = allFood.get(i);
                                                int emptyColumns = 0;
                                                if(i==allFood.size()-1){emptyColumns = ((i + 1) % 6 == 0 ? 0 : 6 - ((i + 1) % 6));}
                                            %>
                                            <div class="col-sm-6 col-md-4 col-xl mb-5 h-100">
                                                <div class="card card-span h-100 rounded-circle">
                                                    <img class="img-fluid rounded-circle h-100" src="<%=fd.verifyImagePath(x.getId())%>" alt="..." />
                                                    <div class="card-body ps-0">
                                                        <h5 class="text-center fw-bold text-1000 text-truncate mb-2"><%=x.getName()%></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <%for (int j = 0; j < emptyColumns; j++) { %>
                                            <div class="col-sm-6 col-md-4 col-xl mb-5 h-100"></div>
                                            <% }
                                            if (i % 6 == 5 || i == allFood.size() - 1) { %>
                                        </div>
                                    </div>
                                    <% }
                                    } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->


            <section>
                <div class="bg-holder" style="background-image:url(assets/img/gallery/cta-one-bg.png);background-position:center;background-size:cover;">
                </div>
                <!--/.bg-holder-->
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xxl-10">
                            <div class="card card-span shadow-warning" style="border-radius: 35px;">
                                <div class="card-body py-5">
                                    <div class="row justify-content-evenly">
                                        <div class="col-md-3">
                                            <div class="d-flex d-md-block d-xl-flex justify-content-evenly justify-content-lg-between"><img src="public/assets/img/icons/discounts.png" width="100" alt="..." />
                                                <div class="d-flex d-lg-block d-xl-flex flex-center">
                                                    <h2 class="fw-bolder text-1000 mb-0 text-gradient">Daily<br class="d-none d-md-block" />Discounts </h2>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 hr-vertical">
                                            <div class="d-flex d-md-block d-xl-flex justify-content-evenly justify-content-lg-between"><img src="public/assets/img/icons/live-tracking.png" width="100" alt="..." />
                                                <div class="d-flex d-lg-block d-xl-flex flex-center">
                                                    <h2 class="fw-bolder text-1000 mb-0 text-gradient">Live Tracking</h2>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 hr-vertical">
                                            <div class="d-flex d-md-block d-xl-flex justify-content-evenly justify-content-lg-between"><img src="public/assets/img/icons/quick-delivery.png" width="100" alt="..." />
                                                <div class="d-flex d-lg-block d-xl-flex flex-center">
                                                    <h2 class="fw-bolder text-1000 mb-0 text-gradient">Quick Delivery </h2>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row flex-center mt-md-8">
                        <div class="col-lg-5 d-none d-lg-block" style="margin-bottom: -122px;"> <img class="w-100" src="public/assets/img/gallery/phone-cta-one.png" alt="..." /></div>
                        <div class="col-lg-5 mt-7 mt-md-0">
                            <h1 class="text-primary">Install the app</h1>
                            <p>It's never been easier to order food. Look for the finest <br class="d-none d-xl-block" />discounts and you'll be lost in a world of delectable food.</p><a class="pe-2" href="https://www.apple.com/app-store/" target="_blank"><img src="assets/img/gallery/app-store.svg" width="160" alt="" /></a><a href="https://play.google.com/store/apps" target="_blank"><img src="assets/img/gallery/google-play.svg" width="160" alt="" /></a>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="pb-5 pt-8">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-span mb-3 shadow-lg">
                                <div class="card-body py-0">
                                    <div class="row justify-content-center">
                                        <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="public/assets/img/gallery/crispy-sandwiches.png" alt="..." /></div>
                                        <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                                            <h1 class="card-title mt-xl-5 mb-4">Best deals <span class="text-primary"> Crispy Sandwiches</span></h1>
                                            <p class="fs-1">Enjoy the large size of sandwiches. Complete your meal with the perfect slice of sandwiches.</p>
                                            <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="catalogue">PROCEED TO ORDER<i class="fas fa-chevron-right ms-2"></i></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="py-0">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-span mb-3 shadow-lg">
                                <div class="card-body py-0">
                                    <div class="row justify-content-center">
                                        <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-md-0"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-start rounded-md-top-0" src="public/assets/img/gallery/fried-chicken.png" alt="..." /></div>
                                        <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                                            <h1 class="card-title mt-xl-5 mb-4">Celebrate parties with <span class="text-primary">Fried Chicken</span></h1>
                                            <p class="fs-1">Get the best fried chicken smeared with a lip smacking lemon chili flavor. Check out best deals for fried chicken.</p>
                                            <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="catalogue">PROCEED TO ORDER<i class="fas fa-chevron-right ms-2"></i></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="pt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-span mb-3 shadow-lg">
                                <div class="card-body py-0">
                                    <div class="row justify-content-center">
                                        <div class="col-md-5 col-xl-7 col-xxl-8 g-0 order-0 order-md-1"><img class="img-fluid w-100 fit-cover h-100 rounded-top rounded-md-end rounded-md-top-0" src="public/assets/img/gallery/pizza.png" alt="..." /></div>
                                        <div class="col-md-7 col-xl-5 col-xxl-4 p-4 p-lg-5">
                                            <h1 class="card-title mt-xl-5 mb-4">Wanna eat hot & <span class="text-primary">spicy Pizza?</span></h1>
                                            <p class="fs-1">Pair up with a friend and enjoy the hot and crispy pizza pops. Try it with the best deals.</p>
                                            <div class="d-grid bottom-0"><a class="btn btn-lg btn-primary mt-xl-6" href="catalogue">PROCEED TO ORDER<i class="fas fa-chevron-right ms-2"></i></a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->


            <section class="py-0">
                <div class="bg-holder" style="background-image:url(public/assets/img/gallery/cta-two-bg.png);background-position:center;background-size:cover;">
                </div>
                <!--/.bg-holder-->
                <div class="container">
                    <div class="row flex-center">
                        <div class="col-xxl-9 py-7 text-center">
                            <h1 class="fw-bold mb-4 text-white fs-6">Are you ready to order <br />with the best deals? </h1><a class="btn btn-danger" href="catalogue"> PROCEED TO ORDER<i class="fas fa-chevron-right ms-2"></i></a>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- <section> close ============================-->
            <!-- ============================================-->


        </main>
        <!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->




        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <jsp:include page="javascript.jsp"></jsp:include>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
