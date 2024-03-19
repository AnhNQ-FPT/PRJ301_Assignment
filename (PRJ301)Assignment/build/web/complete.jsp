<%-- 
    Document   : complete
    Created on : Mar 19, 2024, 3:50:05 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:include page="navbar.jsp"></jsp:include>
            <section class="py-5 overflow-hidden bg-primary" id="home">
                <div class="container">
                    <div class="row flex-center">
                        <div class="col-md-5 col-lg-6 order-0 order-md-1 mt-8 mt-md-0 img-landing-banner" id="display-only"><img class="img-fluid" src="public/assets/img/gallery/hero-header.png" alt="hero-header" /></div>
                        <div class="col-md-7 col-lg-6 py-8 text-md-start text-center">
                            <h1 class="display-1 fs-md-5 fs-lg-6 fs-xl-8 text-light">Order placed</h1>
                            <h1 class="text-800 mb-5 fs-4"><a class="text-danger" href="index.jsp">Return home </a><br class="d-xxl-none d-block"/>or <br class="d-xxl-none d-block" /><a class="text-danger" href="catalogue">keep browsing</a></h1>

                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="javascript.jsp"></jsp:include>

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">
    </body>
</html>
