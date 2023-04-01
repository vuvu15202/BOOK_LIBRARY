/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Account;
import models.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
import DAL.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import java.util.ArrayList;
import models.Cart;
import models.CartCookies;
import models.Category;
import models.Product;

/**
 *
 * @author user
 */
@WebServlet(name = "AccountProfile", urlPatterns = {"/account/profile"})
public class AccountProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccCustomerSession") != null) {
            Account a = (Account) req.getSession().getAttribute("AccCustomerSession");
            Customer customer = new CustomerDAO().getCustomerByID(a.getCustomerID());
            ArrayList<Category> cateList = new CategoryDAO().getCategory();
                req.setAttribute("cateList", cateList);
            req.setAttribute("customer", customer);
            req.setAttribute("account", a);
            
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

            req.getRequestDispatcher("../profile.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
        }
    }

}
