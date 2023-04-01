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
import models.Category;
import models.Genre;
public class GenreDAO extends DBContext{
    public ArrayList<Genre> getObjectList(ResultSet rs){
        ArrayList<Genre> genreList = new ArrayList<>();
        try {
            while (rs.next()) {
                int GenreID = rs.getInt("GenreID");
                String GenreName = rs.getString("GenreName");
                genreList.add(new Genre(GenreID,GenreName));
            }
        } catch (Exception e) {
        }
        return genreList;
    }
    
    public ArrayList<Genre> getGenreList(){
        ArrayList<Genre> genreList = null;
        try {
            String sql = "select * from Genre";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            genreList = getObjectList(rs);
        } catch (Exception e) {
        }
        return genreList;
    }
    public Genre getGenreByID(int ID) {     
        Genre genre = new Genre();
        try {
            //connection = DBContext.getInstance().getConnection();
            
            String sql = "SELECT * FROM Genre where GenreID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int GenreID = rs.getInt("GenreID");
                String GenreName = rs.getString("GenreName");
                
                genre= new Genre(GenreID, GenreName);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.WARNING,e.getMessage(),e);
        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
        return genre;
    }
    public static void main(String[] args) {
            System.out.println(new GenreDAO().getGenreByID(1));
    }
}
