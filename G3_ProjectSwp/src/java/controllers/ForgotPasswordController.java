package controllers;

import models.Account;
import models.SendMail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import DAL.AccountDAO;
import jakarta.servlet.annotation.WebServlet;
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/account/forgotpass"})
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("/forgot.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("txtEmail");
        req.getSession().setAttribute("emailSession", email);
        String msg = "";
        if (email.equals("")) {
            msg += "Email is required";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("../forgot.jsp").forward(req, resp);
        }else if(email.matches("^[A-Za-z0-9+_.-]+@(.+)$")==false && (!email.equals(""))){
            msg += "Email is required";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("../forgot.jsp").forward(req, resp);
        }else {
            AccountDAO accountDAO = new AccountDAO();
            Account a = accountDAO.getAccountByEmail(email);
            if (a == null) {
                msg += "Email does not exist in system!";
                req.setAttribute("msg", msg);
                req.getRequestDispatcher("../forgot.jsp").forward(req, resp);
            } else {
                a.setPassword(accountDAO.randomId(6));
                if (accountDAO.changePassword(a)) {
                    try {
                        SendMail sendEmail = new SendMail(); 
                        sendEmail.sendNewPass(a.getEmail(), a.getPassword());
                    } catch (MessagingException ex) {
                        Logger.getLogger(ForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    resp.sendRedirect("../account/login");
                }else{
                    req.setAttribute("msg", "Change Password Failed!");
                    req.getRequestDispatcher("../forgot.jsp").forward(req, resp);
                }
            }
        }

    }

}
