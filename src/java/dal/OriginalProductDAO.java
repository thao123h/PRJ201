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
    public void delete( int id){
        String sql = "delete from OriginalProducts where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    public OriginalProduct getOProductByID ( int id){
          String sql = "select * from OriginalProducts where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return new OriginalProduct(rs.getInt("id"), rs.getInt("categoryID"), 
                        rs.getString("title"),rs.getInt("listedPrice"), rs.getString("description"), rs.getString("thumbnail")
                        , rs.getInt("discount"), rs.getDouble("finalPrice"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
 public void update(OriginalProduct o) {
    String sql = "UPDATE OriginalProducts SET categoryID = ?, title = ?, listedPrice = ?, "
               + "description = ?, thumbnail = ?, discount = ? WHERE id = ?";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, o.getCategory());
        st.setString(2, o.getTitle());
        st.setInt(3, o.getListedPrice());
        st.setString(4, o.getDescription());
        st.setString(5, o.getThumbnail());
        st.setDouble(6, o.getDiscount());
        st.setInt(7, o.getId());
        st.executeUpdate();
    } catch (Exception e) {
        System.out.println(e);
    }
}
 public void insertOriginalProduct(OriginalProduct product) {
    String sql = "INSERT INTO OriginalProducts (categoryID, title, listedPrice, description, discount) VALUES (?, ?, ?, ?, ?)";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, product.getCategory());
        st.setString(2, product.getTitle());
        st.setInt(3, product.getListedPrice());
        st.setString(4, product.getDescription());
        st.setDouble(5, product.getDiscount());
        st.executeUpdate();
    } catch (Exception e) {
        System.out.println(e);
    }
}




     public static void main(String[] args) {
        OriginalProductDAO  pr = new OriginalProductDAO();
        
        pr.insertOriginalProduct(new OriginalProduct(0, 1, "chan", 0, "dien", "the", 0, 0));
//  pr.update(new Product(1,"ip","/assets/images/ip1.jpg","12sangchoanh5000",5000));
//        System.out.println(pr.getProductByID(1).getDescribe());
    }

}
