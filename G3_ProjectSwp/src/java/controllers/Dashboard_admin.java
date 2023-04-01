/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import models.Customer;
import models.Order;
import models.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import DAL.CustomerDAO;
import DAL.OrderDAO;

/**
 *
 * @author user
 */
@WebServlet(name = "Dashboard_admin", urlPatterns = {"/dashboard_admin"})
public class Dashboard_admin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("orderList");
        if( req.getSession().getAttribute("AdminSession")==null){
            resp.sendRedirect(req.getContextPath()+"/404error.jsp");
            return;
        }
        LocalDate today = LocalDate.now();
        
        //total order trong thang
        ArrayList<Order> OrderInCurrentMonth = new OrderDAO().getOrderByCurrentMonth(today.getMonthValue());
        //total order trong hom nay
        ArrayList<Order> OrderInToday = new OrderDAO().getOrderToday();
        //total new ccustomer trong thangs
        ArrayList<Customer> CustomerList = new CustomerDAO().getNewCustomer(today.getMonthValue());
        //chi tieest cac don hang trong thang
        ArrayList<OrderDetail> orderDetailInCurrentMonth = new OrderDAO().getALLOrderDetailInCurrentMonth(today.getMonthValue(),today.getYear());
        
        
        //thong ke total order 6 thang gan nhat
        ArrayList<Integer> statisticOrderIn6Month = new ArrayList<>();
        ////- param: thong ke total order 6 thang gan nhat 
        ArrayList<Integer> statisticOrderIn6Month_param = new ArrayList<>();
        if(req.getParameter("thisMonth")!=null){
            for (int i = 5; i >= 0; i--) {
            ArrayList<Order> odList = new OrderDAO().getOrderNearest5Month(-i);
            statisticOrderIn6Month.add(odList.size());
            }
            for (int i = 5; i >= 0; i--) {
            statisticOrderIn6Month_param.add(today.minusMonths(i).getMonthValue());
            }
        }else{
            for (int i = 5; i >= 0; i--) {
            ArrayList<Order> odList = new OrderDAO().getOrderNearest5Month(-i);
            statisticOrderIn6Month.add(odList.size());
            }
            for (int i = 5; i >= 0; i--) {
            statisticOrderIn6Month_param.add(today.minusMonths(i).getMonthValue());
            }
        }
        
        
        
        //Total doanh thu trong thang
        double monthlyRevenue = 0;
        for (Order order : OrderInCurrentMonth) {
            for (OrderDetail orderDetail : orderDetailInCurrentMonth) {
                if(order.getOrderID() == orderDetail.getOrderID()){
                    monthlyRevenue+= orderDetail.getSalePrice() * orderDetail.getQuantity();
                }
            }
        }
        
        //Total doanh thu trong ngay
        double todayRevenue = 0;
        for (Order order : OrderInToday) {
            for (OrderDetail orderDetail : orderDetailInCurrentMonth) {
                if(order.getOrderID() == orderDetail.getOrderID()){
                    todayRevenue+= orderDetail.getSalePrice() * orderDetail.getQuantity();
                }
            }
        }
        
        //statistic doanh thu trong thang
        ArrayList<Double> statisticRevenue = new ArrayList<>();
        if(req.getParameter("year")!= null){
            int year = Integer.parseInt(req.getParameter("year"));
            req.getSession().setAttribute("yearSession", year);
            if(year == today.getYear()){
                for (int i = 1; i <= today.getMonthValue(); i++) {
                    double revenueInMonth = 0;
                    ArrayList<OrderDetail> odDetailList= new OrderDAO().getOrderDetailByMonth(i,year);
                    for (OrderDetail orderDetailEle : odDetailList) {
                        revenueInMonth+=orderDetailEle.getQuantity() * orderDetailEle.getSalePrice();
                    }
                    statisticRevenue.add(revenueInMonth);
                }
            }else{
                for (int i = 1; i <= 12; i++) {
                    double revenueInMonth = 0;
                    ArrayList<OrderDetail> odDetailList= new OrderDAO().getOrderDetailByMonth(i,year);
                    for (OrderDetail orderDetailEle : odDetailList) {
                        revenueInMonth+=orderDetailEle.getQuantity() * orderDetailEle.getSalePrice();
                    }
                    statisticRevenue.add(revenueInMonth);
                } 
            }
            
        }else{
            req.getSession().removeAttribute("yearSession");
            for (int i = 1; i <= today.getMonthValue(); i++) {
            double revenueInMonth = 0;
            ArrayList<OrderDetail> odDetailListInMonth = new OrderDAO().getOrderDetailByMonth(i);
            for (OrderDetail orderDetailEle : odDetailListInMonth) {
                revenueInMonth += orderDetailEle.getQuantity() * orderDetailEle.getSalePrice();
            }
            statisticRevenue.add(revenueInMonth);
            }
        }
        
        
        ArrayList<Integer> years = new ArrayList<>();   
        for (int i = today.getYear(); i >= 2010; i--) {
            years.add(i);
        }

        
        
        
        req.setAttribute("totalOrderInMonth", OrderInCurrentMonth.size());
        req.setAttribute("totalNewCusInMonth", CustomerList.size());
        req.setAttribute("monthlyRevenue", Math.round(monthlyRevenue));
        req.setAttribute("todayRevenue", Math.round(todayRevenue));
        req.setAttribute("statisticRevenue", statisticRevenue);
        req.setAttribute("statisticOrderIn6Month", statisticOrderIn6Month);
        req.setAttribute("statisticOrderIn6Month_param", statisticOrderIn6Month_param);
        req.setAttribute("years", years);
        
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }
    
}
