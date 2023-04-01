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
import java.time.LocalDateTime;
import models.Discount;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "voucherManage_admin", urlPatterns = {"/voucherManage_admin"})
public class voucherManage_admin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        } else {
            req.getSession().removeAttribute("sessionEdit");

            CrudDAO dao = new CrudDAO();
            List<Discount> voucherList = dao.getAllVoucher();
            req.setAttribute("vList", voucherList);
            req.getRequestDispatcher("voucher.jsp").forward(req, resp);
        }
    }

    //edit
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        }
        String DiscountID = req.getParameter("txtDiscountID");
        String Title = req.getParameter("txtTitle").replaceAll("\\s\\s+", " ").trim();
        String Description = req.getParameter("txtDescription").replaceAll("\\s\\s+", " ").trim();
        LocalDateTime StartDate = LocalDateTime.parse(req.getParameter("txtStartDate"));
        LocalDateTime EndDate = LocalDateTime.parse(req.getParameter("txtEndDate"));
        double Percentage = Double.parseDouble(req.getParameter("txtPercentage"));
        int Quantity = Integer.parseInt(req.getParameter("txtQuantity"));

        Discount editVoucher = new Discount(DiscountID, Title, Description, StartDate, EndDate, Percentage, Percentage, Quantity, Quantity);
        boolean results = new CrudDAO().editVoucher(editVoucher);
        if(results==true) {
                req.setAttribute("msg", "Update voucher infomation successful!!!");
            } else {
                req.setAttribute("msg1", "Update voucher infomation Fail!!!");
            }

        CrudDAO dao = new CrudDAO();
        List<Discount> voucherList = dao.getAllVoucher();
        req.setAttribute("vList", voucherList);
        req.getRequestDispatcher("voucher.jsp").forward(req, resp);

    }

}
