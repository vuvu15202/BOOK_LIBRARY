/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import DAL.EmployeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;

/**
 *
 * @author Thanh Dao
 */
@WebServlet(name = "CreateEmployee_admin", urlPatterns = {"/createEmployee_admin"})
public class CreateEmployee_admin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateEmployee_admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateEmployee_admin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
//        if(request.getSession().getAttribute("AccAdminSession")==null){
//            response.sendRedirect(request.getContextPath()+"/404error.jsp");
//            return;
//        }
        EmployeeDAO dao = new EmployeeDAO();
        //int semployeeID = Integer.parseInt(request.getParameter("employeeID"));  
        int EmployeeID = dao.getNewEmployeeID();
        String slastName = request.getParameter("lastName");
        String sfirstName = request.getParameter("firstName");
        String stitle = request.getParameter("title");
        String stitleOfCourtesy = request.getParameter("titleOfCourtesy");
        String saddress = request.getParameter("address");
        String sgender = request.getParameter("gender");
        String sphonenumber = request.getParameter("phoneNumber");
        String sbirthDate = request.getParameter("birthDate");
        String shireDate = request.getParameter("hireDate");
        String sdepartmentID = request.getParameter("departmentID");
        String sstatus = request.getParameter("status"); 
        
        Employee employee = new Employee();
        employee.setEmployeeID(EmployeeID);   
//        int check = 0;
//        if (slastName != null && slastName.isEmpty()){
//            request.setAttribute("lastNameMsg", "lastName not allow null");
//            check++;
//        }
//        if (sfirstName != null && sfirstName.isEmpty()) {
//            request.setAttribute("firstNameMsg", "firstName not allow null");
//            check++;
//        }
//        if (stitle != null && stitle.isEmpty()) {
//            request.setAttribute("titleMsg", "title not allow null");
//            check++;
//        }
//        if (stitleOfCourtesy != null && stitleOfCourtesy.isEmpty()) {
//            request.setAttribute("titleOfCourtesyMsg", "titleOfCourtesy not allow null");
//            check++;
//        }
//        if (saddress != null && saddress.isEmpty()) {
//            request.setAttribute("addressMsg", "address not allow null");
//            check++;
//        }
        employee.setAddress(saddress);
        employee.setFirstName(sfirstName);
        employee.setLastName(slastName);
        employee.setTitle(stitle);
        employee.setPhoneNumber(sphonenumber);
        employee.setTitleOfCourtesy(stitleOfCourtesy);
        employee.setGender(true);
        employee.setStatus(true);
        Date birthDate = Date.valueOf("2022-02-02");
        Date hireDate = Date.valueOf("2022-02-02");
        employee.setDepartmentID(Integer.valueOf(sdepartmentID));
        employee.setBirthDate(birthDate);
        employee.setHireDate(hireDate);
        try {
            dao.insertEmployee(employee);
        } catch (SQLException ex) {
            Logger.getLogger(CreateEmployee_admin.class.getName()).log(Level.SEVERE, null, ex);
            request.getSession().setAttribute("sessionMsg", "Create employee fail");
            response.sendRedirect("createEmployee_admin");
            return;
        }

        response.sendRedirect("employeeManager_admin");
    }
    
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
