/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OriginalProduct;

/**
 *
 * @author asus
 */
public class OriginalProductDAO extends DBContext{
    public List<OriginalProduct> getOProducts(){
          List<OriginalProduct> products = new ArrayList<>();
        String sql = "select * from OriginalProducts where 1=1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("id"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                         rs.getString("thumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
               products.add(o);
            }
          

        } catch (Exception e) {
        }
        return products;
    }
     public static void main(String[] args) {
        OriginalProductDAO  pr = new OriginalProductDAO();
        System.out.println(pr.getOProducts().size());

//  pr.update(new Product(1,"ip","/assets/images/ip1.jpg","12sangchoanh5000",5000));
//        System.out.println(pr.getProductByID(1).getDescribe());
    }

}
