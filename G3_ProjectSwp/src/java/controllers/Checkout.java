/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import models.Account;
import models.Cart;
import models.CartCookies;
import models.Category;
import models.Customer;
import models.Discount;
import models.Order;
import models.OrderDetail;
import models.Product;
import models.SendMail;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "Checkout", urlPatterns = {"/checkout"})
public class Checkout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("AccCustomerSession")!=null){
            Account acc = (Account)request.getSession().getAttribute("AccCustomerSession");
            Customer cus = new CustomerDAO().getCustomerByID(acc.getCustomerID());
            Order recentlyOrder = new OrderDAO().getRecentlyOrder(acc.getCustomerID());
            ArrayList<Cart> cartList = new CartDAO().getCartListByAccID(acc.getCustomerID());
            ArrayList<Product> proList = new ProductDAO().getProducts(false);
            
            double total = 0;
            Product pro;
            ProductDAO proDAO = new ProductDAO();
            for (Cart cart : cartList) {
                pro = proDAO.getProductInfor(cart.getQuantity());
                total+= pro.getSalePrice()*cart.getQuantity();
            }
            
            ArrayList<Category> cateList = new CategoryDAO().getCategory();
            request.setAttribute("cateList", cateList);
            request.setAttribute("recentlyOrder", recentlyOrder);
            request.setAttribute("cartList", cartList);
            request.setAttribute("proList", proList);
            request.setAttribute("cus", cus);
            request.setAttribute("total", total+30000);
        }else{
            Cookie arr[] = request.getCookies();
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
            ArrayList<Product> proList = new ProductDAO().getProducts(false);
            
            //get subTotal
            double subTotal = 0;
            ProductDAO proDao = new ProductDAO();
            Product pro;
            for (Cart cart : cartList) {
                pro = proDao.getProductInfor(cart.getProductID());
                subTotal+=cart.getQuantity() * pro.getSalePrice();
            }
            
            ArrayList<Category> cateList = new CategoryDAO().getCategory();
            request.setAttribute("cateList", cateList);
            request.setAttribute("cartList", cartList);
            request.setAttribute("proList", proList);
            request.setAttribute("total", subTotal+30000);
            
        }
        request.getSession().removeAttribute("discount");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String txtReceiver = req.getParameter("txtReceiver");
        String txtEmail = req.getParameter("txtEmail");
        String txtPhoneNumber = req.getParameter("txtPhoneNumber");
        String txtAddress = req.getParameter("txtAddress");
        String txtCity = req.getParameter("txtCity");
        String txtDistrict = req.getParameter("txtDistrict");
        String txtDiscountID = "____________";
        if(req.getSession().getAttribute("discount")!=null){
            txtDiscountID = (String)req.getSession().getAttribute("discount");
        }
        
        txtAddress+="-"+txtDistrict+"-"+txtCity;
        
        Account accCustomer = (Account)req.getSession().getAttribute("AccCustomerSession");
        if(accCustomer !=null){
            ArrayList<Cart> cart =  new CartDAO().getCartListByAccID(accCustomer.getAccountID());
            OrderDAO odDAO = new OrderDAO();
            ProductDAO proDAO = new ProductDAO();
            for (Cart cart1 : cart) {
                if(cart1.getQuantity() > proDAO.getAvailableInStock(cart1.getProductID())){
                    req.setAttribute("msgOutOfStock", cart1.getProductID()+" is not enough in the warehouse, please change the quantity!");
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
                    odDAO.changeQuantityVoucher(txtDiscountID);
                    sendMail.sendAnnounce("vuvu15202@gmail.com", subjectContent, emailContent);
                } catch (MessagingException ex) {
                    Logger.getLogger(OrderAction.class.getName()).log(Level.SEVERE, null, ex);
                }

            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect(req.getContextPath()+"/cart");
        }else{
            Cookie arr[] = req.getCookies();
            ArrayList<String> cookiesText = new ArrayList<>();
            if (arr != null) {
                for (Cookie arrCookies : arr) {
                    if (arrCookies.getName().contains("item")) {
                        cookiesText.add(arrCookies.getValue());
                        arrCookies.setMaxAge(0);
                        resp.addCookie(arrCookies);
                    }
                }
            }
            CartCookies cartCookies = new CartCookies();
            ArrayList<Cart> cartList = cartCookies.decryptionCookiesText(cookiesText);
            
//            for (int i = 0; i < cookiesText.size(); i++) {
//                resp.getWriter().print(cookiesText.get(i) + "\n");
//                return;
//            }

            ProductDAO proDAO = new ProductDAO();
            for (Cart cart1 : cartList) {
                if(cart1.getQuantity() > proDAO.getAvailableInStock(cart1.getProductID())){
                    req.setAttribute("msgOutOfStock", cart1.getProductID()+ " is not enough in the warehouse, please change the quantity!");
                    req.getRequestDispatcher("/cart").forward(req, resp);
                    return;
                }
            }
            AccountDAO accDAO = new AccountDAO();
            if(accDAO.getAccountByEmail(txtEmail)==null){
                try {
                    Account acc = new Account(0, txtEmail, "", 0, 0, 2, true);
                    Customer cus = new Customer(0, "", "",txtReceiver,txtAddress,txtPhoneNumber);
                    accDAO.createAccount(cus, acc);

                } catch (Exception e) {

                }
            }
            
            Account AccCustomer = accDAO.getAccountByEmail(txtEmail);
            //req.getSession().setAttribute("AccCustomerSession", AccCustomer);
            
            
            try {
                OrderDAO odDAO = new OrderDAO();
                
                Discount discount = odDAO.getVoucher(txtDiscountID);
                int newOrderID = odDAO.getNewOrderID();
                String voucher = discount.getDiscountID();
                double percent = discount.getPercentage();
                if(discount==null){
                    req.setAttribute("msgWrongDiscountID", "This voucher dooesn't exists in our system!");
                    req.getRequestDispatcher(req.getContextPath()+"/cart").forward(req, resp);
                    return;
                }
            
                Order od = new Order(newOrderID, AccCustomer.getCustomerID(), 1, txtReceiver, txtAddress, txtCity, "", "", "Viet Nam",1);
                odDAO.createOrder(od);
                ArrayList<OrderDetail> orderDetailList = new ArrayList<>();
                for (Cart item : cartList) {
                    
                    Product proInfor = proDAO.getProductInfor(item.getProductID());
                    double discountAmount = proInfor.getSalePrice() - proInfor.getSalePrice()*percent;
                    orderDetailList.add(new OrderDetail(newOrderID, item.getProductID(),1,discountAmount, item.getQuantity(), voucher ));
                    
                }
                for (OrderDetail orderDetail : orderDetailList) {
                    odDAO.createDetailOfOrder(orderDetail);
                }
                
                odDAO.changeQuantityVoucher(txtDiscountID);
                SendMail sendMail = new SendMail();
                String subjectContent = "Your order " + newOrderID + " has been confirmed!";
                String emailContent = "Shopee is preparing your order!\nOrder detail: .......";
                //if(req.getSession().getAttribute("AccSession")!=null){
                    sendMail.sendAnnounce(txtEmail, subjectContent, emailContent);
                //}

            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(OrderAction.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect(req.getContextPath()+"/cart");
           
        }
    }

}
