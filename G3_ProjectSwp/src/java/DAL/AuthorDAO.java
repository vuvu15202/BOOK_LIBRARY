/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Author;
public class AuthorDAO extends DBContext{
    public ArrayList<Author> getObjectList(ResultSet rs){
        ArrayList<Author> authorList = new ArrayList<>();
        try {
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int AuthorID = rs.getInt("AuthorID");
                String AuthorName = rs.getString("AuthorName");
                String PhoneNumber = rs.getString("PhoneNumber");
                String Address = rs.getString("Address");
                authorList.add(new Author(AuthorID, AuthorName, PhoneNumber, Address));
            }
        } catch (Exception e) {
        }
        return authorList;
    }
    
    public ArrayList<Author> getAuthorList(){
        ArrayList<Author> authorList = null;
        try {
            String sql = "select * from Authors";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            authorList = getObjectList(rs);
        } catch (Exception e) {
        }
        return authorList;
    }
    
    public Author getAuthorByID(int ID) {     
        Author author = new Author();
        try {
            //connection = DBContext.getInstance().getConnection();
            
            String sql = "SELECT * FROM Authors where AuthorID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int AuthorID = rs.getInt("AuthorID");
                String AuthorName = rs.getString("AuthorName");
                String PhoneNumber = rs.getString("PhoneNumber");
                String Address = rs.getString("Address");  
                
                author= new Author(AuthorID, AuthorName, PhoneNumber, Address);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.WARNING,e.getMessage(),e);
        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
        return author;
    }
    
    public static void main(String[] args) {
        Author abc = new AuthorDAO().getAuthorByID(1);
        System.out.println(abc.getAuthorID());
    }
}
