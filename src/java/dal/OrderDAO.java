/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author asus
 */
public class OrderDAO extends DBContext {
//    int id;
//    Order order;
//    Product product;
//    int num;
//    int totalMoney;

    public void insertIntoOrder(Order order) {
        String sql = "insert into Orders(userID,status) values(?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order.getUser().getId());
            st.setInt(2, 0);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public Order getOrderByUserID(int userID) {
        String sql = "select * from Orders where userID = ?";
        UserDAO ud = new UserDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt("id"), ud.getUserByID(rs.getInt("userID")), rs.getInt("status"), rs.getInt("totalMoney"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void updateTotalMoneyInOrder(int oid) {
        int total = 0;
        String sql = "select sum(totalMoney) as total from CartItems where orderID = ?";
        String sql2 = "update Orders set totalMoney = ? where oid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
        }
        try {
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, total);
            st2.setInt(2, oid);
            st2.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertIntoOrderDetail(OrderDetail odetail) {
        String sql = "insert into OrderDetails(orderID,productID,num,totalMoney) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, odetail.getOrder().getId());
            st.setInt(2, odetail.getProduct().getId());
            st.setInt(3, odetail.getNum());
            st.setInt(4, odetail.getTotalMoney());
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();
        UserDAO ud = new UserDAO();
        od.insertIntoOrder(new Order(0, ud.getUserByID(6), 0, 0));
        od.getOrderByUserID(6);
        System.out.println(od.getOrderByUserID(6));
        ProductDAO pd = new ProductDAO();
    od.insertIntoOrderDetail(new OrderDetail(0, od.getOrderByUserID(6), pd.getProductByID(8), 0, 0));
    }
//    int id;
//    Order order;
//    Product product;
//    int num;
//    int totalMoney;
}
