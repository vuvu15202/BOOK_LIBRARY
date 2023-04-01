/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import models.Category;
import models.PaginationObject;
import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import DAL.CategoryDAO;
import DAL.CrudDAO;
import DAL.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import models.Discount;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "deleteVoucher_admin", urlPatterns = {"/deleteVoucher_admin"})
public class DeleteVoucher_admin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
        } else {
            String ID = req.getParameter("id");  
            
            new CrudDAO().DeleteVoucher(ID);
            req.setAttribute("msg", "Delete voucher infomation successful!!!");

            CrudDAO dao = new CrudDAO();
            List<Discount> voucherList = dao.getAllVoucher();
            req.setAttribute("vList", voucherList);
            req.getRequestDispatcher("voucher.jsp").forward(req, resp);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    
}
