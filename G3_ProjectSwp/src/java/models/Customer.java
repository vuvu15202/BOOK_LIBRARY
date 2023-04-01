/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;

/**
 *
 * @author user
 */
public class Customer {
    private int CustomerID;
    private String FirstName;
    private String LastName;
    private boolean Gender;
    private String ContactTitle;
    private Date DateOfBirth;
    private String Address;
    private String PhoneNumber;
    private Date CreateDate;

    
    public Customer() {
    }

    public Customer(int CustomerID, String FirstName, String LastName, String ContactTitle, String Address, String PhoneNumber) {
        this.CustomerID = CustomerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.ContactTitle = ContactTitle;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
    }
    
    

    public Customer(int CustomerID, String FirstName, String LastName, boolean Gender, String ContactTitle, String Address, String PhoneNumber, Date CreateDate) {
        this.CustomerID = CustomerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Gender = Gender;
        this.ContactTitle = ContactTitle;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.CreateDate = CreateDate;
    }
    
    

    public Customer(int CustomerID, String FirstName, String LastName, boolean Gender, String ContactTitle, Date DateOfBirth, String Address, String PhoneNumber, Date CreateDate) {
        this.CustomerID = CustomerID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Gender = Gender;
        this.ContactTitle = ContactTitle;
        this.DateOfBirth = DateOfBirth;
        this.Address = Address;
        this.PhoneNumber = PhoneNumber;
        this.CreateDate = CreateDate;
    }

    
    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getContactTitle() {
        return ContactTitle;
    }

    public void setContactTitle(String ContactTitle) {
        this.ContactTitle = ContactTitle;
    }

    public Date getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(Date DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public Date getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(Date CreateDate) {
        this.CreateDate = CreateDate;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    @Override
    public String toString() {
        return "Customer{" + "CustomerID=" + CustomerID + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Gender=" + Gender + ", ContactTitle=" + ContactTitle + ", DateOfBirth=" + DateOfBirth + ", Address=" + Address + ", PhoneNumber=" + PhoneNumber + ", CreateDate=" + CreateDate + '}';
    }

    
    
    
    
}
