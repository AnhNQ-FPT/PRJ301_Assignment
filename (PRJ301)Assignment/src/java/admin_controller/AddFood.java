/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_controller;

import dal.FoodDAO;
import dal.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;
import model.Food;

/**
 *
 * @author ADMIN
 */
public class AddFood extends HttpServlet {

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
            out.println("<title>Servlet AddFood</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFood at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        FoodDAO fd = new FoodDAO();
        int fid = fd.getLatestId()+1;
        String fname = request.getParameter("fname");
        String fimage = request.getParameter("fimage");
        String fprice_raw = request.getParameter("fprice");
        String fsale_raw = request.getParameter("fsale");
        String fcost_raw = request.getParameter("fcost");
        String frest_raw = request.getParameter("frest");
        float fprice;
        int fsale;
        float fcost;
        int frest;
        try{
            fprice = Float.parseFloat(fprice_raw);
            fsale = Integer.parseInt(fsale_raw);
            fcost = Float.parseFloat(fcost_raw);
            frest = Integer.parseInt(frest_raw);
            Food f = new Food(fid,fname,fprice,fsale,0,fcost);
            fd.insert(f);
            fd.insertFoodRest(f, frest);
            fd.insertFoodImg(f, fimage);
            request.setAttribute("fSucc", "Added successfully!");
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("fErr", "Invalid parameters!");
        }
        request.getRequestDispatcher("foods.jsp").forward(request, response);
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
