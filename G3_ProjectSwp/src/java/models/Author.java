/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class Author {
    private int AuthorID;
    private String AuthorName;
    private String PhoneNumber;
    private String Address;

    public Author(int AuthorID, String AuthorName, String PhoneNumber, String Address) {
        this.AuthorID = AuthorID;
        this.AuthorName = AuthorName;
        this.PhoneNumber = PhoneNumber;
        this.Address = Address;
    }

    public Author() {

    }

    public int getAuthorID() {
        return AuthorID;
    }

    public void setAuthorID(int AuthorID) {
        this.AuthorID = AuthorID;
    }

    public String getAuthorName() {
        return AuthorName;
    }

    public void setAuthorName(String AuthorName) {
        this.AuthorName = AuthorName;
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
        return "Author{" + "AuthorID=" + AuthorID + ", AuthorName=" + AuthorName + ", PhoneNumber=" + PhoneNumber + ", Address=" + Address + '}';
    }
    
    
}
