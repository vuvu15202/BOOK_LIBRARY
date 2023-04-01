package controllers;

import DAL.CartDAO;
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
import java.util.Enumeration;
import javax.mail.Session;
import models.Account;
import models.Cart;
import models.CartCookies;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author user
 */
@WebServlet(name = "CartAjax", urlPatterns = {"/cartAjax"})
public class CartAjax extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        
        req.setCharacterEncoding("UTF-8");
        int quantity =0;
        int productID =0;
        int ProductIDToDelete=0;
        if(req.getParameter("txtProductID")!= null &&  req.getParameter("txtQuantity")!=null ){
            productID = Integer.parseInt(req.getParameter("txtProductID"));
            quantity = Integer.parseInt(req.getParameter("txtQuantity"));
        }else if(req.getParameter("txtProductIDToDelete")!= null){
            ProductIDToDelete = Integer.parseInt(req.getParameter("txtProductIDToDelete"));
        }
        
        
        CartDAO cartDao = new CartDAO();
        String result="";
        ArrayList<Cart> cartList = new ArrayList<>();
        if( req.getSession().getAttribute("AccCustomerSession") != null && quantity!=0 ){
            Account cusAcc = (Account) req.getSession().getAttribute("AccCustomerSession");
            cartDao.updateCart(new Cart(cusAcc.getAccountID(), productID, quantity)  );
            //out.println("<input id=\"quantity\" type=\"number\" min=\"1\" value =\""+quantity+"\" class=\"form-control quantity-input\" onchange=\"changeQuantity(this, "+productID+")\">");
            cartList =  cartDao.getCartListByAccID(cusAcc.getAccountID());
            
        
        }else if( req.getSession().getAttribute("AccCustomerSession") != null && ProductIDToDelete!=0){
            Account cusAcc = (Account) req.getSession().getAttribute("AccCustomerSession");
            
            cartDao.deleteCartItem(new Cart(cusAcc.getAccountID(), ProductIDToDelete, quantity)  );
            cartList =  cartDao.getCartListByAccID(cusAcc.getAccountID());
            
        }else if( req.getSession().getAttribute("AccCustomerSession") == null && quantity!=0 ){
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
            cartList = cartCookies.decryptionCookiesText(cookiesText);
            
                    
            int index = -1;
            if (cartCookies.isProductInCartCookies(productID)) { //sp da co trong cookie
                if (arr != null) {
                    for (Cookie arrCookie : arr) {
                        if (arrCookie.getName().equals("item" + productID)) {
                            index++;
                            arrCookie.setValue(productID + "-" + (quantity));
                            resp.addCookie(arrCookie);
                            for (int i = 0; i < cartList.size(); i++) {
                                if (cartList.get(i).getProductID() == productID) {
                                    cartList.remove(cartList.get(i));
                                    cartList.add(i, new Cart(0,productID, quantity));
                                }
                            }
                        }
                    }
                }
            }
            
        
        }else if( req.getSession().getAttribute("AccCustomerSession") == null && ProductIDToDelete!=0){
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
            cartList = cartCookies.decryptionCookiesText(cookiesText);
            
                    
            int index = -1;
            if (arr != null) {
                for (Cookie arrCookie : arr) {
                    if ( arrCookie.getName().equals("item" + ProductIDToDelete) ) {
                        index++;
                        arrCookie.setMaxAge(0);
                        resp.addCookie(arrCookie);
                        cartList.remove(index);
                    }
                }
            }
            
        }
        String contextPath = req.getContextPath();
        result = returnResult(cartList,contextPath);
        PrintWriter out = resp.getWriter();
        out.print(result);

    }
    
    public String returnResult(ArrayList<Cart> cartList, String contextPath){
        String result = "<div class=\"row\">\n" +
"                            <div class=\"col-md-12 col-lg-8\">\n" +
"                                <div class=\"items\">";
        
        ProductDAO proDao= new ProductDAO();
        Product pro ;
        double subTotal=0;
        double Shipping=30000;
        String image;
            for (Cart object : cartList) {
                pro = proDao.getProductInfor(object.getProductID());
                subTotal += object.getQuantity() * pro.getSalePrice();
                image = contextPath+ "/products/"+pro.getImage();
                result +=("<div class=\"product\">\n" +
"                                        <div class=\"row\">\n" +
"                                            \n" +
"                                                    <div class=\"col-md-3\">\n" +
"                                                        <img class=\"img-fluid mx-auto d-block image\" src=\""+image+"\">\n" +
"                                                    </div>\n" +
"                                                \n" +
"                                            <div class=\"col-md-8\">\n" +
"                                                <div class=\"info\">\n" +
"                                                    <div class=\"row\">\n" +
"                                                        \n" +
"                                                                <div class=\"col-md-5 product-name\">\n" +
"                                                                    <div class=\"product-name\">\n" +
"                                                                        <a href=\"/productDetail?proID="+pro.getProductID()+"\">"+pro.getProductName()+"</a>\n" +
"                                                                        <div class=\"product-info\">\n" +
"                                                                            <div>Language: <span class=\"value\">"+pro.getLanguage()+"</span></div>\n" +
"                                                                            <div>Format: <span class=\"value\">"+pro.getFormat()+"</span></div>\n" +
"                                                                        </div>\n" +
"                                                                    </div>\n" +
"                                                                </div>\n" +
"                                                            \n" +
"                                                        <div class=\"col-md-4 quantity\">\n" +
"                                                            <label for=\"quantity\">Quantity:</label>\n" +
"                                                            <input id=\"quantity\" type=\"number\" min=\"1\" value =\""+object.getQuantity()+"\" class=\"form-control quantity-input\" onchange=\"changeQuantity(this, "+pro.getProductID()+")\">\n" +
"                                                        </div>\n" +
"                                                        \n" +
"\n" +
"                                                                <div class=\"col-md-3 price\">\n" +
"                                                                    <span>"+pro.getSalePrice()+"</span>\n" +
"                                                                    <i class=\"fa fa-trash-o\" aria-hidden=\"true\" onclick=\"deleteCartItem(this, "+pro.getProductID()+")\"></i>\n" +
"                                                                </div>\n" +
"                                                    </div>\n" +
"                                                </div>\n" +
"                                            </div>\n" +
"\n" +
"                                        </div>\n" +
"                                    </div>");
            }
            result +=("</div>\n" +
"\n" +
"                        </div>\n" +
"                        <div class=\"col-md-12 col-lg-4\">\n" +
"                            <div class=\"summary\">\n" +
"                                <h3>Summary</h3>\n" +
"                                <div class=\"summary-item\"><span class=\"text\">Subtotal</span><span class=\"price\">"+subTotal+"đ</span></div>\n" +
"                                <div class=\"summary-item\"><span class=\"text\">Discount</span><span class=\"price\">0đ</span></div>\n" +
"                                <div class=\"summary-item\"><span class=\"text\">Shipping</span><span class=\"price\">"+Shipping+"đ</span></div>\n" +
"                                <div class=\"summary-item\"><span class=\"text\">Total</span><span class=\"price\">"+(subTotal + Shipping)+"đ</span></div>\n" +
"                                <a class=\"tg-btn tg-btns tg-active\" href=\"checkout\">\n" +
"                                    <i class=\"fa fa-shopping-basket\"></i>\n" +
"                                    <em>Check out</em>\n" +
"                                </a>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div> ");
            
        return result;
        
    }

}
