/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.AuthorDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import models.Account;
import models.Cart;
import models.Customer;
import models.Order;
import models.OrderDetail;
import models.SendMail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import DAL.CustomerDAO;
import DAL.GenreDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import java.util.Comparator;
import models.Author;
import models.CartCookies;
import models.Category;
import models.Genre;
import models.Product;
@WebServlet(name = "HomePage", urlPatterns = {"/homepage"})
public class HomePage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Product> productList = new ProductDAO().getProducts(false);
        ArrayList<Category> cateList = new CategoryDAO().getCategory();
        ArrayList<Genre> genreList = new GenreDAO().getGenreList();
        ArrayList<Author> authorList = new AuthorDAO().getAuthorList();
        ArrayList<Product> newReleaseList = new ProductDAO().getNewReleaseList(3);
        Product comingSoon = new ProductDAO().getComingSoon();
        
        //Cart icon
        if(req.getSession().getAttribute("AccCustomerSession")!= null){
            Account accCustomerSession = (Account)req.getSession().getAttribute("AccCustomerSession");
            ArrayList<Cart> cartList = new CartDAO().getCartListByAccID(accCustomerSession.getAccountID());
            
            //get subTotal
            double subTotal = 0;
            ProductDAO proDao = new ProductDAO();
            Product pro;
            for (Cart cart : cartList) {
                pro = proDao.getProductInfor(cart.getProductID());
                subTotal+=cart.getQuantity() * pro.getSalePrice();
            }
            req.setAttribute("cartList", cartList);
            req.setAttribute("cartSize", cartList.size());
            req.setAttribute("subTotal", subTotal);
        }else{
            Cookie arr[] = req.getCookies();
            ArrayList<String> cookiesText = new ArrayList<>();
            if (arr != null) {
                for (Cookie arrCookies : arr) {
                    if (arrCookies.getName().contains("item")) {
                        cookiesText.add(arrCookies.getValue());
                    }
                }
            }
            CartCookies cartCookies = new CartCookies();
            ArrayList<Cart> cartList = cartCookies.decryptionCookiesText(cookiesText);
            
            //get subTotal
            double subTotal = 0;
            ProductDAO proDao = new ProductDAO();
            Product pro;
            for (Cart cart : cartList) {
                pro = proDao.getProductInfor(cart.getProductID());
                subTotal+=cart.getQuantity() * pro.getSalePrice();
            }
            
            req.setAttribute("cartList", cartList);
            req.setAttribute("cartSize", cartList.size());
            req.setAttribute("subTotal", subTotal);
        }
        
        Comparator sortByDecreasePrice = new Comparator() {
        @Override
            public int compare(Object o1, Object o2) {
                Product pro1 = (Product) o1;
                Product pro2 = (Product) o2;
        
                if(pro1.getAverageRating()- pro2.getAverageRating() >0) return -1;
                if(pro1.getAverageRating() - pro2.getAverageRating() ==0) {
                    return 0;
                }
                return 1;

            }
        };
        ArrayList<Product> listHighRating = new ProductDAO().getProductHighRating();
        listHighRating.sort(sortByDecreasePrice);
        req.setAttribute("listHighRating", listHighRating.subList(0, 5));
        
        req.setAttribute("productList", productList);
        req.setAttribute("cateList", cateList);
        req.setAttribute("genreList", genreList);
        req.setAttribute("authorList", authorList);
        req.setAttribute("newReleaseList", newReleaseList);
        req.setAttribute("comingSoon", comingSoon);
        
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

}

