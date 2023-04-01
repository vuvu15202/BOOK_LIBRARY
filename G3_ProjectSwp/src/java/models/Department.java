/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author user
 */
public class Department {
    private int DepartmentID;
    private String DepartmentName;
    private String DepartmentType;

    public Department(int DepartmentID, String DepartmentName, String DepartmentType) {
        this.DepartmentID = DepartmentID;
        this.DepartmentName = DepartmentName;
        this.DepartmentType = DepartmentType;
    }

    public int getDepartmentID() {
        return DepartmentID;
    }

    public void setDepartmentID(int DepartmentID) {
        this.DepartmentID = DepartmentID;
    }

    public String getDepartmentName() {
        return DepartmentName;
    }

    public void setDepartmentName(String DepartmentName) {
        this.DepartmentName = DepartmentName;
    }

    public String getDepartmentType() {
        return DepartmentType;
    }

    public void setDepartmentType(String DepartmentType) {
        this.DepartmentType = DepartmentType;
    }

    @Override
    public String toString() {
        return "Department{" + "DepartmentID=" + DepartmentID + ", DepartmentName=" + DepartmentName + ", DepartmentType=" + DepartmentType + '}';
    }
    
    
}
