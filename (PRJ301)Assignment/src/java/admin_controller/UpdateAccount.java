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
public class UpdateAccount extends HttpServlet {

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
            out.println("<title>Servlet UpdateAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAccount at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("updateaccount.jsp").forward(request, response);
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
        UserDAO ud = new UserDAO();
        try {
            int uaid = Integer.parseInt(request.getParameter("uaid"));
            String uaname = request.getParameter("uaname");
            String uapass = request.getParameter("uapass");
            String uaemail = request.getParameter("uaemail");

            if (!uaemail.endsWith("@gmail.com")) {
                request.setAttribute("aErr", "Invalid email format!");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            double uabal = Double.parseDouble(request.getParameter("uabal"));
            if (uabal < 0) {
                request.setAttribute("aErr", "Invalid parameters");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }
            
            String uarole_raw = request.getParameter("uarole");
            boolean uarole = uarole_raw.equals("1");
            User u = new User(uaid, uaname, uapass, uaemail, uabal, uarole, null);
            if (ud.checkExistingEmailExceptSelf(u)) {
                request.setAttribute("aErr", "Email already exists");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            if (ud.checkExistingNameExceptSelf(u)) {
                request.setAttribute("aErr", "Username already exists!");
                request.getRequestDispatcher("accounts.jsp").forward(request, response);
                return;
            }

            ud.update(u);
            request.setAttribute("aSucc", "Updated succesfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("aErr", "Invalid parameters");
            request.getRequestDispatcher("accounts.jsp").forward(request, response);
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
