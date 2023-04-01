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
import models.Supplier;
public class SupplierDAO extends DBContext{
    public ArrayList<Supplier> getObjectList(ResultSet rs){
        ArrayList<Supplier> supplierList = new ArrayList<>();
        try {
            while (rs.next()) {
                int SupplierId = rs.getInt("SupplierID");
                String Suppliername = rs.getString("SupplierName");
                String Email = rs.getString("Email");
                String Fax = rs.getString("Fax");
                String PhoneNumber = rs.getString("PhoneNumber");
                String Address = rs.getString("Address");
                supplierList.add(new Supplier(SupplierId, Suppliername, Email, Fax, PhoneNumber, Address));
            }
        } catch (Exception e) {
        }
        return supplierList;
    }
    
    public ArrayList<Supplier> getSupplierList(){
        ArrayList<Supplier> supplierList = null;
        try {
            String sql = "select * from Supplier";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            supplierList = getObjectList(rs);
        } catch (Exception e) {
        }
        return supplierList;
    }
    
        public static void main(String[] args) {
        SupplierDAO abc = new SupplierDAO();
        System.out.println(abc.getSupplierList());
    }
}
