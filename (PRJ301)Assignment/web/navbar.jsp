<%-- 
    Document   : navbar
    Created on : Mar 13, 2024, 10:57:37 PM
    Author     : ADMIN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.*"%>
<%@page import="dal.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession s = request.getSession();
    String delivery = request.getParameter("inputDelivery");
    if(delivery != null && !delivery.equals((String)s.getAttribute("delivery"))) s.setAttribute("delivery",delivery);
    
    User u = (User) s.getAttribute("loggedUser");
    if(u!=null){
        FoodDAO fd = new FoodDAO();
        List<Food> list = fd.getFoods();
        Cookie[] arr = request.getCookies();
        String cartinfo = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cartinfo" + u.getId())) {
                    cartinfo += o.getValue();
                }
            }
        }
        Order o = new Order(cartinfo, list);
        
        session.setAttribute("cartsize", o.getSize(cartinfo));
        session.setAttribute("totalcart", o.getFinalTotal());
    }
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-navbar-on-scroll="data-navbar-on-scroll">
    <div class="container"><a class="navbar-brand d-inline-flex" href="index.jsp"><img class="d-inline-block" src="public/assets/img/gallery/logo.svg" alt="logo" /><span class="text-1000 fs-3 fw-bold ms-2 text-gradient">foodwaGon</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 my-2 mt-lg-0" id="navbarSupportedContent">
            <div class="mx-auto pt-5 pt-lg-0 d-block d-lg-none d-xl-block">
                <p class="mb-0 fw-bold text-lg-center">Deliver to: <i class="fas fa-map-marker-alt text-warning mx-2"></i>
                    <c:choose>    
                        <c:when test="${sessionScope.delivery eq null}">
                            <span class="fw-normal">Current Location </span>
                        </c:when>
                        <c:otherwise>
                            <span class="fw-normal">${sessionScope.delivery} </span>
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
            <form class="d-flex mt-4 mt-lg-0 ms-lg-auto ms-xl-0">
                <div class="input-group-icon pe-2"><i class="fas fa-search input-box-icon text-primary"></i>
                    <input class="form-control border-0 input-box bg-100" type="search" placeholder="Search Food, Restaurant" aria-label="Search" />
                </div>
            </form>
            <c:choose>
                <c:when test="${sessionScope.loggedUser eq null}">
                    <form action="login">
                        <button class="btn btn-white shadow-warning text-warning" type="submit"> <i class="fas fa-user me-2"></i>Login</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <c:if test="${sessionScope.loggedUser.admin}">
                        <div class="dropdown userbutton">
                            <button style="background-color:chocolate;border:none" class="btn btn-secondary dropdown-toggle" type="button" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Admin Tools
                            </button>
                            <ul class="dropdown-menu usermenu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/admin/dashboard">Admin Dashboard</a></li>
                            </ul>
                        </div>
                        &nbsp;
                    </c:if>
                    <div class="dropdown userbutton">
                        <button style="background-color:orange;border:none" class="btn btn-secondary dropdown-toggle" type="button" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Hello, ${sessionScope.loggedUser.name}
                        </button>
                        <ul class="dropdown-menu usermenu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="topup">Balance: $${sessionScope.loggedUser.balance}</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="viewcart">View Cart (${sessionScope.cartsize})</a></li>
                            <li><a class="dropdown-item" href="history">Orders History</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="<%= request.getContextPath() %>/logout">Logout</a></li>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</nav>
