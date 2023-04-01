/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import DAL.DepartmentsDAO;
import DAL.EmployeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import models.Department;
import models.Employee;
import models.PaginationObject;

/**
 *
 * @author Thanh Dao
 */
public class EmployeeManage_admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        if ( req.getSession().getAttribute("AdminSession")==null) {
            resp.sendRedirect(req.getContextPath() + "/404error.jsp");
            return;
        }
        String indexPage = req.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        EmployeeDAO dao = new EmployeeDAO();
        int count = dao.getTotalEmployees();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage++;
        }
        List<Employee> empList = dao.pagingEmployees(index);
        ArrayList<Department> depart = new DepartmentsDAO().getAllDepartments();
        Enumeration<String> enumeration = req.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String parameterName = (String) enumeration.nextElement();
            if (parameterName.equals("txtSearch")) {
                req.getSession().setAttribute("mode", 1);
            }
            if (parameterName.equals("employeeFilter")) {
                req.getSession().setAttribute("mode", 2);
            }
        }
        String sample = req.getParameter("txtSearch");
        if (req.getSession().getAttribute("mode") != null) {
            if ((int) req.getSession().getAttribute("mode") == 1) {
                if (!sample.isEmpty()) {
                    empList = new EmployeeDAO().searchByName(sample);
                    req.getSession().setAttribute("searchSession", empList);
                    req.getSession().setAttribute("sampleSession", sample);
                } else {
                    empList = new EmployeeDAO().getEmployees(true);
                    req.getSession().removeAttribute("searchSession");
                    req.getSession().removeAttribute("employeeSession");
                    req.getSession().removeAttribute("sampleSession");
                    req.getSession().removeAttribute("departmentIDSession");
                }
            }
            if ((int) req.getSession().getAttribute("mode") == 2) {
                if (req.getParameter("employeeFilter") != null) {
                    int depID = Integer.parseInt(req.getParameter("employeeFilter"));
                    String sampleSession = (String) req.getSession().getAttribute("sampleSession");
                    if (depID == 0 && req.getSession().getAttribute("searchSession") != null) {
                        empList = new EmployeeDAO().searchByName(sampleSession);
                        req.getSession().removeAttribute("employeeSession");
                        req.getSession().removeAttribute("departmentIDSession");
                    } else if (depID == 0 && req.getSession().getAttribute("searchSession") == null) {
                        empList = new EmployeeDAO().getEmployees(true);
                        req.getSession().removeAttribute("employeeSession");
                        req.getSession().removeAttribute("departmentIDSession");
                    } else {
                        empList = new EmployeeDAO().getListByEmployeeID(depID);
                        req.getSession().setAttribute("departmentIDSession", depID);
                        req.getSession().setAttribute("employeeSession", empList);
                    }
                }
            }
        }
        req.setAttribute("depart", new DepartmentsDAO().getAllDepartments());
        req.setAttribute("listEmp", empList);
        req.setAttribute("endP", endPage);
        req.getRequestDispatcher("employees.jsp").forward(req, resp);
    }

}
