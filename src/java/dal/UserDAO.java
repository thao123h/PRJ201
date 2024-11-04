/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.District;
import model.Province;
import model.User;
import model.Ward;

/**
 *
 * @author asus
 */
public class UserDAO extends DBContext {

    public User getUserByEmailPassword(String email, String password) {

        String sql = "select * from Users where email=? and password=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                User u = new User(rs.getInt("id"), rs.getString("email"), rs.getString("fullname"), rs.getString("phoneNumber"), rs.getString("address"),
                        rs.getString("password"), rs.getString("role"));
                return u;
            }

        } catch (Exception e) {
        }
        return null;

    }

    public User getUserByNameEmail(String name, String email) {

        String sql = "select * from Users where email=? and fullname=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                User u = new User(rs.getInt("id"), rs.getString("email"), rs.getString("fullname"), rs.getString("phoneNumber"), rs.getString("address"),
                        rs.getString("password"), rs.getString("role"));
                return u;
            }

        } catch (Exception e) {
        }
        return null;

    }

    public List<User> getAllCustomers() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Users where role = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "user");

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                User u;
                u = new User(rs.getInt("id"), rs.getString("email"), rs.getString("fullname"), rs.getString("phoneNumber"), rs.getString("address"),
                        rs.getString("password"), rs.getString("role"));
                list.add(u);
            }

        } catch (Exception e) {
        }
        return list;

    }

    public User getUserByEmail(String email) {

        String sql = "select * from Users where email=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                User u = new User(rs.getInt("id"), rs.getString("email"), rs.getString("fullname"), rs.getString("phoneNumber"), rs.getString("address"),
                        rs.getString("password"), rs.getString("role"));
                return u;
            }

        } catch (Exception e) {
        }
        return null;

    }

    public boolean updatePassword(String email, String password) {
        String sql = "UPDATE Users SET password = ? WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);

            int rowsAffected = st.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected); // Debug line
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error updating password: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByID(int id) {

        String sql = "select * from Users where id=?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                User u = new User(rs.getInt("id"), rs.getString("email"), rs.getString("fullname"), rs.getString("phoneNumber"), rs.getString("address"),
                        rs.getString("password"), rs.getString("role"));
                return u;
            }

        } catch (Exception e) {
        }
        return null;

    }

    public void update(User u) {
        String sql = "update Users\n"
                + "set phoneNumber = ?, address = ?\n"
                + "where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPhone());
            st.setString(2, u.getAddress());
            st.setInt(3, u.getId());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insert(User u) {
        String sql = " insert into Users (fullname, email,phoneNumber,\n"
                + "password,role,address) values (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFullname());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPhone());
            st.setString(4, u.getPassword());
            st.setString(5, u.getRole());
            st.setString(6, u.getAddress());
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

//    public User(int id, String fullname, String email, String phone, String address, String password, String role) {
//        this.id = id;
//        this.fullname = fullname;
//        this.email = email;
//        this.phone = phone;
//        this.address = address;
//        this.password = password;
//        this.role = role;
//    }
//   public List<User> getUserByEmailPasswords( String email, String password) {
//        List<User> users = new ArrayList<>();
//        String sql = "select u.id, u.fullname,u.email, u.phoneNumber,u.password,u.role,p.id as pid, p.name as pname,\n" +
//"d.id as did, d.name as dname, w.id as wid, w.name as wname,a.id as aid, a.numHouse as aname from Provinces p join Districts d on p.id = d.provinceID\n" +
//"join Wards w on d.id  = w.districtID join Address a on a.wardID = d.id \n" +
//"join Users u on u.addressID = d.id where u.email = ? and u.password = ?";
//        
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, email);
//             st.setString(2, password);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Province p = new Province( rs.getInt("pid"), rs.getString("pname"));
//                District d = new District(rs.getInt("did"), rs.getString("dname"), p);
//                Ward w = new Ward(rs.getInt("wid"),  rs.getString("wname"),d);
//                Address a = new Address(rs.getInt("aid"), rs.getString("aname"), w);
//                User u = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("phoneNumber"), a,
//                        rs.getString("password"), rs.getString("role"));
//                users.add(u);
//            }
//            
//
//        } catch (Exception e) {
//        }
//   return users;
//
//    }
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        if (ud.getUserByNameEmail("đinh thị thảo", "cohienkiu12345@gmail.com") != null) {
            System.out.println(ud.getUserByEmail("cohienkiu12345@gmail.com").getFullname());
        } else {
            System.out.println("npppp");
        }
    }

}
