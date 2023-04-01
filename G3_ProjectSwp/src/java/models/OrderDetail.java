/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class OrderDetail {
    private int OrderID;
    private int ProductID;
    private int WarehouseID;
    private double SalePrice;
    private int Quantity;
    private String DiscountID;
    private boolean Reviewed;

    public OrderDetail(int OrderID, int ProductID, int WarehouseID, double SalePrice, int Quantity, String DiscountID) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.WarehouseID = WarehouseID;
        this.SalePrice = SalePrice;
        this.Quantity = Quantity;
        this.DiscountID = DiscountID;
    }

    public OrderDetail(int OrderID, int ProductID, int WarehouseID, double SalePrice, int Quantity, String DiscountID, boolean Reviewed) {
        this.OrderID = OrderID;
        this.ProductID = ProductID;
        this.WarehouseID = WarehouseID;
        this.SalePrice = SalePrice;
        this.Quantity = Quantity;
        this.DiscountID = DiscountID;
        this.Reviewed = Reviewed;
    }

    public OrderDetail() {
    }

    
    public boolean isReviewed() {
        return Reviewed;
    }

    public void setReviewed(boolean isReviewed) {
        this.Reviewed = isReviewed;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
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

    public double getSalePrice() {
        return SalePrice;
    }

    public void setSalePrice(double SalePrice) {
        this.SalePrice = SalePrice;
    }

    public String getDiscountID() {
        return DiscountID;
    }

    public void setDiscountID(String DiscountID) {
        this.DiscountID = DiscountID;
    }

    public int getWarehouseID() {
        return WarehouseID;
    }

    public void setWarehouseID(int WarehouseID) {
        this.WarehouseID = WarehouseID;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "OrderID=" + OrderID + ", ProductID=" + ProductID + ", WarehouseID=" + WarehouseID + ", SalePrice=" + SalePrice + ", Quantity=" + Quantity + ", DiscountID=" + DiscountID + '}';
    }

    

    
    
    
    
}
