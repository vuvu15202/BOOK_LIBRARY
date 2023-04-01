/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.CategoryDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Category;
import models.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AboutUs", urlPatterns = {"/aboutus"})
public class AboutUs extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Product> productList = new ProductDAO().getProducts(false);
        ArrayList<Category> cateList = new CategoryDAO().getCategory();

        request.setAttribute("productList", productList);
        request.setAttribute("cateList", cateList);

        request.getRequestDispatcher("aboutus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
