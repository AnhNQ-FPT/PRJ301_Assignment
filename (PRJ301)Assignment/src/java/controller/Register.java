/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author ADMIN
 */
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        String newname = request.getParameter("newname");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");
        String newemail = request.getParameter("newemail");
        if (!newpass.equals(repass)) {
            request.setAttribute("regerror", "Passwords don't match!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        UserDAO ud = new UserDAO();
        if (ud.checkExistingEmail(newemail)) {
            request.setAttribute("regerror", "This email is already registered!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        if (ud.checkExistingName(newname)) {
            request.setAttribute("regerror", "Username already exists!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        int i;
        for(i=0;i<newemail.length();i++){
            if(newemail.charAt(i)=='@') break;
        }
        if(!newemail.substring(i).equals("@gmail.com")){
            request.setAttribute("regerror", "Invalid email format!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        int newid = ud.getLatestId()+1;
        User u = new User(newid, newname, newpass, newemail, 0, false, null);
        ud.insert(u);
        request.setAttribute("regsuccess", "Account registered successfully!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
