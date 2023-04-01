/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.AuthorDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.GenreDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Account;
import models.Author;
import models.Category;
import models.Genre;
import models.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ContactUs", urlPatterns = {"/contactus"})
public class ContactUs extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Product> productList = new ProductDAO().getProducts(false);
        ArrayList<Category> cateList = new CategoryDAO().getCategory();

        request.setAttribute("productList", productList);
        request.setAttribute("cateList", cateList);

        request.getRequestDispatcher("contactus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
