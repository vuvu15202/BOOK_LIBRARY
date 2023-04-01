/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;
import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class Discount {
    private String DiscountID;
    private String Title;
    private String Description;
    private LocalDateTime StartDate;
    private LocalDateTime EndDate;
    private double MinOrderValue;
    private double Percentage;
    private int Type;
    private int Quantity;

    public Discount(String DiscountID, String Title, String Description, LocalDateTime StartDate, LocalDateTime EndDate, double MinOrderValue, double Percentage, int Type, int Quantity) {
        this.DiscountID = DiscountID;
        this.Title = Title;
        this.Description = Description;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.MinOrderValue = MinOrderValue;
        this.Percentage = Percentage;
        this.Type = Type;
        this.Quantity = Quantity;
    }

    public Discount(String DiscountID, String Title, String Description, LocalDateTime StartDate, LocalDateTime EndDate, double Percentage, int Quantity) {
        this.DiscountID = DiscountID;
        this.Title = Title;
        this.Description = Description;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.Percentage = Percentage;
        this.Quantity = Quantity;
    }
    
    

    public Discount() {
    }

    public String getDiscountID() {
        return DiscountID;
    }

    public void setDiscountID(String DiscountID) {
        this.DiscountID = DiscountID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public LocalDateTime getStartDate() {
        return StartDate;
    }

    public void setStartDate(LocalDateTime StartDate) {
        this.StartDate = StartDate;
    }

    public LocalDateTime getEndDate() {
        return EndDate;
    }

    public void setEndDate(LocalDateTime EndDate) {
        this.EndDate = EndDate;
    }

    public double getMinOrderValue() {
        return MinOrderValue;
    }

    public void setMinOrderValue(double MinOrderValue) {
        this.MinOrderValue = MinOrderValue;
    }

    public double getPercentage() {
        return Percentage;
    }

    public void setPercentage(double Percentage) {
        this.Percentage = Percentage;
    }

    public int getType() {
        return Type;
    }

    public void setType(int Type) {
        this.Type = Type;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

        
    
    
}


