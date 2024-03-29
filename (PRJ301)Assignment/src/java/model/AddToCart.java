/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package model;

import dal.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userid = ((User) session.getAttribute("loggedUser")).getId();
        int atcid = Integer.parseInt(request.getParameter("atcid"));
        int quant = Integer.parseInt(request.getParameter("quant"));
        
        FoodDAO fd = new FoodDAO();
        List<Food> list = fd.getFoods();
        Cookie[] arr = request.getCookies();
        String cartinfo = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cartinfo" + userid)) {
                    cartinfo += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        Order o = new Order(cartinfo, list);

        Food f = fd.getFood(atcid);
        OrderedFood t = new OrderedFood(atcid,f.getName(),f.getPrice(),f.getSale(),f.getSold(),f.getCost(), quant);
        o.addOrderedFood(t);

        List<OrderedFood> foods = o.getList();
        cartinfo = "";
        if (foods.size() > 0) {
            cartinfo = userid + ":" + foods.get(0).getId() + "-" + foods.get(0).getQuantity();
            for (int i = 1; i < foods.size(); i++) {
                cartinfo += "/" + foods.get(i).getId() + "-" + foods.get(i).getQuantity();
            }
        }
        

        Cookie c = new Cookie("cartinfo" + userid, cartinfo);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        request.setAttribute("atcsucc", "Added " + quant + " item(s) to cart.");
//        response.sendRedirect("viewitem?viewid=" + atcid);
        request.getRequestDispatcher("viewitem?viewid=" + atcid).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
