
package DAL;

import models.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PQT2212
 */
public class CategoryDAO extends DBContext{
    //private Connection connection;
    //private PreparedStatement ps;
    //private ResultSet rs;
    
    public ArrayList<Category> getCategory() {     
        ArrayList<Category> categories = new ArrayList<>();
        try {
            //connection = DBContext.getInstance().getConnection();
            
            String sql = "SELECT * FROM Categories";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");        
                
                categories.add(new Category(categoryID, categoryName));
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.WARNING,e.getMessage(),e);
        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
        return categories;
    }
    public Category getCategoryByID(int ID) {     
        Category cate = new Category();
        try {
            //connection = DBContext.getInstance().getConnection();
            
            String sql = "SELECT * FROM Categories where CategoryID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int categoryID = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");        
                
                cate= new Category(categoryID, categoryName);
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.WARNING,e.getMessage(),e);
        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
        return cate;
    }
    
    public static void main(String[] args) {
        CategoryDAO abc = new CategoryDAO();
        System.out.println(abc.getCategoryByID(1).getCategoryName());
    }
}
