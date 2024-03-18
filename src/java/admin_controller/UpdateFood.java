/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_controller;

import dal.FoodDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Food;

/**
 *
 * @author ADMIN
 */
public class UpdateFood extends HttpServlet {

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
        request.getRequestDispatcher("updatefood.jsp").forward(request, response);
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
        try {
            int ufid = Integer.parseInt(request.getParameter("ufid"));
            String ufname = request.getParameter("ufname");
            String ufimage = request.getParameter("ufimage");
            float ufprice = Float.parseFloat(request.getParameter("ufprice"));
            int ufsale = Integer.parseInt(request.getParameter("ufsale"));
            int ufsold = Integer.parseInt(request.getParameter("ufsold"));
            float ufcost = Float.parseFloat(request.getParameter("ufcost"));
            Food f = new Food(ufid,ufname,ufprice,ufsale,ufsold,ufcost);
            fd.update(f,ufimage);            
            request.setAttribute("fSucc", "Updated successfully!");
        } catch (Exception e) {
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
