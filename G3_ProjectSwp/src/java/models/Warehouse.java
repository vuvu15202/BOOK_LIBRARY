/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class Warehouse {
    private int WarehouseID;
    private String Location;
    private String PhoneNumber;

    public Warehouse(int WarehouseID, String Location, String PhoneNumber) {
        this.WarehouseID = WarehouseID;
        this.Location = Location;
        this.PhoneNumber = PhoneNumber;
    }

    public int getWarehouseID() {
        return WarehouseID;
    }

    public void setWarehouseID(int WarehouseID) {
        this.WarehouseID = WarehouseID;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    @Override
    public String toString() {
        return "Warehouse{" + "WarehouseID=" + WarehouseID + ", Location=" + Location + ", PhoneNumber=" + PhoneNumber + '}';
    }
    
    
}
