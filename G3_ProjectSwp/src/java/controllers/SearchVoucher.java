/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.CrudDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import models.Discount;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "SearchVoucher", urlPatterns = {"/SearchVoucher"})
public class SearchVoucher extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtSearch = req.getParameter("txtSearch");
        req.setAttribute("searchValue", txtSearch);
        List<Discount> list= new CrudDAO().SearchVoucherByID(txtSearch);
        req.setAttribute("vList", list);
        
        req.getRequestDispatcher("voucher.jsp").forward(req, resp);
    }

}
