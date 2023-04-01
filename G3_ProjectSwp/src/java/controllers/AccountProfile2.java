/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.CartDAO;
import DAL.CategoryDAO;
import models.Account;
import models.Order;
import models.OrderDetail;
import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import DAL.OrderDAO;
import DAL.ProductDAO;
import jakarta.servlet.http.Cookie;
import models.Cart;
import models.CartCookies;
import models.Category;

/**
 *
 * @author user
 */
@WebServlet(name = "AccountProfileMyOrder", urlPatterns = {"/account/profile_myOrder"})
public class AccountProfile2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccCustomerSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        }
        //Cart icon**********
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
        //*****************
        
        Account accCustomer = (Account) req.getSession().getAttribute("AccCustomerSession");
        if (accCustomer == null) {
            resp.sendRedirect("profile_order.jsp");
        } else {
            ArrayList<Order> orderList = new OrderDAO().getAllOrdersByCusID(accCustomer.getCustomerID());
            if (orderList.isEmpty()) {
                req.setAttribute("errorMsg", "Order not found");
            } else {
                ArrayList<OrderDetail> orderDetailList = new OrderDAO().getDetailOfOrderByCusID(accCustomer.getCustomerID());
                ArrayList<Product> productList = new ProductDAO().getProducts(true);
                ArrayList<Category> cateList = new CategoryDAO().getCategory();
                req.setAttribute("cateList", cateList);
                req.setAttribute("productList", productList);
                req.setAttribute("orderDetailList", orderDetailList);
                req.setAttribute("orderList", orderList);
            }
            // Forward to the JSP page AFTER setting all the attributes
            req.getRequestDispatcher("/profile_order.jsp").forward(req, resp);
        }
    }

}
