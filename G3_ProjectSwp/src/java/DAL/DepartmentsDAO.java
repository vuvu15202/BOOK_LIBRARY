/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Department;

/**
 *
 * @author Thanh Dao
 */
public class DepartmentsDAO extends DBContext {

    public ArrayList<Department> getAllDepartments() {
        ArrayList<Department> depart = new ArrayList<>();
        try {
            String sql = "select * from Departments";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int DepartmentID = Integer.parseInt(rs.getString("DepartmentID"));
                String DepartmentName = rs.getString("DepartmentName");
                String DepartmentType = rs.getString("DepartmentType");
                Department dep = new Department(DepartmentID, DepartmentName, DepartmentType);
                depart.add(dep);
            }
        } catch (Exception e) {
        }
        return depart;

    }
    public static void main(String[] args) {
        DepartmentsDAO bc = new DepartmentsDAO();
                System.out.println(bc.getAllDepartments().get(0).getDepartmentName());
    }
}
