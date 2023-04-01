
package controllers;

import models.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DAL.AccountDAO;
import DAL.CustomerDAO;
import jakarta.servlet.annotation.WebServlet;
import javax.mail.Session;
@WebServlet(name = "AccountSignIn", urlPatterns = {"/account/login"})
public class AccountSignIn extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       if(req.getSession().getAttribute("AccAdminSession")!=null && req.getSession().getAttribute("AccCustomerSession")==null){
            req.getSession().removeAttribute("emailSession");
            req.getSession().removeAttribute("passwordSession");
            req.getSession().removeAttribute("AccAdminSession");
            req.getSession().removeAttribute("AdminSession");
            resp.sendRedirect("../account/login");
        }else if(req.getSession().getAttribute("AccAdminSession")==null && req.getSession().getAttribute("AccCustomerSession")!=null){
            req.getSession().removeAttribute("AccCustomerSession");
            resp.sendRedirect("../account/login");
        }else{
            req.getRequestDispatcher("../login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String txtEmail = req.getParameter("txtEmail");
        String txtPassword = req.getParameter("txtPassword");
        String msgEmail = "", msgPass="";
        
        if (txtEmail.equals("")) {
            msgEmail = "Email is required";
            req.setAttribute("msgEmail", msgEmail);
        }
        if(txtEmail.matches("^[A-Za-z0-9+_.-]+@(.+)$")==false && (!txtEmail.equals(""))){
            msgEmail = "Format Email is wrong!";
            req.setAttribute("msgEmail", msgEmail);
        }
        if(txtPassword.equals("")){
            msgPass = "Password is required";
            req.setAttribute("msgPass", msgPass);
        }
        
        req.getSession().setAttribute("emailSession", txtEmail);
        req.getSession().setAttribute("passwordSession", txtPassword);
        
        if(!msgEmail.equals("") || !msgPass.equals("")){
            req.getRequestDispatcher("../login.jsp").forward(req, resp);
        }else{
            Account acc = new AccountDAO().getAccount(txtEmail, txtPassword);
            if (acc!=null && acc.getStatus()==true) {
                if(acc.getRole()==1){
                    req.getSession().setAttribute("AccAdminSession", acc);
                    req.getSession().setAttribute("AdminSession", acc);
                    resp.sendRedirect(req.getContextPath()+"/dashboard_admin");
                }else if(acc.getRole()==2 && acc.getStatus()==true){
                    req.getSession().setAttribute("AccAdminSession", acc);
                    resp.sendRedirect(req.getContextPath()+"/StoreManager_admin");
                }else if(acc.getRole()==3){
                    req.getRequestDispatcher("../login.jsp").forward(req, resp);
                }
            }else{
                req.setAttribute("msg", "This account does not exist or have been suspended!");
                req.getRequestDispatcher("../login.jsp").forward(req, resp);
            }
        }
        
    }
    
}
