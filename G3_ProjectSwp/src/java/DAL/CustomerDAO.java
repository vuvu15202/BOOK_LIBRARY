/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import models.Customer;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class CustomerDAO extends DBContext{
    public Customer getObject(ResultSet rs){
        Customer cus = null;
        try {
            while(rs.next()){
                int CustomerID = rs.getInt("CustomerID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                String ContactTitle = rs.getString("ContactTitle");
                Date DateOfBirth = rs.getDate("DateOfBirth");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                Date CreateDate = rs.getDate("CreateDate");
                cus = new Customer(CustomerID, FirstName, LastName,Gender, ContactTitle,DateOfBirth, Address,PhoneNumber,CreateDate);
            }
        } catch (Exception e) {
        }
        return cus;
    }
    public ArrayList<Customer> getObjectList(ResultSet rs){
        ArrayList<Customer> cusList = new ArrayList<>();
        try {
            while(rs.next()){
                int CustomerID = rs.getInt("CustomerID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                String ContactTitle = rs.getString("ContactTitle");
                Date DateOfBirth = rs.getDate("DateOfBirth");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                Date CreateDate = rs.getDate("CreateDate");
                cusList.add(new Customer(CustomerID, FirstName, LastName,
                        Gender, ContactTitle,DateOfBirth, Address,PhoneNumber,CreateDate));
            }
        } catch (Exception e) {
        }
        return cusList;
    }
    public Customer getCustomerByEmail(String email){
        Customer cus = null;
        try {
            String sql = "select * from Customers c,Accounts a where c.CustomerID=a.CustomerID AND a.Email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            cus = getObject(rs);
        } catch (Exception e) {
        }
        return cus;
    }
    
    
    
    public Customer getCustomerByID(int ID){
        Customer cus = null;
        try {
            String sql = "select * from Customers c where c.CustomerID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            cus = getObject(rs);
        } catch (Exception e) {
        }
        return cus;
    }
    
    public ArrayList<Customer> getAllCustomers(){
        ArrayList<Customer> cusList = new ArrayList<>();
        try {
            String sql = "select * from Customers";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            cusList = getObjectList(rs);
        } catch (Exception e) {
        }
        return cusList;
    }
    
    public boolean createCustomer(Customer cus){
        int result1=0;
            try {
                String sql="insert into Customers(CustomerID, FirstName , LastName,ContactTitle,DateOfBirth,Address,PhoneNumber,CreateDate) values(?,?,?,?,?,?,?,GETDATE())";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setInt(1,cus.getCustomerID() );
                ps.setString(2, cus.getFirstName());
                ps.setString(3,cus.getLastName() );
                ps.setString(4, cus.getContactTitle());
                ps.setDate(5, cus.getDateOfBirth());
                ps.setString(6,cus.getAddress());
                ps.setString(7, cus.getPhoneNumber());
                //ps.setDate(8, cus.getCreateDate());
                result1 = ps.executeUpdate();
            } catch (Exception e) {
                return false;
            }
            return result1>0;
            
    }
    public String randomString(int n) {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(n);
        for (int i = 0; i < n; i++) {
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        return sb.toString();
    }
    
    public ArrayList<Customer> getNewCustomer(int month){
        ArrayList<Customer> cusList = new ArrayList<>();
        try {
            String sql = "select * from Customers where  Year(CreateDate)=YEAR(GETDATE()) AND MONTH(CreateDate)=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            cusList = getObjectList(rs);
        } catch (Exception e) {
            
        }//finally{ connection.close();}
        return cusList;
    }
    
    public ArrayList<Customer> getTotalNumberOfGuest(){
        ArrayList<Customer> cusList = new ArrayList<>();
        try {
            String sql = "select * from Customers where CustomerID not in "
                    + "(select c.CustomerID from Accounts a , Customers c where a.CustomerID=c.CustomerID)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            cusList = getObjectList(rs);
        } catch (Exception e) {
        }
        return cusList;
    }
    
    public void deleteCustomer(int id){
        String sql="select top 1 AccountID from Accounts where CustomerID=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                int AccountID=rs.getInt("AccountID");
                sql="delete from Cart where AccountID=?";
                st=connection.prepareStatement(sql);
                st.setInt(1, AccountID);
                st.executeUpdate();
                sql="delete from Accounts where CustomerID=?";
                st=connection.prepareStatement(sql);
                st.setInt(1, id);
                st.executeUpdate();
            }
            
            sql="select OrderID from orders where CustomerId=?";
            st=connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs2=st.executeQuery();
            while(rs2.next()){
                int OrderID=rs2.getInt("OrderID");
                sql="delete from [Order Details] where OrderID=?";
                st=connection.prepareStatement(sql);
                st.setInt(1, OrderID);
                st.executeUpdate();
            }
             sql="delete from Orders where CustomerID=?";
                st=connection.prepareStatement(sql);
                st.setInt(1, id);
                st.executeUpdate();
            sql="delete from customers where CustomerId=?";
            st=connection.prepareStatement(sql);
            st.setInt(1,id);
            st.executeUpdate();
            
          
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public List<Customer> searchByName(String search){
        List<Customer> list=new ArrayList<>();
        String sql="select * from Customers where FirstName like ? OR LastName like ?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, "%"+search+"%");
            st.setString(2, "%"+search+"%");
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Customer c=new Customer();
                c.setCustomerID(rs.getInt("CustomerID"));
                c.setFirstName(rs.getString("FirstName"));
                c.setLastName(rs.getString("LastName"));
               c.setGender(rs.getBoolean("Gender"));
                c.setContactTitle(rs.getString("ContactTitle"));
                c.setDateOfBirth(rs.getDate("DateOfBirth"));
                c.setAddress(rs.getString("Address"));
               c.setPhoneNumber(rs.getString("PhoneNumber"));
                c.setCreateDate(rs.getDate("CreateDate"));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    
//    public static void main(String[] args) {
//        Customer cus = new CustomerDAO().getCustomerByID("0oYbA");
//        System.out.println(cus);
//    }
}
