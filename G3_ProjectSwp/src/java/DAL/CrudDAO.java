/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import static com.oracle.jrockit.jfr.ContentType.Timestamp;
import java.sql.Array;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import models.Author;
import models.Category;
import models.Product;
import models.Product_Manage;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import models.Discount;

/**
 *
 * @author ASUS
 */
public class CrudDAO extends DBContext {

    public ArrayList<Product_Manage> getObjectList(ResultSet rs) {
        ArrayList<Product_Manage> productList = new ArrayList<>();
        try {
            while (rs.next()) {
                Product_Manage p = new Product_Manage();
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                p.setProductID(rs.getInt("ProductID"));
                p.setProductName(rs.getString("ProductName"));
                Category c = getCategoryByID(rs.getInt("CategoryID"));
                p.setCategory(c);
                p.setGenreID(rs.getInt("GenreID"));
                p.setCoverPrice(rs.getDouble("CoverPrice"));
                p.setSalePrice(rs.getDouble("SalePrice"));
                p.setAuthorID(rs.getInt("AuthorID"));
                p.setTranslator(rs.getString("Translator"));
                p.setPublisherID(rs.getInt("PublisherID"));
                p.setSupplierID(rs.getInt("SupplierID"));
                p.setLanguage(rs.getString("Language"));
                p.setSize(rs.getString("Size"));
                p.setWeight(rs.getDouble("Weight"));
                p.setNumberOfPage(rs.getInt("NumberOfPage"));
                p.setFormat(rs.getString("Format"));
                p.setImage(rs.getInt("Image"));
                p.setPublishDate(rs.getDate("PublishDate"));
                p.setPublishingLicense(rs.getString("PublishingLicense"));
                p.setDescription(rs.getString("Description"));
                p.setDiscontinued(rs.getBoolean("Discontinued"));
                productList.add(p);

            }
        } catch (Exception e) {
        }
        return productList;
    }

    public ArrayList<Product_Manage> getProducts(boolean isAdmin) {
        ArrayList<Product_Manage> productList = new ArrayList<>();
        try {
            String sql = "select * from Products";
            String sql2 = "select * from Products where Discontinued=?";
            PreparedStatement ps;
            if (isAdmin == true) {
                ps = connection.prepareStatement(sql);
            } else {
                ps = connection.prepareStatement(sql2);
                ps.setInt(1, 0);
            }
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }
        return productList;
    }

    public Category getCategoryByID(int CategoryID) {

        String sql = "select * from Categories where CategoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CategoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("Description"));
                c.setPicture(rs.getString("Picture"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();

        String sql = "select * from Categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("CategoryID"));
                c.setCategoryName(rs.getString("CategoryName"));
                c.setDescription(rs.getString("Description"));
                c.setPicture(rs.getString("Picture"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Author> getAllAuthor() {
        List<Author> list = new ArrayList<>();

        String sql = "select * from Authors";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Author c = new Author();
                c.setAuthorID(rs.getInt("AuthorID"));
                c.setAuthorName(rs.getString("AuthorName"));
                c.setPhoneNumber(rs.getString("PhoneNumber"));
                c.setAddress(rs.getString("Address"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Discount> getAllVoucher() {

        List<Discount> list = new ArrayList<>();

        String sql = "select * from Discount";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                v.setDiscountID(rs.getString("DiscountID"));
                v.setTitle(rs.getString("Title"));
                v.setDescription(rs.getString("Description"));
                v.setStartDate(rs.getTimestamp("StartDate").toLocalDateTime());
                v.setEndDate(rs.getTimestamp("EndDate").toLocalDateTime());
                v.setMinOrderValue(rs.getDouble("MinOrderValue"));
                v.setPercentage(rs.getDouble("Percentage"));
                v.setType(rs.getInt("Type"));
                v.setQuantity(rs.getInt("Quantity"));
                list.add(v);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean CreateVoucher(Discount v) {
        int result = 0;
        String sql = "INSERT INTO Discount (DiscountID,Title, Description, StartDate, EndDate, MinOrderValue, Percentage, Type, Quantity) VALUES (?,?,?,?,?,?,?,?,?)";
        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, v.getDiscountID());
            ps.setString(2, v.getTitle());
            ps.setString(3, v.getDescription());
            ps.setObject(4, v.getStartDate());
            ps.setObject(5, v.getEndDate());
            ps.setDouble(6, v.getMinOrderValue());
            ps.setDouble(7, v.getPercentage());
            ps.setInt(8, v.getType());
            ps.setInt(9, v.getQuantity());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result > 0;
    }

    public void DeleteVoucher(String id) {
        String sql = "DELETE FROM Discount where DiscountID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Discount getVoucherByID(String id) {
        try {
            String sql = "select * from Discount where DiscountID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String DiscountID = rs.getString("DiscountID");
                String Title = rs.getString("Title");
                String Description = rs.getString("Description");
                LocalDateTime StartDate = rs.getTimestamp("StartDate").toLocalDateTime();
                LocalDateTime EndDate = rs.getTimestamp("EndDate").toLocalDateTime();
                double MinOrderValue = rs.getDouble("MinOrderValue");
                double Percentage = rs.getDouble("Percentage");
                int Type = rs.getInt("Type");
                int Quantity = rs.getInt("Quantity");

                Discount a = new Discount(DiscountID, Title, Description, StartDate, EndDate, MinOrderValue, Percentage, Type, Quantity);
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public boolean editVoucher(Discount v) {
        int result = 0;
        try {
            String sql = "UPDATE Discount\n"
                    + "SET Title = ?, \n"
                    + "    Description = ?, \n"
                    + "    StartDate = ?,\n"
                    + "    EndDate = ?,\n"
                    + "    Percentage = ?,\n"
                    + "    Quantity = ?\n"
                    + "WHERE DiscountID = ?";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, v.getTitle());
            ps.setString(2, v.getDescription());
            ps.setObject(3, v.getStartDate());
            ps.setObject(4, v.getEndDate());
            ps.setDouble(5, v.getPercentage());
            ps.setInt(6, v.getQuantity());
            ps.setString(7, v.getDiscountID());

            result = ps.executeUpdate();

        } catch (Exception e) {
        }
        return result > 0;
    }

    public ArrayList<Discount> SearchVoucherByID(String search) {
        ArrayList<Discount> VoucherList = new ArrayList<>();
        try {
            String sql = "select * from Discount where DiscountID like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                v.setDiscountID(rs.getString("DiscountID"));
                v.setTitle(rs.getString("Title"));
                v.setDescription(rs.getString("Description"));
                v.setStartDate(rs.getTimestamp("StartDate").toLocalDateTime());
                v.setEndDate(rs.getTimestamp("EndDate").toLocalDateTime());
                v.setMinOrderValue(rs.getDouble("MinOrderValue"));
                v.setPercentage(rs.getDouble("Percentage"));
                v.setType(rs.getInt("Type"));
                v.setQuantity(rs.getInt("Quantity"));
                VoucherList.add(v);
            }
        } catch (Exception e) {
        }
        return VoucherList;
    }

}
