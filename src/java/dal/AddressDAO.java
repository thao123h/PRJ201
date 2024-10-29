/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.District;
import model.Province;

/**
 *
 * @author asus
 */
public class AddressDAO extends DBContext{
    public List<Province> getProvinces(){
        String sql = "select * from Provinces";
        List <Province> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Province(rs.getInt("id"), rs.getString("name")));
                
            }
        } catch (Exception e) {
        }
        return list;
    }
      public List<District> getDistricts(){
        String sql = "select * from Districts";
        List <District> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
//                list.add(new Province(rs.getInt("id"), rs.getString("name")));
                
            }
        } catch (Exception e) {
        }
        return list;
    }
    
}
