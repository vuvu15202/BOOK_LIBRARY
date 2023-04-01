/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.AuthorDAO;
import models.Category;
import models.PaginationObject;
import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
import DAL.GenreDAO;
import DAL.ProductDAO;
import DAL.ReviewDAO;
import DAL.SupplierDAO;
import jakarta.servlet.annotation.WebServlet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import models.Author;
import models.Customer;
import models.Genre;
import models.Review;
import models.Supplier;

@WebServlet(name = "ProductDetailControllers", urlPatterns = {"/productDetail"})
public class ProductDetailController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("proID")==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
            return;
        }
        
        ProductDAO proDAO = new ProductDAO();
        int proID = Integer.parseInt(req.getParameter("proID"));
        Product product = proDAO.getProductInfor(proID);
        if(product==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
        }
        
        
        ArrayList<Category> cateList = new CategoryDAO().getCategory();
        ArrayList<Author> authorList = new AuthorDAO().getAuthorList();
        ArrayList<Genre> genreList = new GenreDAO().getGenreList();
        ArrayList<Supplier> supplierList = new SupplierDAO().getSupplierList();
        ArrayList<Product> similarProductList = proDAO.getProductListByGenreID(product.getGenreID());
        Product comingSoon = new ProductDAO().getComingSoon();
        int availableInStock = proDAO.getAvailableInStock(proID);
        ArrayList<Review> reviewList = new ReviewDAO().getReviewListByProductID(proID);
        ArrayList<Customer> cusList = new CustomerDAO().getAllCustomers();
        
        req.setAttribute("productInfor", product);
        req.setAttribute("cateList", cateList);
        req.setAttribute("authorList", authorList);
        req.setAttribute("genreList", genreList);
        req.setAttribute("SupList", supplierList);
        req.setAttribute("comingSoon", comingSoon);
        req.setAttribute("availableInStock", availableInStock);
        req.setAttribute("similarProductList", similarProductList);
        req.setAttribute("reviewList", reviewList);
        req.setAttribute("cusList", cusList);
        
        req.getRequestDispatcher("/productdetail.jsp").forward(req, resp);
    }
    
}
