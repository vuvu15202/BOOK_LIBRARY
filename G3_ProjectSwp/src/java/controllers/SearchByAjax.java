/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import DAL.AuthorDAO;
import DAL.CategoryDAO;
import DAL.GenreDAO;
import DAL.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import models.Author;
import models.Category;
import models.Genre;
import models.Product;

/**
 *
 * @author trinh
 */
@WebServlet(name = "SearchByAjax", urlPatterns = {"/searchAjax"})
public class SearchByAjax extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        
        
        String txtSearch = request.getParameter("txt");
        ArrayList<Product> proList ;
        if(request.getSession().getAttribute("proList") !=null){
            proList = (ArrayList<Product>)request.getSession().getAttribute("proList");
        }else{
            proList = new ProductDAO().getProducts(false);
        }
        
        
        if(request.getParameter("txtCategory")!=null){
            proList = new ProductDAO().getProductListByCategoryID(Integer.parseInt(request.getParameter("txtCategory")));
            request.getSession().setAttribute("proList", proList);
        }
        if(request.getParameter("txt") != null){
            proList = new ProductDAO().SearchProductByName(txtSearch);
            request.getSession().setAttribute("proList", proList);
        }
        if(request.getParameter("txtGenre") != null){
            proList = new ProductDAO().getProductListByGenreID(Integer.parseInt(request.getParameter("txtGenre")));
            request.getSession().setAttribute("proList", proList);
        }
        if(request.getParameter("txtSupplier") != null){
            proList = new ProductDAO().getProductListBySupplierID(Integer.parseInt(request.getParameter("txtSupplier")));
            request.getSession().setAttribute("proList", proList);
        }
        if(request.getParameter("txtFormat") != null){
            if(Integer.parseInt(request.getParameter("txtFormat"))==1){
                proList = new ProductDAO().SearchProductByFormat("Bìa mềm");
            }else{
                proList = new ProductDAO().SearchProductByFormat("Bìa cứng");
            }
            request.getSession().setAttribute("proList", proList);
            
        }
        if(request.getParameter("txtSupplier") != null){
            proList = new ProductDAO().getProductListBySupplierID(Integer.parseInt(request.getParameter("txtSupplier")));
            request.getSession().setAttribute("proList", proList);
        }
        if(request.getParameter("txtPrice") != null){
            switch (Integer.parseInt(request.getParameter("txtPrice"))) {
                case 1:
                    proList = new ProductDAO().searchProductListByPriceDomain(0, 150000);
                    break;
                case 2:
                    proList = new ProductDAO().searchProductListByPriceDomain(150000, 300000);
                    break;
                case 3:
                    proList = new ProductDAO().searchProductListByPriceDomain(300000, 500000);
                    break;
                default:
                    proList = new ProductDAO().searchProductListByPriceDomain(500000, 1500000);
                    break;
            }
            request.getSession().setAttribute("proList", proList);
        }
        
        if(request.getParameter("txtsortByName") != null){
            request.getSession().setAttribute("txtsortByName", 1);
            request.getSession().removeAttribute("txtsortByIncreasePrice");
            request.getSession().removeAttribute("txtsortByDecreasePrice");
            request.getSession().removeAttribute("txtsortByNewest");
            request.getSession().removeAttribute("txtsortByOldest");
        }else if(request.getParameter("txtsortByIncreasePrice") != null){
            request.getSession().setAttribute("txtsortByIncreasePrice", 1);
            request.getSession().removeAttribute("txtsortByName");
            request.getSession().removeAttribute("txtsortByDecreasePrice");
            request.getSession().removeAttribute("txtsortByNewest");
            request.getSession().removeAttribute("txtsortByOldest");
        }else if(request.getParameter("txtsortByDecreasePrice") != null){
            request.getSession().setAttribute("txtsortByDecreasePrice", 1);
            request.getSession().removeAttribute("txtsortByName");
            request.getSession().removeAttribute("txtsortByIncreasePrice");
            request.getSession().removeAttribute("txtsortByNewest");
            request.getSession().removeAttribute("txtsortByOldest");
        }else if(request.getParameter("txtsortByNewest") != null){
            request.getSession().setAttribute("txtsortByNewest", 1);
            request.getSession().removeAttribute("txtsortByName");
            request.getSession().removeAttribute("txtsortByIncreasePrice");
            request.getSession().removeAttribute("txtsortByDecreasePrice");
            request.getSession().removeAttribute("txtsortByOldest");
        }else if(request.getParameter("txtsortByOldest") != null){
            request.getSession().setAttribute("txtsortByOldest", 1);
            request.getSession().removeAttribute("txtsortByName");
            request.getSession().removeAttribute("txtsortByIncreasePrice");
            request.getSession().removeAttribute("txtsortByDecreasePrice");
            request.getSession().removeAttribute("txtsortByNewest");
        }
        Comparator sortByName = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
                
                if(pro1.getProductName().compareTo(pro2.getProductName())>0) return -1;
                if(pro1.getProductName().compareTo(pro2.getProductName())==0) {
                    return 0;
                }
                return 1;
            }
        };
        Comparator sortByOldDate = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
                
                if (pro1.getPublishDate()== null || pro2.getPublishDate() == null) {
                    return 0;
                }else if(pro1.getPublishDate().compareTo(pro2.getPublishDate()) > 0){
                    return 1;
                }else {
                    return -1;
                }
            }
        };
        Comparator sortByNewDate = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
                
                if (pro1.getPublishDate()== null || pro2.getPublishDate() == null) {
                    return 0;
                }else if(pro1.getPublishDate().compareTo(pro2.getPublishDate()) > 0){
                    return -1;
                }else {
                    return 1;
                }
                
            }
        };
        //tang >0 1
        Comparator sortByIncreasePrice = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
                
                if(pro1.getSalePrice() - pro2.getSalePrice() >0) return 1;
                if(pro1.getSalePrice() - pro2.getSalePrice() ==0) {
                    return 0;
                }
                return -1;
                
            }
        };
        Comparator sortByDecreasePrice = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
                
                if(pro1.getSalePrice() - pro2.getSalePrice() >0) return -1;
                if(pro1.getSalePrice() - pro2.getSalePrice() ==0) {
                    return 0;
                }
                return 1;
                
            }
        };
        
        if(request.getSession().getAttribute("txtsortByName") != null){
            proList.sort(sortByName);
        }else if(request.getSession().getAttribute("txtsortByIncreasePrice") != null){
             proList.sort(sortByIncreasePrice);
        }
        else if(request.getSession().getAttribute("txtsortByDecreasePrice") != null){
             proList.sort(sortByDecreasePrice);
        }
        else if(request.getSession().getAttribute("txtsortByNewest") != null){
              proList.sort(sortByNewDate);
        }else{
             proList.sort(sortByOldDate);
        }
        
        if(proList.isEmpty()){
            request.getSession().setAttribute("emptyListMsg", "There is nothing in Order List, Let's order some thing!");
        }else{
            request.getSession().removeAttribute("emptyListMsg");
        }
        
        
        PrintWriter out = response.getWriter();
        Category cate; CategoryDAO cateDAO = new CategoryDAO();
        Genre genre; GenreDAO genreDAO = new GenreDAO();
        Author author; AuthorDAO authorDAO = new AuthorDAO();
        String pathPrevious; String image;
        for (Product product : proList) {
            cate = cateDAO.getCategoryByID(product.getCategoryID());
            genre = genreDAO.getGenreByID(product.getGenreID());
            author = authorDAO.getAuthorByID(product.getAuthorID());
            pathPrevious = request.getContextPath()+ "/cart?previousURL=productList&proID="+product.getProductID();
            image = request.getContextPath()+ "/products/"+product.getImage();
            out.println("<div class=\"col-xs-6 col-sm-6 col-md-4 col-lg-3\" style=\"margin: 20px 0px 0px 0px;\">\n" +
"                                            <div class=\"tg-postbook\">\n" +
"                                                <figure class=\"tg-featureimg\">\n" +
"                                                    <div class=\"tg-bookimg\">\n" +
"                                                        <div class=\"tg-frontcover\"><img src=\""+image+"\" alt=\"image description\"></div>\n" +
"                                                        <div class=\"tg-backcover\"><img src=\""+image+"\" alt=\"image description\"></div>\n" +
"                                                    </div>\n" +
"                                                    <a class=\"tg-btnaddtowishlist\" href=\"javascript:void(0);\">\n" +
"                                                        <i class=\"icon-heart\"></i>\n" +
"                                                        <span>add to wishlist</span>\n" +
"                                                    </a>\n" +
"                                                </figure>\n" +
"                                                <div class=\"tg-postbookcontent\">\n" +
"                                                    <ul class=\"tg-bookscategories\">\n" +
"                                                       \n" +
"                                                                <li><a href=\"../G3_ProjectSwp/productList?categoryID="+cate.getCategoryID()+"\">"+cate.getCategoryName()+"</a></li>\n" +
"                                                                \n" +
"                                                            \n" +
"                                                                <li><a href=\"../G3_ProjectSwp/productList?genreID="+genre.getGenreID()+"\">"+genre.getGenreName()+"</a></li>\n" +
"                                                                \n" +
"                                                    </ul>\n" +
"                                                    <div class=\"tg-themetagbox\"><span class=\"tg-themetag\">sale</span></div>\n" +
"                                                    <div class=\"tg-booktitle\">\n" +
"                                                        <h3><a href=\"../G3_ProjectSwp/productDetail?proID="+product.getProductID()+"\">"+product.getProductName()+"</a></h3>\n" +
"                                                    </div>\n" +
"                                                    <span class=\"tg-bookwriter\">By:\n" +
"                                                                <a href=\"javascript:void(0);\">"+author.getAuthorName()+"</a>\n" +
"                                                    </span>\n" +
"                                                    <span class=\"tg-stars\"><span></span></span>\n" +
"                                                    <span class=\"tg-bookprice\">\n" +
"                                                        <ins>"+product.getSalePrice()+"</ins>\n" +
"                                                        <del>"+product.getCoverPrice()+"</del>\n" +
"                                                    </span>\n" +
"                                                    <c:url value=\"/account/cart\" var=\"AddToCart\">\n" +
"                                                        <c:param name=\"previousURL\" value=\"../productList\" />\n" +
"                                                        <c:param name=\"proID\" value=\""+product.getProductID()+"\" />\n" +
"                                                    </c:url>\n" +
"                                                    <a class=\"tg-btn tg-btnstyletwo\" href=\""+pathPrevious+"\">\n" +
"                                                        <i class=\"fa fa-shopping-basket\"></i>\n" +
"                                                        <em>Add To Basket</em>\n" +
"                                                    </a>\n" +
"                                                </div>\n" +
"                                            </div>\n" +
"                                        </div>");
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
        processRequest(request, response);
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
