/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Employee;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AccountSignUp", urlPatterns = {"/account/signup"})
public class AccountSignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Employee employee = new Employee(firstName, lastName);
        Account account = new Account(email,password);
        boolean accountDAO = new AccountDAO().createAccountEmployee(employee, account);
        if(accountDAO == true){
        req.getRequestDispatcher("../announcement.jsp").forward(req, resp);
        } else{
        req.getRequestDispatcher("../404error.jsp").forward(req, resp);
        }

    }

}
