/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.FoodDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

/**
 *
 * @author ADMIN
 */
public class ChangeQuantity extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet ChangeQuantity</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeQuantity at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        
//        int quant = Integer.parseInt(request.getParameter("quant"));
        int change = Integer.parseInt(request.getParameter("change"));
        int chid = Integer.parseInt(request.getParameter("chid"));
        try {
            if (change == -1 && o.getQuantityById(chid) <= 1) {
                o.removeOrderedFood(chid);
            } else {
                Food f = fd.getFood(chid);
                OrderedFood t = new OrderedFood(chid, f.getName(), f.getPrice(),f.getSale(),f.getSold(),f.getCost(), change);
                o.addOrderedFood(t);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
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
        
        response.sendRedirect("viewcart");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
