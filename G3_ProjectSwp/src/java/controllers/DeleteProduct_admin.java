/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import DAL.CategoryDAO;
import DAL.CustomerDAO;
import DAL.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
@WebServlet(name = "DeleteProduct_admin", urlPatterns = {"/deleteProduct_admin"})
public class DeleteProduct_admin extends HttpServlet {

   
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id=Integer.parseInt(req.getParameter("id"));
        ProductDAO dao=new ProductDAO();
        dao.deleteProduct(id);
        resp.sendRedirect("productManage_admin");
    }

}
