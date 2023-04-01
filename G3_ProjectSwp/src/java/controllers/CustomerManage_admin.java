/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Customer;
import models.PaginationObject;
import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import DAL.CustomerDAO;

/**
 *
 * @author user
 */
@WebServlet(name = "CustomerManage_admin", urlPatterns = {"/customerManage_admin"})
public class CustomerManage_admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("orderList");
        if(req.getSession().getAttribute("AccAdminSession")==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
            return;
        }
        PaginationObject paging = new PaginationObject(); paging.setNumberOfRowEachPage(10);

        int currentPage = 1;
        if (req.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(req.getParameter("currentPage"));
        }
        ArrayList<Customer> cusList = new CustomerDAO().getAllCustomers();
        req.setAttribute("cusList", cusList);
        List<Customer> listInCurrentPage = paging.getListInCurrentPage(cusList, currentPage);

        int numberOfPage = paging.getNumberOfPage(cusList);
        req.setAttribute("numberOfPage", numberOfPage);

        req.getSession().setAttribute("currentPage", currentPage);
        req.getSession().setAttribute("cusList", cusList);
        req.setAttribute("listInCurrentPage", listInCurrentPage);

        req.getRequestDispatcher("customer.jsp").forward(req, resp);
    }

}
