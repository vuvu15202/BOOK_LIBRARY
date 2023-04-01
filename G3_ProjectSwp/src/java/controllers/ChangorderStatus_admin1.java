/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.OrderDetail;

/**
 *
 * @author Thanh Dao
 */
@WebServlet(name = "ChangorderStatus_admin1", urlPatterns = {"/ChangorderStatus_admin1"})
public class ChangorderStatus_admin1 extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangorderStatus_admin1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangorderStatus_admin1 at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String orderId = request.getParameter("orderId");
        String status = request.getParameter("status");
        System.out.println("orderId: " + orderId);
        System.out.println("status: " + status);
        OrderDAO dao = new OrderDAO();
        try {
            dao.updateOrderStatus(orderId, status);
            if(status.equals("4")){
                ArrayList<OrderDetail> odDetail = dao.getDetailOfOrderByOdID(Integer.parseInt(orderId));
                for (OrderDetail orderDetail : odDetail) {
                    dao.updateQuantityInWarehouse(orderDetail);
                }
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ChangorderStatus_admin1.class.getName()).log(Level.SEVERE, null, ex);
        }
        OrderManage_admin change = new OrderManage_admin();
        change.doGet(request, response);
       // response.sendRedirect("orderManage_admin");
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
