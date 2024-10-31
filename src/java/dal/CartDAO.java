/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.OriginalProduct;
import model.Product;

/**
 *
 * @author asus
 */
public class CartDAO extends DBContext {

    public Cart getCardByUserID(int userID) {
        String sql = "select * from Carts where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt("id"), rs.getInt("userID"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Cart getCardByCardID(int cartID) {
        String sql = "select * from Carts where cartID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt("id"), rs.getInt("userID"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertCart(int userID) {
        String sql = "insert into Carts(userID) values (?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insertCartItem(CartItem item) {
        String sql = "insert into CartItems (cartID,productID,quantity,price) values (?,?,?,?)";
         
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, item.getCart().getId());
                st.setInt(2, item.getProduct().getId());
                st.setInt(3, item.getQuantity());
                st.setDouble(4, item.getPrice());
                st.executeUpdate();
            } catch (SQLException e) {
            }
        
    }
    public void updateQuantity ( int quantity, int idc){
        String sql = "update CartItems set quantity=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, idc);
            st.executeUpdate();
                    
        } catch (Exception e) {
        }
    }
    public void deteteCartItem ( int id){
        String sql = "delete from CartItems where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
         
            st.executeUpdate();
                    
        } catch (Exception e) {
        }
    }
  public void deteteCartByUserID ( int id){
        String sql = "delete from Carts where userID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
         
            st.executeUpdate();
                    
        } catch (Exception e) {
        }
    }
    public List<CartItem> getAllCartItemsByCardID(int cardID) {
        String sql = "select * from CartItems \n"
                + "where cartID = ?";
        List<CartItem> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cardID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(rs.getInt("id"), getCardByCardID(rs.getInt("cartID")), getProductByID(rs.getInt("productID")), rs.getInt("quantity"), rs.getDouble("price")));
                

            }
        } catch (Exception e) {
        }
        return list;
    }
 public Product getProductByID( int productID){
     ProductDAO pd = new ProductDAO();
      return pd.getProductByID(productID);
 }
    public static void main(String[] args) {
        CartDAO cd = new CartDAO();
//        System.out.println(cd.getCardByUserID(5));
        System.out.println(cd.getAllCartItemsByCardID(8).size());
      cd.updateQuantity(4, 35);
        
    }
}
