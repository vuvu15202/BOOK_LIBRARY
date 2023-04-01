/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import models.Product;
import models.Review;

/**
 *
 * @author user
 */
public class ReviewDAO extends DBContext{
    public ArrayList<Review> getReviewListByProductID(int productID){
        ArrayList<Review> reviewList = new ArrayList<>();
        try {
            String sql = "select * from Reviews where ProductID=?";
            PreparedStatement ps;
            ps= connection.prepareStatement(sql);
            ps.setInt(1,productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int CustomerID = rs.getInt("CustomerID");
                int OrderID = rs.getInt("OrderID");
                int ProductID = rs.getInt("ProductID");
                int Rating = rs.getInt("Rating");
                String Comment = rs.getString("Comment");
                String Image = rs.getString("Image");
                LocalDateTime ReviewDate= rs.getTimestamp("ReviewDate").toLocalDateTime();
                reviewList.add(new Review(CustomerID, OrderID, ProductID, Rating, Comment, Image, ReviewDate));
            }
        } catch (Exception e) {
        }
        return reviewList;
    }
    
    public ArrayList<Review> getReviewListByOrderID(int orderID){
        ArrayList<Review> reviewList = new ArrayList<>();
        try {
            String sql = "select * from Reviews where OrderID=?";
            PreparedStatement ps;
            ps= connection.prepareStatement(sql);
            ps.setInt(1,orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int CustomerID = rs.getInt("CustomerID");
                int OrderID = rs.getInt("OrderID");
                int ProductID = rs.getInt("ProductID");
                int Rating = rs.getInt("Rating");
                String Comment = rs.getString("Comment");
                String Image = rs.getString("Image");
                LocalDateTime ReviewDate= rs.getTimestamp("ReviewDate").toLocalDateTime();
                reviewList.add(new Review(CustomerID, OrderID, ProductID, Rating, Comment, Image, ReviewDate));
            }
        } catch (Exception e) {
        }
        return reviewList;
    }
    
    public boolean createReview(Review review){
        int result=0;
        try {
            String sql = "  insert into Reviews values(?,?,?,?,?, ?,GETDATE())";
            PreparedStatement ps;
            ps= connection.prepareStatement(sql);
            ps.setInt(1,review.getCustomerID());
            ps.setInt(2,review.getOrderID());
            ps.setInt(3,review.getProductID());
            ps.setInt(4,review.getRating());
            ps.setString(5,review.getComment());
            ps.setString(6,review.getImage());
            result = ps.executeUpdate();
            
        } catch (Exception e) {
        }
        return result>0;
    }
    
    public boolean isReviewed(int customerID, int orderID, int productID){
        Review review = null;
        try {
            String sql = "select * from Reviews where CustomerID=? AND OrderID=? AND ProductID=?";
            PreparedStatement ps;
            ps= connection.prepareStatement(sql);
            ps.setInt(1,customerID);
            ps.setInt(2,orderID);
            ps.setInt(3,productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int CustomerID = rs.getInt("CustomerID");
                int OrderID = rs.getInt("OrderID");
                int ProductID = rs.getInt("ProductID");
                int Rating = rs.getInt("Rating");
                String Comment = rs.getString("Comment");
                String Image = rs.getString("Image");
                LocalDateTime ReviewDate= rs.getTimestamp("ReviewDate").toLocalDateTime();
                review = new Review(CustomerID, OrderID, ProductID, Rating, Comment, Image, ReviewDate);
            }
        } catch (Exception e) {
        }
        return review!=null;
    }
    public boolean isOrderDetailReviewed(int customerID, int orderID, int productID){
        Review review = null;
        try {
            String sql = "select * from Reviews where CustomerID=? AND OrderID=? AND ProductID=?";
            PreparedStatement ps;
            ps= connection.prepareStatement(sql);
            ps.setInt(1,customerID);
            ps.setInt(2,orderID);
            ps.setInt(3,productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int CustomerID = rs.getInt("CustomerID");
                int OrderID = rs.getInt("OrderID");
                int ProductID = rs.getInt("ProductID");
                int Rating = rs.getInt("Rating");
                String Comment = rs.getString("Comment");
                String Image = rs.getString("Image");
                LocalDateTime ReviewDate= rs.getTimestamp("ReviewDate").toLocalDateTime();
                review = new Review(CustomerID, OrderID, ProductID, Rating, Comment, Image, ReviewDate);
            }
        } catch (Exception e) {
        }
        return review!=null;
    }
    
    
    
    public static void main(String[] args) {
        ReviewDAO rvDAO = new ReviewDAO();
        System.out.println(rvDAO.createReview(new Review(11, 10303,2, 5, "comment", "Image")));
    }
}
