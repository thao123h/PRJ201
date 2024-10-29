/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.CartItem;

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
        if (item != null) {
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
    }

    public static void main(String[] args) {
        CartDAO cd = new CartDAO();
        
        
    }
}
