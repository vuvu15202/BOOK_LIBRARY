/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.AccountDAO;
import DAL.CartDAO;
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
import DAL.OrderDAO;
import DAL.ProductDAO;
import models.CartCookies;
import models.Discount;
import models.Product;

/**
 *
 * @author user
 */
@WebServlet(name = "OrderAction", urlPatterns = {"/orderAction"})
public class OrderAction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtReceiver = req.getParameter("txtReceiver");
        String txtEmail = req.getParameter("txtEmail").trim();
        String txtPhoneNumber = req.getParameter("txtPhoneNumber");
        String txtAddress = req.getParameter("txtAddress");
        String txtCity = req.getParameter("txtShipCity");
        String txtDiscountID = req.getParameter("txtDiscountID");
        
        Account accCustomer = (Account)req.getSession().getAttribute("AccCustomerSession");
        if(accCustomer !=null){
            ArrayList<Cart> cart =  new CartDAO().getCartListByAccID(accCustomer.getAccountID());
            OrderDAO odDAO = new OrderDAO();
            ProductDAO proDAO = new ProductDAO();
            for (Cart cart1 : cart) {
                if(cart1.getQuantity() > proDAO.getAvailableInStock(cart1.getProductID())){
                    req.setAttribute("msgOutOfStock", "One of these products is not enough in the warehouse, please change the quantity!");
                    req.getRequestDispatcher("/cart").forward(req, resp);
                    return;
                }
            }
            Discount discount = odDAO.getVoucher(txtDiscountID);
            if(discount==null){
                req.setAttribute("msgWrongDiscountID", "This voucher dooesn't exists in our system!");
                req.getRequestDispatcher(req.getContextPath()+"/cart").forward(req, resp);
                return;
            }
            try {
                int newOrderID = odDAO.getNewOrderID();
                Order od = new Order(newOrderID, accCustomer.getCustomerID(), 1, "shipperName", txtAddress, txtCity, "region", "2345", "Viet Nam",1);
                odDAO.createOrderInDB(od, accCustomer.getAccountID(), txtDiscountID);
//                odDAO.createOrder(od);
//                

                SendMail sendMail = new SendMail();
                String subjectContent = "Your order " + newOrderID + " has been confirmed!";
                String emailContent = "Shopee is preparing your order!\nOrder detail: .......";
                try {
                    sendMail.sendAnnounce("vuvu15202@gmail.com", subjectContent, emailContent);
                } catch (MessagingException ex) {
                    Logger.getLogger(OrderAction.class.getName()).log(Level.SEVERE, null, ex);
                }

            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect(req.getContextPath()+"/cart");
        }else{
            
           
        }
        
    }

}
