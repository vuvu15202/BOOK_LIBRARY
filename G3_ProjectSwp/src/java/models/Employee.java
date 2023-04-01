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
public class Employee {

    private int employeeID;
    private String firstName;
    private String lastName;
    private boolean gender;
    private int departmentID;
    private String title;
    private String titleOfCourtesy;
    private Date birthDate;
    private Date hireDate;
    private String address;
    private String phoneNumber;
    private boolean status;

    public Employee() {
    }

    public Employee(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Employee(int employeeID, String firstName, String lastName, boolean gender, String title, String titleOfCourtesy, String address, String phoneNumber) {
        this.employeeID = employeeID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.title = title;
        this.titleOfCourtesy = titleOfCourtesy;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public Employee(int employeeID, String firstName, String lastName, boolean gender, String title, String titleOfCourtesy, Date birthDate, String address, String phoneNumber) {
        this.employeeID = employeeID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.title = title;
        this.titleOfCourtesy = titleOfCourtesy;
        this.birthDate = birthDate;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public Employee(int employeeID, String firstName, String lastName, boolean gender, int departmentID, String title, String titleOfCourtesy, Date birthDate, Date hireDate, String address, String phoneNumber, boolean status) {
        this.employeeID = employeeID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.departmentID = departmentID;
        this.title = title;
        this.titleOfCourtesy = titleOfCourtesy;
        this.birthDate = birthDate;
        this.hireDate = hireDate;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleOfCourtesy() {
        return titleOfCourtesy;
    }

    public void setTitleOfCourtesy(String titleOfCourtesy) {
        this.titleOfCourtesy = titleOfCourtesy;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Employee{" + "employeeID=" + employeeID + ", firstName=" + firstName + ", lastName=" + lastName + ", gender=" + gender + ", departmentID=" + departmentID + ", title=" + title + ", titleOfCourtesy=" + titleOfCourtesy + ", birthDate=" + birthDate + ", hireDate=" + hireDate + ", address=" + address + ", phoneNumber=" + phoneNumber + ", status=" + status + '}';
    }

}
