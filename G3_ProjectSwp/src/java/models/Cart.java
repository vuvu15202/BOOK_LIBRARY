/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;
import DAL.ProductDAO;

/**
 *
 * @author user
 */
public class Cart {
    private int AccountID,ProductID,Quantity;

    public Cart(int AccountID, int ProductID, int Quantity) {
        this.AccountID = AccountID;
        this.ProductID = ProductID;
        this.Quantity = Quantity;
    }
    public Cart( int ProductID, int Quantity) {
        this.ProductID = ProductID;
        this.Quantity = Quantity;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

}
