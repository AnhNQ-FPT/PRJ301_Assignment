<%-- 
    Document   : viewcart
    Created on : Mar 19, 2024, 2:09:41 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%@page import="java.math.*"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<c:if test="${empty sessionScope.loggedUser}">
    <c:redirect url="/denied" />
</c:if>
<!DOCTYPE html>
<%

        int userid = ((User) session.getAttribute("loggedUser")).getId();
        
        FoodDAO fd = new FoodDAO();
        List<Food> list = fd.getFoods();
        Cookie[] arr = request.getCookies();
        String cartinfo = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cartinfo" + userid)) {
                    cartinfo += o.getValue();
                }
            }
        }
        
        Order o = new Order(cartinfo, list);
        List<OrderedFood> items = o.getList();
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
                            <h1 class="fw-bold mb-4 text-white fs-6">Your Cart</h1>
                        </div>
                    </div>
                </div>
            </section>
            <section class="pt-8 overflow-hidden">
                <div class="container">
                    <div class="row flex-center">
                        <div class="col-12 fs-xs--2 fs-sm--1 fs-md-0 fs-xl-1 text-center">
                            <table class="table table-bordered table-striped table-primary table-responsive shadow-transition" style="width: 100%;table-layout: fixed;vertical-align: middle">
                                <colgroup>
                                    <col style="width:10%">
                                    <col style="width:40%">
                                    <col style="width:20%;">
                                    <col style="width:10%">
                                    <col style="width:10%">                                    
                                    <col style="width:10%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>Number</th>
                                        <th>Item</th>
                                        <th>Quantity</th>
                                        <th>Subtotal</th>
                                        <th>Sale</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                            <%double total=0;
                            for(int i=0;i<items.size();i++){%>
                            <tr>
                                <td><%=i+1%></td>
                                <td style="text-align: left">
                                    <div>
                                        <img class="mr-5" src="<%=fd.verifyImagePath(items.get(i).getId())%>" style="width: 20%; height: auto;margin: 2% 5%">
                                        <span class="ml-5"><%=items.get(i).getName()%></span>
                                    </div>
                                </td>
                                <td>
                                    <%String var1 = "quantityInput" + items.get(i).getId();%>
                                    <button type="button" onclick="decreaseQuantity('<%=var1%>','<%=items.get(i).getId()%>')" style="margin-right: 1%;">-</button>
<input type="text" id="<%= var1 %>" name="<%= var1 %>" value="<%= items.get(i).getQuantity() %>" style="width: 20%;text-align: center" onkeypress="handleKeyPress('<%= var1 %>',<%= items.get(i).getQuantity() %>,'<%= items.get(i).getId() %>',event)">                                    
                                    <button type="button" onclick="increaseQuantity('<%=var1%>','<%=items.get(i).getId()%>')" style="margin-left: 1%;">+</button>
                                </td>
                                <td>
                                    <%BigDecimal bd = new BigDecimal(items.get(i).getPrice()*items.get(i).getQuantity());
                                    BigDecimal rounded = bd.setScale(2, RoundingMode.HALF_EVEN);
                                    double subtotal = rounded.doubleValue();%>
                                    $<%=subtotal%></td>
                                <td><%=items.get(i).getSale()%>%</td>
                                <td>
                                    <%bd = new BigDecimal(subtotal*items.get(i).getSale()/100);
                                    rounded = bd.setScale(2, RoundingMode.HALF_EVEN);
                                    double finalprice = rounded.doubleValue();%>
                                    <%=finalprice%>
                                </td>
                            </tr>
                            <%total += finalprice;
                                }
                            BigDecimal bd = new BigDecimal(total);
                            BigDecimal rounded = bd.setScale(2, RoundingMode.HALF_EVEN);
                            total = rounded.doubleValue();
                            session.setAttribute("totalcart",total);%>
                        </table>
                        <div class="row">
                        <div class="col-lg-6 col-sm-12" style="align-items: start">
                            <h5 class="fw-bold fs-3 fs-lg-5 lh-sm text-sm-center text-lg-start">Total: $<%=total%></h5>
                        </div>
                        <div class="col-lg-6 col-sm-12 text-sm-center text-lg-end">
                            <a href="checkout">
                            <button class="btn btn-primary btn-lg"><i class="fas fa-user-plus"></i> CHECK OUT </button>
                            </a>
                        </div>
                        </div>
                    </div>
                </div>
            </div><!-- end of .container-->
        </section>
        <jsp:include page="footer.jsp"></jsp:include><jsp:include page="javascript.jsp"></jsp:include>
        <script>
            function increaseQuantity(id, chid) {
    var input = document.getElementById(id);
    var quantity = parseInt(input.value);
    var url = "changequantity?chid=" + chid + "&quant=" + quantity + "&change=1";
    window.location.href = url;
}


            function decreaseQuantity(id, chid) {
    var input = document.getElementById(id);
    var quantity = parseInt(input.value);
    var url = "changequantity?chid=" + chid + "&quant=" + quantity + "&change=-1";
    window.location.href = url;
}
        </script>
<script>
function handleKeyPress(id,quant,chid,event) {
    if (event.keyCode === 13) { // Check if the Enter key is pressed
        var enteredValue = document.getElementById(id).value;
        var currentValue = quant;
        var change = parseInt(enteredValue) - currentValue;
        var url = "changequantity?chid=" + chid + "&change=" + change;
        window.location.href = url;
    }
}
</script>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400;600;700;900&amp;display=swap" rel="stylesheet">

    </body>
</html>
