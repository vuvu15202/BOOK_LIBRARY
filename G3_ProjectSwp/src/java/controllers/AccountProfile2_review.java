/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.AccountDAO;
import DAL.CartDAO;
import DAL.OrderDAO;
import DAL.ProductDAO;
import DAL.ReviewDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import models.Account;
import models.Cart;
import models.CartCookies;
import models.Order;
import models.OrderDetail;
import models.Product;
import models.Review;

/**
 *
 * @author ADMIN
 */
@MultipartConfig
@WebServlet(name = "AccountProfile2_review", urlPatterns = {"/AccountProfile2_review"})
public class AccountProfile2_review extends HttpServlet {

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession().getAttribute("AccCustomerSession")==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
            return;
        }
        Account accCustomer = (Account)req.getSession().getAttribute("AccCustomerSession");
        ArrayList<Product> productList = new ProductDAO().getProducts(true);
        req.setAttribute("productList", productList);
        try {
            int orderID ;
            if(req.getSession().getAttribute("orderID")!=null){
                orderID = (Integer)req.getSession().getAttribute("orderID");
                req.getSession().removeAttribute("orderID");
            }else{
                orderID = Integer.parseInt(req.getParameter("id"));
            }

            
            Order order = new OrderDAO().getOrderByID(orderID);
            ArrayList<OrderDetail> orderDetailList = new OrderDAO().getDetailOfOrderByCusID(accCustomer.getCustomerID());
            ArrayList<Review> reviewList = new ReviewDAO().getReviewListByOrderID(orderID);

            req.setAttribute("reviewList", reviewList);
            req.setAttribute("order", order);
            req.setAttribute("orderDetailList", orderDetailList);
            
            
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
            //***************
        
            req.getRequestDispatcher("/profile_order_review.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
        }
    }

    private static final long serialVersionUID = 1L;
    
    private static final String UPLOAD_DIR = "uploads";
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        if(req.getSession().getAttribute("AccCustomerSession")==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
            return;
        }
        
        try {
            
            int rating =0;
            if(req.getParameter("rate")!=null)  rating = Integer.parseInt(req.getParameter("rate"));
            
            String comment ="";
            if(req.getParameter("txtComment")!=null) comment= req.getParameter("txtComment");
            
            int orderID = Integer.parseInt(req.getParameter("orderID"));
            int productID = Integer.parseInt(req.getParameter("productID"));
            
            String fileNameToStore = "img-10.jpg";
            String random = new AccountDAO().randomString(5);
            
            Part filePart  = req.getPart("chooseFile");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString().replace(".",random+".");
            if(fileName.length()!=0){
                //Part filePart  = req.getPart("chooseFile");
                fileNameToStore = fileName;
                // Set the destination directory for the uploaded file
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                // Copy the file to the destination directory
                InputStream inputStream = filePart.getInputStream();
                Files.copy(inputStream, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
            
            }
            
            Account accCustomer = (Account)req.getSession().getAttribute("AccCustomerSession");
            Review newReview = new Review(accCustomer.getCustomerID(), orderID, productID, rating, comment, fileNameToStore);
            boolean isreviewed = new ReviewDAO().createReview(newReview);
            if(!isreviewed){
                req.setAttribute("msg", "some thing went wrong!");
            }
            req.getSession().setAttribute("orderID", orderID);
            doGet(req, resp);
            //req.getRequestDispatcher("/AccountProfile2_review?id="+orderID).forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
        }



    }
    
    
}
