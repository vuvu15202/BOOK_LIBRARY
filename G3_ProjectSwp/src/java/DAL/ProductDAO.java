/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import models.Product;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    public Product getObject(ResultSet rs) {
        Product product = null;
        try {
            while (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int CategoryID = rs.getInt("CategoryID");
                int GenreID = rs.getInt("GenreID");
                double CoverPrice = rs.getDouble("CoverPrice");
                double SalePrice = rs.getDouble("SalePrice");
                int AuthorID = rs.getInt("AuthorID");
                String Translator = rs.getString("Translator");
                int PublisherID = rs.getInt("PublisherID");
                int SupplierID = rs.getInt("SupplierID");
                String Language = rs.getString("Language");
                String Size = rs.getString("Size");
                double Weight = rs.getDouble("Weight");
                int NumberOfPage = rs.getInt("NumberOfPage");
                String Format = rs.getString("Format");
                String Image = rs.getString("Image");
                Date PublishDate = rs.getDate("PublishDate");
                String PublishingLicense = rs.getString("PublishingLicense");
                String Description = rs.getString("Description");
                boolean Discontinued = rs.getBoolean("Discontinued");
                double aveRating = getAveRatingOfProduct(ProductID);
                int availableInStock = getAvailableInStock(ProductID);
                product = new Product(ProductID, ProductName, CategoryID, GenreID,
                        CoverPrice, SalePrice, AuthorID, Translator, PublisherID, SupplierID, Language, Size, Weight,
                        NumberOfPage, Format, Image, PublishDate, PublishingLicense, Description, Discontinued,
                        aveRating, availableInStock);
            }
        } catch (Exception e) {
        }
        return product;
    }

    public ArrayList<Product> getObjectList(ResultSet rs) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int CategoryID = rs.getInt("CategoryID");
                int GenreID = rs.getInt("GenreID");
                double CoverPrice = rs.getDouble("CoverPrice");
                double SalePrice = rs.getDouble("SalePrice");
                int AuthorID = rs.getInt("AuthorID");
                String Translator = rs.getString("Translator");
                int PublisherID = rs.getInt("PublisherID");
                int SupplierID = rs.getInt("SupplierID");
                String Language = rs.getString("Language");
                String Size = rs.getString("Size");
                double Weight = rs.getDouble("Weight");
                int NumberOfPage = rs.getInt("NumberOfPage");
                String Format = rs.getString("Format");
                String Image = rs.getString("Image");
                Date PublishDate = rs.getDate("PublishDate");
                String PublishingLicense = rs.getString("PublishingLicense");
                String Description = rs.getString("Description");
                boolean Discontinued = rs.getBoolean("Discontinued");
                double aveRating = getAveRatingOfProduct(ProductID);
                int availableInStock = getAvailableInStock(ProductID);
                productList.add(new Product(ProductID, ProductName, CategoryID, GenreID, CoverPrice, SalePrice, AuthorID,
                        Translator, PublisherID, SupplierID, Language, Size, Weight, NumberOfPage, Format,
                        Image, PublishDate, PublishingLicense, Description, Discontinued, aveRating, availableInStock));
            }
        } catch (Exception e) {
        }
        return productList;
    }

    public ArrayList<Product> getProducts(boolean isAdmin) {
        ArrayList<Product> productList = new ArrayList<>();
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
    

    public ArrayList<Product> getProductsByCatNSearch(String sample, int CatID, boolean isAdmin) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where CategoryID=? AND ProductName like ?";
            String sql2 = "select * from Products where CategoryID=? AND ProductName like ? AND Discontinued=?";
            PreparedStatement ps;
            if (isAdmin == true) {
                ps = connection.prepareStatement(sql);
                ps.setInt(1, CatID);
                ps.setString(2, "%" + sample + "%");
            } else {
                ps = connection.prepareStatement(sql2);
                ps.setInt(1, CatID);
                ps.setString(2, "%" + sample + "%");
                ps.setInt(3, 0);
            }
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }
        return productList;
    }
    
    
    public ArrayList<Product> getProductListByFilterAdmin(String sample, int CatID, boolean discontinued, boolean ouOfStock) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
            
            if(CatID!=0){
                for (int i = 0; i < productList.size(); i++) {
                    if(!(productList.get(i).getCategoryID()==CatID)){
                        productList.remove(i);
                    }
                }
            }
            
            if(sample.length()!=0){
                for (int i = 0; i < productList.size(); i++) {
                    if(!productList.get(i).getProductName().contains(sample)){
                        productList.remove(i);
                    }
                }
            }
            
            if(sample.length()!=0){
                for (int i = 0; i < productList.size(); i++) {
                    if(!productList.get(i).isDiscontinued()==false){
                        productList.remove(i);
                    }
                }
            }
            if(sample.length()!=0){
                for (int i = 0; i < productList.size(); i++) {
                    if(productList.get(i).getAvailableInStock()>=0){
                        productList.remove(i);
                    }
                }
            }
            
        } catch (Exception e) {

        }
        return productList;
    }

    public ArrayList<Product> getHotProduct() {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select top 4 * from (select COUNT(OrderID) as numberOrder, ProductID from [Order Details] \n"
                    + "group by ProductID) as A inner join Products on A.ProductID=Products.ProductID ORDER BY numberOrder DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }
        return productList;
    }

    public Product getProductInfor(int proID) {
        Product product = null;
        try {
            String sql = "select * from Products where ProductID = ? ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, proID);
            ResultSet rs = ps.executeQuery();
            product = getObject(rs);
        } catch (Exception e) {
        }
        return product;
    }

    public Product checkProExistInOrder(int proID) {
        Product product = null;
        try {
            String sql = "select DISTINCT * from Products p, [Order Details] od where p.ProductID=od.ProductID AND p.ProductID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, proID);
            ResultSet rs = ps.executeQuery();
            product = getObject(rs);
        } catch (Exception e) {
        }
        return product;
    }

    public Product getComingSoon() {
        Product product = null;
        try {
            String sql = "select TOP 1 * from Products where PublishDate > getdate() order by PublishDate ASC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            product = getObject(rs);
        } catch (Exception e) {
        }
        return product;
    }

    public double getAveRatingOfProduct(int productID) {
        double aveRating = 0;
        try {
            String sql = "select Avg(CAST(Rating AS float)) as [aveRating] from Reviews where ProductID= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                aveRating = rs.getDouble("aveRating");
            }
        } catch (Exception e) {
        }//finally{ connection.close();}
        return aveRating;
    }

    public int getAvailableInStock(int productID) {
        int availableInStock = 0;
        int Pending = 0;
        try {
            String sql1 = "select SUM(UnitsInStock) as [AvailableInStock] from Inventories where ProductID=?";
            String sql2 = "select SUM(Quantity) as [Pending] from Orders od, [Order Details] odd where od.OrderID=odd.OrderID AND ShippedDate IS NULL AND odd.ProductID = ?";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps1.setInt(1, productID);
            ps2.setInt(1, productID);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                availableInStock = rs1.getInt("AvailableInStock");
            }
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Pending = rs2.getInt("Pending");
            }
        } catch (Exception e) {
        }//finally{ connection.close();}
        return availableInStock - Pending;
    }

    public ArrayList<Product> getProductListOutOfStock() {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products";
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //doc du lieu tu 'rs' gan cho cac bien cuc bo
                int ProductID = rs.getInt("ProductID");
                String ProductName = rs.getString("ProductName");
                int CategoryID = rs.getInt("CategoryID");
                int GenreID = rs.getInt("GenreID");
                double CoverPrice = rs.getDouble("CoverPrice");
                double SalePrice = rs.getDouble("SalePrice");
                int AuthorID = rs.getInt("AuthorID");
                String Translator = rs.getString("Translator");
                int PublisherID = rs.getInt("PublisherID");
                int SupplierID = rs.getInt("SupplierID");
                String Language = rs.getString("Language");
                String Size = rs.getString("Size");
                double Weight = rs.getDouble("Weight");
                int NumberOfPage = rs.getInt("NumberOfPage");
                String Format = rs.getString("Format");
                String Image = rs.getString("Image");
                Date PublishDate = rs.getDate("PublishDate");
                String PublishingLicense = rs.getString("PublishingLicense");
                String Description = rs.getString("Description");
                boolean Discontinued = rs.getBoolean("Discontinued");
                double aveRating = getAveRatingOfProduct(ProductID);
                int availableInStock = getAvailableInStock(ProductID);
                if (!(availableInStock >= 1)) {
                    productList.add(new Product(ProductID, ProductName, CategoryID, GenreID, CoverPrice, SalePrice, AuthorID,
                            Translator, PublisherID, SupplierID, Language, Size, Weight, NumberOfPage, Format,
                            Image, PublishDate, PublishingLicense, Description, Discontinued, aveRating, availableInStock));
                }
            }
        } catch (Exception e) {

        }
        return productList;
    }

    public ArrayList<Product> getProductbySearch(String sample) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where ProductName like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + sample + "%");
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getProductListByCategoryID(int catID) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where CategoryID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, catID);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getProductListByGenreID(int genreID) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where GenreID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, genreID);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getProductByAuthorID(int authorID) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where AuthorID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, authorID);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getProductListBySupplierID(int SupplierID) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where SupplierID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, SupplierID);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getProductListDiscontinued() {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Products] WHERE [Discontinued] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, 1);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> searchProductListByPriceDomain(double from, double to) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where SalePrice between ? AND ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, from);
            ps.setDouble(2, to);
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> getNewReleaseList(int mode) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "";
            PreparedStatement ps;
            if (mode != 0) {
                sql = "select TOP 3 * from Products WHERE PublishDate IS NOT NULL AND PublishDate < getdate() AND Discontinued = 0  Order by PublishDate DESC";
                ps = connection.prepareStatement(sql);
                //ps.setInt(1, mode);
            } else {
                sql = "select * from Products WHERE PublishDate IS NOT NULL AND Discontinued = 0 Order by PublishDate DESC";
                ps = connection.prepareStatement(sql);
            }
            ResultSet rs = ps.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public void update(Product p) throws SQLException {
        try {
            //connection = DBContext.getInstance().getConnection();

            String sql = "update Products SET "
                    + "ProductName = ?, " //1
                    + "CategoryID = ?, " //2
                    + "GenreID = ?, " //3
                    + "CoverPrice = ?, " //4
                    + "SalePrice = ?, " //5
                    + "AuthorID = ?, " //6
                    + "Translator = ?, " //7
                    + "PublisherID = ?, " //8
                    + "SupplierID = ?, " //9
                    + "Language = ?, " //10
                    + "Size = ?, " //11
                    + "Weight = ?, " //12
                    + "NumberOfPage = ?, " //13
                    + "Format = ?, " //14
                    + "Image = ?, " //15
                    + "PublishDate = ?, " //16
                    + "PublishingLicense = ?, " //17
                    + "Description = ?, " //18
                    + "Discontinued = ? " //19
                    + "where ProductID = ?";  //20

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setInt(2, p.getCategoryID());
            ps.setInt(3, p.getGenreID());
            ps.setDouble(4, p.getCoverPrice());
            ps.setDouble(5, p.getSalePrice());
            ps.setInt(6, p.getAuthorID());
            ps.setString(7, p.getTranslator());
            ps.setInt(8, p.getPublisherID());
            ps.setInt(9, p.getSupplierID());
            ps.setString(10, p.getLanguage());
            ps.setString(11, p.getSize());
            ps.setDouble(12, p.getWeight());
            ps.setInt(13, p.getNumberOfPage());
            ps.setString(14, p.getFormat());
            ps.setString(15, p.getImage());
            ps.setDate(16, p.getPublishDate());
            ps.setString(17, p.getPublishingLicense());
            ps.setString(18, p.getDescription());
            ps.setBoolean(19, p.isDiscontinued());
            ps.setInt(20, p.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int Delete(int ID) throws SQLException {
        int result = 0;
        String sql1 = "DELETE FROM Products WHERE ProductID = ?";
        //String sql2 = "delete from [Order Details] where ProductID = ?";
        try {
            //connection = DBContext.getInstance().getConnection();
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            //PreparedStatement ps2 = connection.prepareStatement(sql2); 
            ps1.setInt(1, ID);
            //ps2.setInt(1, ID);
            result = ps1.executeUpdate();
            //ps2.executeUpdate();
        } catch (SQLException e) {
            connection.rollback();
        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
        return result > 0 ? 1 : 0;
    }

    public void CreateProduct(Product p) {
        String sql = "insert into Products values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            //connection = DBContext.getInstance().getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getProductName());
            ps.setInt(2, p.getCategoryID());
            ps.setInt(3, p.getGenreID());
            ps.setDouble(4, p.getCoverPrice());
            ps.setDouble(5, p.getSalePrice());
            ps.setInt(6, p.getAuthorID());
            ps.setString(7, p.getTranslator());
            ps.setInt(8, p.getPublisherID());
            ps.setInt(9, p.getSupplierID());
            ps.setString(10, p.getLanguage());
            ps.setString(11, p.getSize());
            ps.setDouble(12, p.getWeight());
            ps.setInt(13, p.getNumberOfPage());
            ps.setString(14, p.getFormat());
            ps.setString(15, p.getImage());
            ps.setDate(16, p.getPublishDate());
            ps.setString(17, p.getPublishingLicense());
            ps.setString(18, p.getDescription());
            ps.setBoolean(19, p.isDiscontinued());
            ps.executeUpdate();
        } catch (SQLException e) {

        } finally {
            //DBContext.releaseJBDCObject(rs, ps, connection);
        }
    }

    public void deleteProduct(int id) {
        String sql = "select * from [Order Details] where ProductID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int OrderID = rs.getInt("OrderID");
                sql = "delete from Reviews where OrderID=?";
                st = connection.prepareStatement(sql);
                st.setInt(1, OrderID);
                st.executeUpdate();
            }
            sql = "delete from Inventories where ProductID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            sql = "delete from [Order Details] where ProductID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            sql = "delete from Cart where ProductID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            sql = "delete from Products where ProductID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Product> SearchProductByName(String search) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where ProductName like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> SearchProductByLanguage(String language) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where Language like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + language + "%");
            ResultSet rs = st.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }

    public ArrayList<Product> SearchProductByFormat(String format) {
        ArrayList<Product> productList = new ArrayList<>();
        try {
            String sql = "select * from Products where Format like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + format + "%");
            ResultSet rs = st.executeQuery();
            productList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return productList;
    }


    public ArrayList<Product> getProductHighRating() {
        ArrayList<Product> listHighRating = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Products";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            listHighRating = getObjectList(rs);
        } catch (Exception e) {
        }
        return listHighRating;

    }

    public static void main(String[] args) {
//        ProductDAO abc = new ProductDAO();
//        System.out.println(abc.getProductListBySupplierID(1).get(0).getSupplierID());
        ArrayList<Product> listHighRating = new ProductDAO().getProductHighRating();
        System.out.println(listHighRating);
    }
}
