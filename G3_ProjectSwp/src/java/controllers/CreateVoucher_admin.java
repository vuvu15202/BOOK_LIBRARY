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
import models.Discount;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CreateVoucher_admin", urlPatterns = {"/CreateVoucher_admin"})
public class CreateVoucher_admin extends HttpServlet {

    //su dung de tai thong tin discount khi bam bao Edit
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        } else {
            req.getSession().setAttribute("sessionEdit", 1);
            String ID = req.getParameter("id");

            Discount a = new CrudDAO().getVoucherByID(ID);
            req.setAttribute("VoucherEdit", a);

            req.getRequestDispatcher("create-voucher.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        } else {
            String DiscountID = req.getParameter("txtDiscountID").replaceAll("\\s\\s+", " ").trim();
            String Title = req.getParameter("txtTitle").replaceAll("\\s\\s+", " ").trim();
            String Description = req.getParameter("txtDescription").replaceAll("\\s\\s+", " ").trim();
            LocalDateTime StartDate = LocalDateTime.parse(req.getParameter("txtStartDate"));
            LocalDateTime EndDate = LocalDateTime.parse(req.getParameter("txtEndDate"));
            double Percentage = Double.parseDouble(req.getParameter("txtPercentage"));
            int Quantity = Integer.parseInt(req.getParameter("txtQuantity"));

            Discount voucherCreate = new Discount(DiscountID, Title, Description, StartDate, EndDate, Percentage, Quantity);
            boolean results = new CrudDAO().CreateVoucher(voucherCreate);
            if(results==true) {
                req.setAttribute("msg", "Create voucher infomation successful!!!");
            } else {
                req.setAttribute("msg1", "Create voucher infomation Fail!!!");
            }
            CrudDAO dao = new CrudDAO();
            List<Discount> voucherList = dao.getAllVoucher();
            req.setAttribute("vList", voucherList);
            req.getRequestDispatcher("voucher.jsp").forward(req, resp);
        }
    }

}
