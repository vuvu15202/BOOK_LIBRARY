/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class Supplier {
    private int SupplierID;
    private String SupplierName;
    private String Email;
    private String Fax;
    private String PhoneNumber;
    private String Address;

    public Supplier(int SupplierID, String SupplierName, String Email, String Fax, String PhoneNumber, String Address) {
        this.SupplierID = SupplierID;
        this.SupplierName = SupplierName;
        this.Email = Email;
        this.Fax = Fax;
        this.PhoneNumber = PhoneNumber;
        this.Address = Address;
    }

    public int getSupplierID() {
        return SupplierID;
    }

    public void setSupplierID(int SupplierId) {
        this.SupplierID = SupplierId;
    }

    public String getSupplierName() {
        return SupplierName;
    }

    public void setSupplierName(String SupplierName) {
        this.SupplierName = SupplierName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFax() {
        return Fax;
    }

    public void setFax(String Fax) {
        this.Fax = Fax;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    @Override
    public String toString() {
        return "Supplier{" + "SupplierId=" + SupplierID + ", Suppliername=" + SupplierName + ", Email=" + Email + ", Fax=" + Fax + ", PhoneNumber=" + PhoneNumber + ", Address=" + Address + '}';
    }
    
    
    
}
