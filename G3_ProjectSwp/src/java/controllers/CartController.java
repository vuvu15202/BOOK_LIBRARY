package controllers;

import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.OrderDAO;
import models.Cart;
import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import DAL.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.Session;
import models.Account;
import models.CartCookies;
import models.Category;
import models.Customer;
import models.Discount;
import models.Order;
import models.OrderDetail;
import models.SendMail;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author user
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtReceiver = req.getParameter("txtReceiver");
        String txtEmail = req.getParameter("txtEmail").trim();
        String txtPhoneNumber = req.getParameter("txtPhoneNumber");
        String txtAddress = req.getParameter("txtAddress");
        String txtCity = req.getParameter("txtShipCity");
        String txtDiscountID = req.getParameter("txtDiscountID");
        
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
            
//            for (int i = 0; i < cookiesText.size(); i++) {
//                resp.getWriter().print(cookiesText.get(i) + "\n");
//                return;
//            }
            
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
                ProductDAO proDAO = new ProductDAO();
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
                for (Cart item : cartList) {
                    
                    double discountAmount=0;
                    Product proInfor = proDAO.getProductInfor(item.getProductID());
                    
                    
                    discountAmount = proInfor.getSalePrice() - proInfor.getSalePrice()*percent;
                    
                    OrderDetail odDetail = new OrderDetail(newOrderID, item.getProductID(),1,discountAmount, item.getQuantity(), voucher );
                    odDAO.createDetailOfOrder(odDetail);
                }

                SendMail sendMail = new SendMail();
                String subjectContent = "Your order " + newOrderID + " has been confirmed!";
                String emailContent = "Shopee is preparing your order!\nOrder detail: .......";
                if(req.getSession().getAttribute("AccSession")!=null){
                    sendMail.sendAnnounce(txtEmail, subjectContent, emailContent);
                }

            } catch (SQLException ex) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(OrderAction.class.getName()).log(Level.SEVERE, null, ex);
            }
            resp.sendRedirect(req.getContextPath()+"/cart");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        Enumeration<String> enumeration = req.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String parameterName = (String) enumeration.nextElement();
            if (parameterName.equals("proID")) {
                req.getSession().setAttribute("mode", 1);
            }
        }
        
        if(req.getSession().getAttribute("AccCustomerSession")!=null){
            Account accCustomer = (Account)req.getSession().getAttribute("AccCustomerSession");
            if(req.getSession().getAttribute("mode") != null){
                if((int) req.getSession().getAttribute("mode") == 1){
                    req.getSession().removeAttribute("mode");
                    
                    try {
                        int proID = Integer.parseInt(req.getParameter("proID"));
                        
                        CartDAO cartDAO = new CartDAO();
                        if(req.getParameter("quantity")!=null){
                            int quantity = Integer.parseInt(req.getParameter("quantity"));
                            cartDAO.addToCart(new Cart(accCustomer.getAccountID(), proID, quantity));
                        }else{
                            cartDAO.addToCart(new Cart(accCustomer.getAccountID(), proID, 1));
                        }
                        
                    } catch (Exception e) {
                        req.setAttribute("addToCartFail", "add this product to cart fail!");
                    }
                    resp.sendRedirect(req.getParameter("previousURL"));
                    //req.getRequestDispatcher(req.getParameter("previousURL")).forward(req, resp);
                }

            }else{
                ArrayList<Cart> cartList = new CartDAO().getCartListByAccID(accCustomer.getAccountID());
                ArrayList<Product> productList = new ProductDAO().getProducts(false);
                
                double subTotal = 0;
                double shipping = 30000;
                ProductDAO prodao = new ProductDAO();
                Product pro;
                for (Cart cart : cartList) {
                    pro = prodao.getProductInfor(cart.getProductID());
                    subTotal += pro.getSalePrice()*cart.getQuantity();
                }
                ArrayList<Category> cateList = new CategoryDAO().getCategory();
                req.setAttribute("cateList", cateList);
                req.setAttribute("subTotal", subTotal);
                req.setAttribute("shipping", shipping);
                

                req.setAttribute("cartList", cartList);
                req.setAttribute("productList", productList);
                req.getRequestDispatcher("/viewcart.jsp").forward(req, resp);
            }
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
            
            
            if(req.getSession().getAttribute("mode") != null){
                if((int) req.getSession().getAttribute("mode") == 1){
                    req.getSession().removeAttribute("mode");
                    int proID = Integer.parseInt(req.getParameter("proID"));
                    
                    int quantity=0;
                    int quantityAdd = 1;
                    try {
                        quantity = cartCookies.getQuantityByID(Integer.parseInt(req.getParameter("proID")));
                        
                        if(req.getParameter("quantity")!= null){
                            quantityAdd = Integer.parseInt(req.getParameter("quantity"));
                        }
                    } catch (Exception e) {
                        
                    }
                    
                    int index = -1;
                    if (cartCookies.isProductInCartCookies(proID)) { //sp da co trong cookie
                        if (arr != null) {
                            for (Cookie arrCookie : arr) {
                                if (arrCookie.getName().equals("item" + proID)) {
                                    index++;
                                    arrCookie.setValue(proID + "-" + (quantity+ quantityAdd));
                                    resp.addCookie(arrCookie);
                                    for (int i = 0; i < cartList.size(); i++) {
                                        if (cartList.get(i).getProductID() == proID) {
                                            cartList.remove(cartList.get(i));
                                            cartList.add(i, new Cart(0,proID, quantity+1));
                                        }
                                    }
                                }
                            }
                        }

                    } else { //sp chua co trong cookie
                        Cookie c = new Cookie("item" + proID, proID + "-"+quantityAdd);
                        c.setMaxAge(60 * 60 * 24 * 30);
                        //c.setDomain(req.getContextPath());
                        resp.addCookie(c);
                        cartList.add(new Cart(proID, 1));
                    }
                    resp.sendRedirect(req.getParameter("previousURL"));
                    
                }
            //Chua dang nhap, view cart
            }else{ 
                
                ArrayList<Product> productList = new ProductDAO().getProducts(true);
                ArrayList<Category> cateList = new CategoryDAO().getCategory();
                req.setAttribute("cateList", cateList);
                req.setAttribute("cartList", cartList);
                req.setAttribute("productList", productList);
                
                //tinh subtotal
                double subTotal = 0;
                double shipping = 30000;
                ProductDAO prodao = new ProductDAO();
                Product pro;
                for (Cart cart : cartList) {
                    pro = prodao.getProductInfor(cart.getProductID());
                    subTotal += pro.getSalePrice()*cart.getQuantity();
                }
                req.setAttribute("subTotal", subTotal);
                req.setAttribute("shipping", shipping);
                
                
                req.getRequestDispatcher("/viewcart.jsp").forward(req, resp);
            }
        }
        
        
        

    }

}
