/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
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
import java.sql.Date;
import java.time.LocalDate;
import models.Cart;
import models.CartCookies;
import models.Category;
import models.Customer;

/**
 *
 * @author user
 */
@WebServlet(name = "AccountProfile1", urlPatterns = {"/account/profile1"})
public class AccountProfile1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccCustomerSession") != null) {
            Account a = (Account) req.getSession().getAttribute("AccCustomerSession");
            String firstName = req.getParameter("txtFirstName").replaceAll("\\s\\s+", " ").trim();
            String lastName = req.getParameter("txtLastName").replaceAll("\\s\\s+", " ").trim();
            String address = req.getParameter("txtAddress").replaceAll("\\s\\s+", " ").trim();
            String contactTitle = req.getParameter("txtContactTitle").replaceAll("\\s\\s+", " ").trim();
            String Phone = req.getParameter("txtPhone");
            Date creatDate = Date.valueOf(req.getParameter("txtCreatDate"));
            Boolean gender = Boolean.valueOf(req.getParameter("txtGender"));
            int customerID = req.getIntHeader("txtCustomerID");
            if(req.getParameter("txtBirthday")!=""){
                Date birthday = Date.valueOf(req.getParameter("txtBirthday"));
                Customer cus = new Customer(a.getCustomerID(), firstName, lastName, gender, contactTitle, birthday, address, Phone, creatDate);
                new AccountDAO().editInfo(cus);
            }
            else{
                Customer cus = new Customer(a.getCustomerID(), firstName, lastName, gender, contactTitle, address, Phone, creatDate);
                new AccountDAO().editInfo(cus);
            }
            resp.sendRedirect("../account/profile");
        } else {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("AccCustomerSession") != null) {
            Account a = (Account) req.getSession().getAttribute("AccCustomerSession");
            Customer customer = new CustomerDAO().getCustomerByID(a.getCustomerID());
            ArrayList<Category> cateList = new CategoryDAO().getCategory();
                req.setAttribute("cateList", cateList);
            req.setAttribute("customer", customer);
            
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
            
            req.getRequestDispatcher("/profile_edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
        }

    }

}
