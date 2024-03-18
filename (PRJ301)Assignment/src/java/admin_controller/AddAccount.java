/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin_controller;

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
public class AddAccount extends HttpServlet {

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
            out.println("<title>Servlet AddAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddAccount at " + request.getContextPath() + "</h1>");
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
        try {
            UserDAO ud = new UserDAO();
            int aid = ud.getLatestId() + 1;
            String aname = request.getParameter("aname");
            String apass = request.getParameter("apass");
            String aemail = request.getParameter("aemail");

            if (!aemail.endsWith("@gmail.com")) {
                request.setAttribute("aErr", "Invalid email format!");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            if (ud.checkExistingEmail(aemail)) {
                request.setAttribute("aErr", "Email already exists");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            if (ud.checkExistingName(aname)) {
                request.setAttribute("aErr", "Username already exists!");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            String arole_raw = request.getParameter("arole");
            boolean arole = arole_raw.equals("1");

            User u = new User(aid, aname, apass, aemail, arole, null);
            ud.insert(u);
            request.setAttribute("aSucc", "Added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("aErr", "Invalid parameters!");
        }
        request.getRequestDispatcher("accounts.jsp").forward(request, response);
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
