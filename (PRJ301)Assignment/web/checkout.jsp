<%-- 
    Document   : checkout
    Created on : Mar 19, 2024, 11:28:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<c:if test="${empty sessionScope.loggedUser}">
    <c:redirect url="/denied" />
</c:if>
<!DOCTYPE html>
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
        <jsp:include page="navbar.jsp"></jsp:include>
            <section class="py-0 pt-6 h-100">
                <div class="bg-holder h-100" style="background-image:url(public/assets/img/gallery/cta-two-bg.png);background-position:center;background-size:cover;">
                </div>
                <!--/.bg-holder-->
                <div class="container h-100 text-center">
                    <div class="row flex-center">
                        <div class="col-xxl-9 py-7">
                            <h1 class="fw-bold mb-4 text-white fs-6">Checkout</h1>
                        </div>
                    </div>
                </div>
            </section>
            <section class="pt-8 overflow-hidden">
                <div class="container">
                    <form action="checkout" method="post">
                        <div class="row flex-center">
                            <div class="col-lg-3 col-sm-12" style="border: #999999 solid;border-radius: 5px">
                                <h1 class="fw-bold m-1 text-dark fs-xl-6 fs-sm-3">Total: $<f:formatNumber pattern="#.##" value="${sessionScope.totalcart}"/></h1>
                            <h2 class="m-1 fw-normal text-dark fs-xl-2 fs-sm--1">Account balance: $<f:formatNumber pattern="#.##" value="${sessionScope.loggedUser.balance}"/></h2>
                        </div>
                        <div class="col-lg-9 col-sm-12 ">
                            <!--                        <table class="align-top">
                                                        <tr>-->
                            <!--<td>-->
                            <input name="coaddress" class="form-control input-box form-foodwagon-control w-100" type="text" value="${sessionScope.delivery}" placeholder="Address"/>
                            <!--</td>-->
                            <!--</tr>-->
                            <!--</table>-->
                        </div>
                    </div>
                    <div class="row flex-center">
                        <div class="col-lg-6 col-sm-12"></div>
                        <div class="col-lg-6 col-sm-12 text-sm-center text-lg-start">
                            <button type="submit" class="btn btn-primary btn-lg"><i class="fas fa-user-plus"></i> CHECK OUT </button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
        
        <jsp:include page="javascript.jsp"></jsp:include>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
