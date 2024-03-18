<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <nav class="sidebar" style="width: 20vw"> 
            <div class="list-group list-group-flush">
                <button style="border:none;margin:1em 1em;" class="btn btn-secondary" type="button" aria-expanded="false">
                    <a href="dashboard" style="color:white;">
                        Dashboard
                    </a>
                </button>
                <button style="border:none;margin:1em 1em;" class="btn btn-secondary" type="button" aria-expanded="false">
                    <a href="foods" style="color:white;">
                        Foods
                    </a>
                <button style="border:none;margin:1em 1em;" class="btn btn-secondary" type="button" aria-expanded="false">
                    <a href="accounts" style="color:white;">
                        Accounts
                    </a>
                </button>
                <button style="border:none;margin:1em 1em;" class="btn btn-secondary" type="button" aria-expanded="false">
                    <a href="history" style="color:white;">
                        Orders History
                    </a>
                </button>
                        <button style="border:none;margin:1em 1em;" class="btn btn-secondary" type="button" aria-expanded="false">
                    <a href="../index.jsp" style="color:white;">
                        Back To Main Page
                    </a>
                </button>
            </div>
        </nav>
    </body>
</html>
