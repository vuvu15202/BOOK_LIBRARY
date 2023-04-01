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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import DAL.CategoryDAO;
import DAL.GenreDAO;
import DAL.ProductDAO;
import DAL.SupplierDAO;
import jakarta.servlet.annotation.WebServlet;
import models.Author;
import models.Genre;
import models.Supplier;

/**
 *
 * @author user
 */
@WebServlet(name = "ProductManage_admin", urlPatterns = {"/productManage_admin"})
public class ProductManage_admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("orderList");
        if (req.getSession().getAttribute("AccAdminSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        }
        PaginationObject paging = new PaginationObject(); paging.setNumberOfRowEachPage(5);

        int currentPage = 1;
        if (req.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(req.getParameter("currentPage"));
        }
        
        ArrayList<Product> proList = new ArrayList<>();
        List<Product> listInCurrentPage = null;

        Enumeration<String> enumeration = req.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String parameterName = (String) enumeration.nextElement();
            if (parameterName.equals("txtSearch2")) {
                req.getSession().setAttribute("mode", 1);
            }
            if (parameterName.equals("categoryFilter")) {
                req.getSession().setAttribute("mode", 2);
            }
            if (parameterName.equals("discontinued")) {
                req.getSession().setAttribute("mode", 3);
            }
            if (parameterName.equals("outofstock")) {
                req.getSession().setAttribute("mode", 4);
            }
        }
        String sample = req.getParameter("txtSearch2");
        if (req.getSession().getAttribute("mode") != null) {
            if ((int) req.getSession().getAttribute("mode") == 1) {
                if (!sample.isEmpty()) {
                    proList = new ProductDAO().getProductbySearch(sample);
                    req.getSession().setAttribute("searchSession", proList);
                    req.getSession().setAttribute("sampleSession", sample);
                } else {
                    proList = new ProductDAO().getProducts(true);
                }
                
                req.getSession().removeAttribute("categoryIDSession");
                req.getSession().removeAttribute("categorySession");
                req.getSession().removeAttribute("discontinued");
                req.getSession().removeAttribute("outofstock");
            }

            if ((int) req.getSession().getAttribute("mode") == 2) {
                if (req.getParameter("categoryFilter") != null) {
                    int catID = Integer.parseInt(req.getParameter("categoryFilter"));
                    proList = new ProductDAO().getProductListByCategoryID(catID);
                    req.getSession().setAttribute("categoryIDSession", catID);
                    req.getSession().setAttribute("categorySession", proList);
                    
                    req.getSession().removeAttribute("searchSession");
                    req.getSession().removeAttribute("sampleSession");
                    req.getSession().removeAttribute("discontinued");
                    req.getSession().removeAttribute("outofstock");
                }
            }
            if ((int) req.getSession().getAttribute("mode") == 3) {
                proList = new ProductDAO().getProductListDiscontinued();
                req.getSession().setAttribute("discontinued", proList);
                
                req.getSession().removeAttribute("searchSession");
                req.getSession().removeAttribute("sampleSession");
                req.getSession().removeAttribute("categoryIDSession");
                req.getSession().removeAttribute("categorySession");
                req.getSession().removeAttribute("outofstock");
            }
            if ((int) req.getSession().getAttribute("mode") == 4) {
                proList = new ProductDAO().getProductListOutOfStock();
                req.getSession().setAttribute("outofstock", proList);
                
                req.getSession().removeAttribute("searchSession");
                req.getSession().removeAttribute("sampleSession");
                req.getSession().removeAttribute("categoryIDSession");
                req.getSession().removeAttribute("categorySession");
                req.getSession().removeAttribute("discontinued");
            }
            
        } else {
            if (req.getSession().getAttribute("searchSession") != null) {
                proList = (ArrayList<Product>) req.getSession().getAttribute("searchSession");
            } else if (req.getSession().getAttribute("categorySession") != null ) {
                proList = (ArrayList<Product>) req.getSession().getAttribute("categorySession");
            } else if (req.getSession().getAttribute("discontinued") != null) {
                proList = (ArrayList<Product>) req.getSession().getAttribute("discontinued");
            }else if (req.getSession().getAttribute("outofstock") != null) {
                proList = (ArrayList<Product>) req.getSession().getAttribute("outofstock");
            } else {
                proList = new ProductDAO().getProducts(true);
            }
        }req.getSession().removeAttribute("mode");
        
        if (proList.isEmpty()) {
            req.setAttribute("emptyListMsg", "There is nothing in Product List!");
        }

        CategoryDAO cdao = new CategoryDAO();
        AuthorDAO adao = new AuthorDAO();
        SupplierDAO sdao = new SupplierDAO();
        GenreDAO gdao = new GenreDAO();

        List<Genre> listg = gdao.getGenreList();
        List<Author> lista = adao.getAuthorList();
        List<Category> listc = cdao.getCategory();
        List<Supplier> lists = sdao.getSupplierList();

        req.setAttribute("listg", listg);
        req.setAttribute("lista", lista);
        req.setAttribute("listc", listc);
        req.setAttribute("lists", lists);
        
        req.setAttribute("categoryList", new CategoryDAO().getCategory());
        listInCurrentPage = paging.getListInCurrentPage(proList, currentPage);
        req.setAttribute("numberOfPage", paging.getNumberOfPage(proList));
        req.getSession().setAttribute("currentPage", currentPage);
        req.setAttribute("productList", listInCurrentPage);
        req.getRequestDispatcher("/product.jsp").forward(req, resp);
    }
    
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        PaginationObject paging = new PaginationObject(); paging.setNumberOfRowEachPage(5);
//
//        int currentPage = 1;
//        if (req.getParameter("currentPage") != null) {
//            currentPage = Integer.parseInt(req.getParameter("currentPage"));
//        }
//
//        ArrayList<Product> proList = new ArrayList<>();
//        List<Product> listInCurrentPage = null;
//
//        Enumeration<String> enumeration = req.getParameterNames();
//        while (enumeration.hasMoreElements()) {
//            String parameterName = (String) enumeration.nextElement();
//            if (parameterName.equals("txtSearch2")) {
//                req.getSession().setAttribute("mode", 1);
//            }
//            if (parameterName.equals("categoryFilter")) {
//                req.getSession().setAttribute("mode", 2);
//            }
//            if (parameterName.equals("discontinued")) {
//                req.getSession().setAttribute("mode", 3);
//            }
//            if (parameterName.equals("outofstock")) {
//                req.getSession().setAttribute("mode", 4);
//            }
//        }
//        String sample = req.getParameter("txtSearch2");
//        if (req.getSession().getAttribute("mode") != null) {
//            if ((int) req.getSession().getAttribute("mode") == 1) {
//                if (!sample.isEmpty()) {
//                    proList = new ProductDAO().getProductbySearch(sample);
//                    req.getSession().setAttribute("searchSession", proList);
//                    req.getSession().setAttribute("sampleSession", sample);
//                } else {
//                    proList = new ProductDAO().getProducts(true);
//                    req.getSession().removeAttribute("searchSession");
//                    req.getSession().removeAttribute("categorySession");
//                    req.getSession().removeAttribute("sampleSession");
//                    req.getSession().removeAttribute("categoryIDSession");
//                    req.getSession().removeAttribute("ProductsByCatNSearch");
//                }
//            }
//
//            if ((int) req.getSession().getAttribute("mode") == 2) {
//                if (req.getParameter("categoryFilter") != null) {
//                    int catID = Integer.parseInt(req.getParameter("categoryFilter"));
//                    String sampleSession = (String) req.getSession().getAttribute("sampleSession");
//                    if (catID == 0 && req.getSession().getAttribute("searchSession") != null) {
//                        proList = new ProductDAO().getProductbySearch(sampleSession);
//                        req.getSession().removeAttribute("categorySession");
//                        req.getSession().removeAttribute("categoryIDSession");
//                    } else if (catID == 0 && req.getSession().getAttribute("searchSession") == null) {
//                        proList = new ProductDAO().getProducts(true);
//                        req.getSession().removeAttribute("categorySession");
//                        req.getSession().removeAttribute("categoryIDSession");
//                    } else {
//                        proList = new ProductDAO().getProductListByCategoryID(catID);
//                        req.getSession().setAttribute("categoryIDSession", catID);
//                        req.getSession().setAttribute("categorySession", proList);
//                    }
//                }
//            }
//            if ((int) req.getSession().getAttribute("mode") == 3) {
//                int discontinued = Integer.parseInt(req.getParameter("discontinued"));
//                proList = new ProductDAO().getProductListDiscontinued(discontinued);
//            }
//            if ((int) req.getSession().getAttribute("mode") == 4) {
//                proList = new ProductDAO().getProductListOutOfStock();
//            }
//            if (req.getSession().getAttribute("searchSession") != null && req.getSession().getAttribute("categorySession") != null) {
//                String sampleSession = (String) req.getSession().getAttribute("sampleSession");
//                int categoryIDSession = (int) req.getSession().getAttribute("categoryIDSession");
//                proList = new ProductDAO().getProductsByCatNSearch(sampleSession, categoryIDSession, true);
//                req.getSession().setAttribute("ProductsByCatNSearch", proList);
//            }
//        } else {
//            if (req.getSession().getAttribute("searchSession") != null && req.getSession().getAttribute("categorySession") == null) {
//                proList = (ArrayList<Product>) req.getSession().getAttribute("searchSession");
//            } else if (req.getSession().getAttribute("categorySession") != null && req.getSession().getAttribute("searchSession") == null) {
//                proList = (ArrayList<Product>) req.getSession().getAttribute("categorySession");
//            } else if (req.getSession().getAttribute("modeProductsByCatNSearch") != null) {
//                proList = (ArrayList<Product>) req.getSession().getAttribute("ProductsByCatNSearch");
//            } else {
//                proList = new ProductDAO().getProducts(true);
//            }
//        }
//        
//        if (proList.isEmpty()) {
//            req.setAttribute("emptyListMsg", "There is nothing in Product List!");
//        }
//        
//        CategoryDAO cdao = new CategoryDAO();
//        AuthorDAO adao = new AuthorDAO();
//        SupplierDAO sdao = new SupplierDAO();
//        GenreDAO gdao = new GenreDAO();
//
//        List<Genre> listg = gdao.getGenreList();
//        List<Author> lista = adao.getAuthorList();
//        List<Category> listc = cdao.getCategory();
//        List<Supplier> lists = sdao.getSupplierList();
//
//        req.setAttribute("listg", listg);
//        req.setAttribute("lista", lista);
//        req.setAttribute("listc", listc);
//        req.setAttribute("lists", lists);
//        req.getSession().removeAttribute("mode");
//        req.setAttribute("categoryList", new CategoryDAO().getCategory());
//        listInCurrentPage = paging.getListInCurrentPage(proList, currentPage);
//        req.setAttribute("numberOfPage", paging.getNumberOfPage(proList));
//        req.getSession().setAttribute("currentPage", currentPage);
//        req.setAttribute("productList", listInCurrentPage);
//        req.getRequestDispatcher("/product.jsp").forward(req, resp);
//    }

}
