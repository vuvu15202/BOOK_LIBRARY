/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Date;
import models.Cart;
import models.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class CartDAO extends DBContext{
    
    public ArrayList<Cart> getObjectList(ResultSet rs){
        ArrayList<Cart> cartList = new ArrayList<>();
        try {
            while(rs.next()){
                int AccountID = rs.getInt("AccountID");
                int ProductID = rs.getInt("ProductID");
                int Quantity = rs.getInt("Quantity");
                cartList.add(new Cart(AccountID, ProductID, Quantity));
            }
        } catch (Exception e) {
        }
        return cartList;
    }
    
    public Cart getObject(ResultSet rs){
        Cart cart = null;
        try {
            while (rs.next()) { 
                int AccountID = rs.getInt("AccountID");
                int ProductID = rs.getInt("ProductID");
                int Quantity = rs.getInt("Quantity");
                cart = new Cart(AccountID, ProductID, Quantity);
            }
        } catch (Exception e) {
        }
        return cart;
    }
    
    public Cart getCartByAccID_ProID(int accID,int proID){
        Cart cart = null;
        try {
            String sql = "select * from Cart where AccountID=? AND ProductID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accID);
            ps.setInt(2, proID);
            ResultSet rs = ps.executeQuery();
            cart = getObject(rs);
        } catch (Exception e) {
        }
        return cart;
    }
    
    public ArrayList<Cart> getCartListByAccID(int accID){
        ArrayList<Cart> cartList = null;
        try {
            String sql = "select * from Cart where AccountID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accID);
            ResultSet rs = ps.executeQuery();
            cartList = getObjectList(rs);
        } catch (Exception e) {
        }
        return cartList;
    }
    
    public boolean addToCart(Cart cart){
        int result=0;
        try {
            Cart checkCartExist = getCartByAccID_ProID(cart.getAccountID(), cart.getProductID());
            if(checkCartExist != null){
                String sql = "UPDATE Cart SET Quantity = ? WHERE AccountID = ? AND ProductID = ?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, cart.getQuantity() + checkCartExist.getQuantity());
                ps.setInt(2, cart.getAccountID());
                ps.setInt(3, cart.getProductID());
                result = ps.executeUpdate();
            }else{
                String sql = "INSERT INTO Cart VALUES( ? , ? , ?)";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, cart.getAccountID());
                ps.setInt(2, cart.getProductID());
                ps.setInt(3, cart.getQuantity());
                result = ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        return result>0;
    }
    
    public boolean updateCart(Cart cart){
        int result=0;
        try {
            Cart checkCartExist = getCartByAccID_ProID(cart.getAccountID(), cart.getProductID());
            if(checkCartExist != null){
                String sql = "UPDATE Cart SET Quantity = ? WHERE AccountID = ? AND ProductID = ?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, cart.getQuantity() );
                ps.setInt(2, cart.getAccountID());
                ps.setInt(3, cart.getProductID());
                result = ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        return result>0;
    }
    public boolean deleteCartItem(Cart cart){
        int result=0;
        try {
            Cart checkCartExist = getCartByAccID_ProID(cart.getAccountID(), cart.getProductID());
            if(checkCartExist != null){
                String sql = "DELETE Cart where AccountID = ? AND ProductID = ?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1, cart.getAccountID());
                ps.setInt(2, cart.getProductID());
                result = ps.executeUpdate();
            }
        } catch (Exception e) {
        }
        return result>0;
    }

    public static void main(String[] args) {
            ArrayList<Cart> cartList = new CartDAO().getCartListByAccID(1);
            for (Cart cart : cartList) {
                System.out.println(cart.getQuantity());
        }
    }

}
