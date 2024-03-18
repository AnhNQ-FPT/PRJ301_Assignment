<%-- 
    Document   : login
    Created on : Mar 13, 2024, 7:58:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>

        <link href="public/assets/css/theme.css" rel="stylesheet" />
        <link rel="apple-touch-icon" sizes="180x180" href="public/assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="public/assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="public/assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="public/assets/img/favicons/favicon.ico">
        <link rel="manifest" href="public/assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="public/assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <style>
            /* Overall container */
            .container-wrapper {
                width: 60%;
                margin: 10% auto; /* Center horizontally */
                padding: 20px; /* Add some padding */
                position: relative; /* Enable relative positioning */
            }


            /* Login/Signup form */
            .form-signin {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 15px;
            }

            /* Text alignment */
            .form-check-label {
                float: left; /* Align "SAVE" checkbox left */
            }

            .forgot-password {
                float: right; /* Align "Forget password ?" right */
            }

            /* Button alignment */
            .login-register-buttons {
                text-align: center; /* Center "LOG IN" and "REGISTER" buttons */
            }

            /* "Return" button alignment */
            .return-button {
                text-align: center;
                margin-top: 20px;
            }

            .btn-return {
                color: #FFFEFE;
                background-color: #385a18;
                border-color: #385a18;
            }

            .btn-return:hover {
                color: #FFFEFE;
                background-color: #2e4215;
                border-color: #2a3913;
            }

            .btn-check:focus + .btn-return, .btn-return:focus {
                color: #FFFEFE;
                background-color: #2e4215;
                border-color: #2a3913;
                -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.5);
                box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.5);
            }

            .btn-check:checked + .btn-return,
            .btn-check:active + .btn-return, .btn-return:active, .btn-return.active,
            .show > .btn-return.dropdown-toggle {
                color: #FFFEFE;
                background-color: #2a3913;
                border-color: #263211;
            }

            .btn-check:checked + .btn-return:focus,
            .btn-check:active + .btn-return:focus, .btn-return:active:focus, .btn-return.active:focus,
            .show > .btn-return.dropdown-toggle:focus {
                -webkit-box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.5);
                box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.5);
            }

            .btn-return:disabled, .btn-return.disabled {
                color: #FFFEFE;
                background-color: #385a18;
                border-color: #385a18;
            }
            
            .error{
                color: red;
            }

        </style>
    </head>
    <body>
        <div class="container py-3 container-wrapper">
            <div id="logreg-forms">
                <c:if test="${error!=null }">
                    <div class="alert alert-danger" role="alert">${error}</div>
                </c:if>
                <c:if test="${mess!=null }">
                    <div class="alert alert-success" role="alert">${mess}</div>
                </c:if>
                <form class="form-signin" action="login" method="post">
                    <h3 style="text-align: center"> LOG IN </h3>  
                    <c:set var="cookie" value="${pageContext.request.cookies}"/>
                    <p><input name="email" value="${cookie.ce.value}" type="text" class="form-control" placeholder="Email">
                    <p><input name="pass" value="${cookie.cp.value}" type="password" class="form-control" placeholder="Password">
                    <div class="form-group form-check">
                        <input name="remember" value="1" type="checkbox" class="form-check-input form-check-label" id="check" ${cookie.cr!=null ? "checked":""}>
                        <label for="check"> SAVE </label>

                        <a class="forgot-password" href="forgotpassword">Forgot password?</a>
                    </div>
                    <div class="login-register-buttons">
                        <button class="btn btn-success btn-sm btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>LOG IN</button>
                        <hr>
                        <a href="#signUp"  data-toggle="modal">
                            <button class="btn btn-primary btn-sm btn-block"><i class="fas fa-user-plus"></i> REGISTER </button>
                        </a>
                        <p style="color:red">${requestScope.regerror}</p>
                        <p style="color:green">${requestScope.regsuccess}</p>
                    </div>
                </form>
            </div>
            <div id="signUp" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content small-modal">
                        <form action="register" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">NEW ACCOUNT</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">	
                                <p>Username <input name="newname" type="text" class="form-control" required value="${param.newname}">
                                <p>Password<input name="newpass" type="password" class="form-control" required value="${param.newpass}">
                                <p>Re-enter password <input name="repass" type="password" class="form-control" required value="${param.repass}">
                                <p>Email<input name="newemail" type="text" class="form-control" required value="${param.newemail}">
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-danger" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" value="Register">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="container" style="display:flex;justify-content:center">
                <button class="btn btn-return btn-sm btn-block return-button"><i class="fas fa-user-plus"></i><a style="color:white" href="index.jsp"> RETURN </a></button>
            </div>
        </div>
    </body>
</html>
