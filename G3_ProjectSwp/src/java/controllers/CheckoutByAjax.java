/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.AuthorDAO;
import DAL.CartDAO;
import DAL.CategoryDAO;
import DAL.GenreDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import models.Account;
import models.Author;
import models.Cart;
import models.CartCookies;
import models.Category;
import models.Discount;
import models.Genre;
import models.Product;

/**
 *
 * @author user
 */
@WebServlet(name = "CheckoutByAjax", urlPatterns = {"/checkoutAjax"})
public class CheckoutByAjax extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        request.setCharacterEncoding("UTF-8");
        
        
        String discount = "____________";
        if(request.getParameter("txtDiscountID")!=null){
            discount = request.getParameter("txtDiscountID");
        }
        Discount discountObject = new OrderDAO().getVoucher(discount);
        if(discountObject==null){
            discountObject = new Discount();
            discountObject.setDiscountID("Voucher does not exist!");
            discountObject.setQuantity(0);
            discountObject.setPercentage(0);
        }else{
            if(discountObject.getQuantity()>=1)
            {
                request.getSession().setAttribute("discount", discount);
            }else{
                discountObject.setPercentage(0);
                discountObject.setDiscountID("Voucher is overdue or run out!");
            }
        }
        
        
        ArrayList<Cart> cartList ;
        ArrayList<Product> proList ;
        if(request.getSession().getAttribute("AccCustomerSession") !=null){
            Account acc = (Account)request.getSession().getAttribute("AccCustomerSession");
            cartList = new CartDAO().getCartListByAccID(acc.getCustomerID());
            proList = new ProductDAO().getProducts(false);
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
            cartList = cartCookies.decryptionCookiesText(cookiesText);
            proList = new ProductDAO().getProducts(false);
        }
        
        
        String result = "<h4 class=\"d-flex justify-content-between align-items-center mb-3\">\n" +
"                                <span class=\"text-muted\" style=\"font-weight: 600;\">Your cart</span>\n" +
"                                <span class=\"badge badge-secondary badge-pill\"></span>\n" +
"                            </h4>\n" +
"                            <ul class=\"list-group mb-3\">";
        Product pro;
        PrintWriter out = response.getWriter();
        double total = 0;
        for (Cart cart : cartList) {
            pro = new ProductDAO().getProductInfor(cart.getProductID());
            total += cart.getQuantity() * pro.getSalePrice();
            result+= "<li class=\"list-group-item d-flex justify-content-between lh-condensed\">\n" +
"                                        <div>\n" +
"                                            \n" +
"                                                    <h6 class=\"my-0\">"+pro.getProductName()+"</h6>\n" +
"                                                \n" +
"                                           \n" +
"                                                    <small class=\"text-muted\">"+pro.getSalePrice()+"</small>\n" +
"                                               \n" +
"                                        </div>\n" +
"                                        <span class=\"text-muted\">x"+cart.getQuantity()+"</span>\n" +
"                                    </li>";
        }
        double saleOff = total*discountObject.getPercentage();
        total=total - total*discountObject.getPercentage() + 30000;
        
        result+="<li class=\"list-group-item d-flex justify-content-between bg-light\">\n" +
"                                    <div class=\"text-success\">\n" +
"                                        <h6 class=\"my-0\">Voucher code</h6>\n" +
"                                        <small style=\"color:red;\">"+ discountObject.getDiscountID()+"</small>\n" +
"                                    </div>\n" +
"                                    <span class=\"text-success\" style=\"color:red;\">-"+Math.round(saleOff)+"</span>\n" +
"                                </li>\n" +
"                                <li class=\"list-group-item d-flex justify-content-between\">\n" +
"                                    <span>Shipping: </span>\n" +
"                                    <strong>"+30000+"</strong>\n" +
"                                </li>\n" +
"                                <li class=\"list-group-item d-flex justify-content-between\">\n" +
"                                    <span>Total (VND): </span>\n" +
"                                    <strong>"+Math.round(total)+"</strong>\n" +
"                                </li>\n" +
"                            </ul>\n" +
"\n" +
"                            <form class=\"card p-2\">\n" +
"                                <div class=\"input-group\">\n" +
"                                    <input value=\""+discount+"\"  id=\"discount\" type=\"text\" class=\"form-control\" name=\"txtDiscountID\" placeholder=\"Promo code\">\n" +
"                                    <div class=\"input-group-append\">\n" +
"                                        <button onclick=\"redeem()\" type=\"submit\" class=\"tg-btn tg-btns \" style=\"background-color: lightgray\">Redeem</button>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </form>";
        out.print(result);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
