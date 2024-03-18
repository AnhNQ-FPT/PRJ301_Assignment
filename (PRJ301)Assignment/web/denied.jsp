<%-- 
    Document   : denied
    Created on : Mar 18, 2024, 7:46:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Access Denied</title>


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

            <section class="py-11 overflow-hidden bg-light" id="home">
                <div class="py-5 text-center">
                    <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-dark">Error</h1>
                    <h1 class="display-1 fs-md-1 fs-lg-2 fs-xl-4 text-dark">Access Denied</h1>
                </div>
                <div class="container" style="display:flex;justify-content:center">
                    <button class="btn btn-return btn-sm btn-block return-button btn-success"><i class="fas fa-user-plus"></i><a style="color:white" href="index.jsp"> RETURN </a></button>
                </div>
            </section>

        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="javascript.jsp"></jsp:include>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
