/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Product;
import model.User;
import org.apache.tomcat.dbcp.dbcp2.PoolableCallableStatement;

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

    public void updateOrderStatus(int status, int id) {
        String sql = "update Orders set status = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeQuery();
        } catch (Exception e) {
        }
    }

    public List<Order> getOrders() {
        String sql = " select * from Orders";
        List<Order> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("id"), ud.getUserByID(rs.getInt("userID")), rs.getInt("status"),
                        rs.getInt("totalMoney"), rs.getDate("orderDate")));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Order getAnOrder(int oid) {
        String sql = "select * from Orders where id = ?";

        UserDAO ud = new UserDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                 return new Order(rs.getInt("id"), ud.getUserByID(rs.getInt("userID")), rs.getInt("status"),
                        rs.getInt("totalMoney"), rs.getDate("orderDate"));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getAllOrderDetals(int oid) {
        String sql = "select * from OrderDetails where orderID = ?";
        List<OrderDetail> list = new ArrayList<>();
        UserDAO ud = new UserDAO();
        ProductDAO d = new ProductDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = getAnOrder(rs.getInt("orderID"));
                list.add(new OrderDetail(rs.getInt("id"), o, d.getProductByID(rs.getInt("productID")), rs.getInt("num"), rs.getInt("totalMoney")));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderByUserID(int userID) {
        String sql = "select top 1 * from Orders where userID = ? order by orderDate desc";
        UserDAO ud = new UserDAO();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt("id"), ud.getUserByID(rs.getInt("userID")), rs.getInt("status"),
                        rs.getInt("totalMoney"), rs.getDate("orderDate"));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void updateTotalMoneyInOrder(int oid) {
        int total = 0;
        String sql = "select sum(totalMoney) as total from OrderDetails where orderID = ?";
        String sql2 = "update Orders set totalMoney = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, oid);
            try {
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    total = rs.getInt("total");
                }
            } catch (Exception e) {
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

    public void insertListIntoOrderDetail(List<OrderDetail> list) {
        String sql = "insert into OrderDetails(orderID,productID,num,totalMoney) values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            for (OrderDetail odetail : list) {
                st.setInt(1, odetail.getOrder().getId());
                st.setInt(2, odetail.getProduct().getId());
                st.setInt(3, odetail.getNum());
                st.setInt(4, odetail.getTotalMoney());
                st.addBatch();
            }

            st.executeBatch();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        OrderDAO od = new OrderDAO();

        UserDAO ud = new UserDAO();
//        od.insertIntoOrder(new Order(0, ud.getUserByID(6), 0, 0));
//        od.getOrderByUserID(6);
//        System.out.println(od.getOrderByUserID(6));
        ProductDAO pd = new ProductDAO();
//        if (od.getAnOrder(22) != null) {
//            System.out.println(od.getAnOrder2(22).getTotalMoney());
//        } else {
//            System.out.println("null");
//        }
        System.out.println(od.getOrders().size());

//        od.insertIntoOrderDetail(new OrderDetail(0, od.getOrderByUserID(6), pd.getProductByID(8), 0, 0));
        System.out.println(od.getAllOrderDetals(22).size());
    }
//    int id;
//    Order order;
//    Product product;
//    int num;
//    int totalMoney;
}
