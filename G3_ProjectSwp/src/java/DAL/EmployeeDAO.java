/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import models.Employee;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class EmployeeDAO extends DBContext {

    public Employee getEmloyeeByID(int empID) {
        Employee emp = null;
        try {
            String sql = "select * from Employees where EmployeeID=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, empID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                int DepartmentID = rs.getInt("DepartmentID");
                String Title = rs.getString("Title");
                String TitleOfCourtesy = rs.getString("TitleOfCourtesy");
                Date BirthDate = rs.getDate("BirthDate");
                Date HireDate = rs.getDate("HireDate");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                boolean Status = rs.getBoolean("Status");
                emp = new Employee(EmployeeID, FirstName, LastName, Gender, DepartmentID, Title, TitleOfCourtesy, BirthDate, HireDate, Address, PhoneNumber, Status);
            }
        } catch (Exception e) {
        }
        return emp;
    }

    public ArrayList<Employee> getAllEmloyees() throws SQLException {
        ArrayList<Employee> empList = new ArrayList<>();
        try {
            String sql = "select * from Employees where Status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                int DepartmentID = rs.getInt("DepartmentID");
                String Title = rs.getString("Title");
                String TitleOfCourtesy = rs.getString("TitleOfCourtesy");
                Date BirthDate = rs.getDate("BirthDate");
                Date HireDate = rs.getDate("HireDate");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                boolean Status = rs.getBoolean("Status");
                Employee emp = new Employee(EmployeeID, FirstName, LastName, Gender, DepartmentID, Title, TitleOfCourtesy, BirthDate, HireDate, Address, PhoneNumber, Status);
                empList.add(emp);
            }
        } catch (Exception e) {
        }
        return empList;
    }
 public ArrayList<Employee> getObjectList(ResultSet rs) {
        ArrayList<Employee> empList = new ArrayList<>();
        try {
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                int DepartmentID = rs.getInt("DepartmentID");
                String Title = rs.getString("Title");
                String TitleOfCourtesy = rs.getString("TitleOfCourtesy");
                Date BirthDate = rs.getDate("BirthDate");
                Date HireDate = rs.getDate("HireDate");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                boolean Status = rs.getBoolean("Status");
                Employee emp = new Employee(EmployeeID, FirstName, LastName, Gender, DepartmentID, Title, TitleOfCourtesy, BirthDate, HireDate, Address, PhoneNumber, Status);
                empList.add(emp);
                  }
        } catch (Exception e) {
        }
        return empList;
    }
    public ArrayList<Employee> getAllEmloyeesByID() {
        ArrayList<Employee> empList = new ArrayList<>();
        try {
            String sql = "select * from Employees ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                int DepartmentID = rs.getInt("DepartmentID");
                String Title = rs.getString("Title");
                String TitleOfCourtesy = rs.getString("TitleOfCourtesy");
                Date BirthDate = rs.getDate("BirthDate");
                Date HireDate = rs.getDate("HireDate");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                boolean Status = rs.getBoolean("Status");
                Employee emp = new Employee(EmployeeID, FirstName, LastName, Gender, DepartmentID, Title, TitleOfCourtesy, BirthDate, HireDate, Address, PhoneNumber, Status);
                empList.add(emp);
            }
        } catch (Exception e) {

        }
        return empList;
    }
    public ArrayList<Employee> getListByEmployeeID(int empID) {
        ArrayList<Employee> empList = new ArrayList<>();
        try {
            String sql = "select * from Employees where DepartmentID = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, empID);
            ResultSet rs = ps.executeQuery();
            empList = getObjectList(rs);
        } catch (Exception e) {

        }// finally{connection.close();}
        return empList;
    }

    public int getTotalEmployees() {
        String sql = "select COUNT(*) from Employees";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertEmployee(Employee employee) throws SQLException {
//        enableInsertMode("Employees");
        String sql = "SET IDENTITY_INSERT Employees ON;"
                + " insert into [Employees] ([EmployeeID],[LastName]\n"
                + "      ,[FirstName]\n"
                + "      ,[Gender]\n"
                + "      ,[DepartmentID]\n"
                + "      ,[Title]\n"
                + "      ,[TitleOfCourtesy]\n"
                + "      ,[BirthDate]\n"
                + "      ,[HireDate]\n"
                + "      ,[Address]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[Status])\n"
                + "values(?,?,?,?,?,?,?,?,?,?,?,?);"
                + " SET IDENTITY_INSERT Employees off";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, employee.getEmployeeID());
            ps.setString(2, employee.getLastName());
            ps.setString(3, employee.getFirstName());
            ps.setBoolean(4, employee.isGender());
            ps.setInt(5, employee.getDepartmentID());
            ps.setString(6, employee.getTitle());
            ps.setString(7, employee.getTitleOfCourtesy());
            ps.setDate(8, employee.getBirthDate());

            ps.setDate(9, employee.getHireDate());
            ps.setString(10, employee.getAddress());
            ps.setString(11, employee.getPhoneNumber());
            ps.setBoolean(12, employee.isStatus());
            ps.executeUpdate();
//            disbleInsertMode("Employees");
        } catch (Exception e) {
            connection.rollback();
        }
    }

    public void enableInsertMode(String tableName) {
        String sql = "SET IDENTITY_INSERT ? ON";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tableName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void disbleInsertMode(String tableName) {
        String sql = "SET IDENTITY_INSERT ? OFF";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tableName);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getNewEmployeeID() {
        int EmployeeID = 0;
        try {
            String sql = "select Max(EmployeeID) as Maximum from Employees";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                EmployeeID = rs.getInt("Maximum");
            }
        } catch (Exception e) {
        }//finally{ connection.close();}
        return EmployeeID + 1;
    }

    public void deleteEmployee(String EmployeeID) {
        String sql = "update Employees\n"
                + " set status = 0 where EmployeeID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, EmployeeID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changeStatusEmployee(String EmployeeID) {
        String sql = "update Employees\n"
                + " set status = 1 where EmployeeID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, EmployeeID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Employee> getEmployees(boolean isAdmin) {
        ArrayList<Employee> orderList = new ArrayList<>();
        try {
            String sql = "select * from Employees";
            String sql2 = "select * from Employees where Status = ?";
            PreparedStatement ps;
            if (isAdmin == true) {
                ps = connection.prepareStatement(sql);
            } else {
                ps = connection.prepareStatement(sql2);
                ps.setInt(1, 0);
            }
            ResultSet rs = ps.executeQuery();
            orderList = getObjectList(rs);
        } catch (Exception e) {

        }
        return orderList;
    }


    public boolean EditInfoEmployees(Employee em) {
        int result = 0;
        try {
            String sql = "UPDATE Employees \n"
                    + "SET PhoneNumber = ?, Address = ?, BirthDate = ?, \n"
                    + "TitleOfCourtesy = ?, Title = ?, Gender = ?, \n"
                    + "FirstName = ?, LastName = ? \n"
                    + "WHERE EmployeeID = ?";

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, em.getPhoneNumber());
            ps.setString(2, em.getAddress());
            ps.setDate(3, em.getBirthDate());
            ps.setString(4, em.getTitleOfCourtesy());
            ps.setString(5, em.getTitle());
            ps.setBoolean(6, em.isGender());
            ps.setString(7, em.getFirstName());
            ps.setString(8, em.getLastName());
            ps.setInt(9, em.getEmployeeID());
            
            result = ps.executeUpdate();

        } catch (Exception e) {
        }
        return result > 0;
    }
    
//    public static void main(String[] args) {
//        Employee em = new Employee(1, "123123", "123", true, "123123", "123",Date.valueOf("2002-12-12"), "123123123", "1231233");
//        boolean a = new EmployeeDAO().EditInfoEmployees(em);
//        System.out.println(a);
//    }

    public List<Employee> searchByName(String search) {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from Employees where LastName like ? OR FirstName like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setEmployeeID(rs.getInt("employeeID"));
                e.setFirstName(rs.getString("firstName"));
                e.setLastName(rs.getString("lastName"));
                e.setGender(rs.getBoolean("gender"));
                e.setDepartmentID(Integer.parseInt(rs.getString("departmentID")));
                e.setTitle(rs.getString("title"));
                e.setTitleOfCourtesy(rs.getString("titleOfCourtesy"));
                e.setBirthDate(rs.getDate("birthDate"));
                e.setHireDate(rs.getDate("hireDate"));
                e.setStatus(rs.getBoolean("status"));
                e.setAddress(rs.getString("address"));
                list.add(e);
            }
        } catch (Exception e) {
        }
        return list;
    }

//    public static void main(String[] args) {
//        EmployeeDAO abc = new EmployeeDAO();
//        ArrayList<Employee> emm = abc.getAllEmloyees();
//        System.out.println(emm);
//    }
//    public static void main(String[] args) {
//        ArrayList<Employee> employees = new EmployeeDAO().getAllEmloyeesByID();
//        for (Employee emp : employees) {
//            System.out.println(emp);
//        }
//    }
    public List<Employee> pagingEmployees(int index) {
        List<Employee> empList = new ArrayList<>();
        String sql = "select * from Employees\n"
                + "order by EmployeeID \n"
                + "OFFSET ? Rows fetch next 10 rows only;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index-1)*10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int EmployeeID = rs.getInt("EmployeeID");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");
                boolean Gender = rs.getBoolean("Gender");
                int DepartmentID = rs.getInt("DepartmentID");
                String Title = rs.getString("Title");
                String TitleOfCourtesy = rs.getString("TitleOfCourtesy");
                Date BirthDate = rs.getDate("BirthDate");
                Date HireDate = rs.getDate("HireDate");
                String Address = rs.getString("Address");
                String PhoneNumber = rs.getString("PhoneNumber");
                boolean Status = rs.getBoolean("Status");               
                Employee emp = new Employee(EmployeeID, FirstName, LastName, Gender, DepartmentID, Title, TitleOfCourtesy, BirthDate, HireDate, Address, PhoneNumber, Status);
                empList.add(emp);
            }
        } catch (Exception e) {
        }
        return empList;
    }

    public static void main(String[] args) {
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> empList = dao.pagingEmployees(2);
        for(Employee em : empList){
            System.out.println(em);
        }
    }
}
