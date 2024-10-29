/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.text.html.HTML;
import model.OriginalProduct;

/**
 *
 * @author asus
 */
public class ProductDAO extends DBContext {

//    public Product getProductByID(int id) {
//        String sql = "select * from Products where id = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                return (new Product(rs.getInt("id"),
//                        rs.getString("brand"), rs.getString("image"),
//                        rs.getString("describe"), rs.getInt("price")));
//            }
//
//        } catch (Exception e) {
//        }
//        return null;
//    }
//
//    public void insert(Product p) {
////        String sql = "insert into Products values ? ? ? ? ?";
//        String sql = "insert into Products values(?,?,?,?,?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, p.getId());
//            st.setString(2, p.getBrand());
//            st.setString(3, p.getImage());
//            st.setString(4, p.getDescribe());
//            st.setInt(5, p.getPrice());
//            st.executeUpdate();
//
//        } catch (Exception e) {
//        }
//
//    }
    public Product getProductByID(int id) {

        String sql = "select o.id as oid,o.categoryID, o.title, o.listedPrice,o.description,o.thumbnail"
                + " as othumbnail,o.discount,o.finalPrice,p.id as pid,p.name as pname,p.stock,p.thumbnail as pthumbnail\n"
                + "from OriginalProducts o  join  Products p on p.originalProductID = o.id where p.id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                return (new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getProducts(int cid, String name, int lowerPrice, int upperPrice, int oid) {
        List<Product> products = new ArrayList<>();
        String sql = "select o.id as oid,o.categoryID, o.title, o.listedPrice,o.description,o.thumbnail"
                + " as othumbnail,o.discount,o.finalPrice,p.id as pid,p.name as pname,p.stock,p.thumbnail as pthumbnail\n"
                + "from OriginalProducts o  join  Products p on p.originalProductID = o.id where 1=1 ";
        if (cid != 0) {
            sql += "and o.categoryID = " + cid;
        }
        if (oid != 0) {
            sql += "and o.id  = " + oid;
        }
        if (name != null) {
            sql += "and p.name like N'%" + name + "%'";
        }
        if (lowerPrice == 0 && upperPrice != 0) {
            sql += " and  o.listedPrice <=" + upperPrice;
        }
        if (lowerPrice != 0 && upperPrice == 0) {
            sql += " and  o.listedPrice >= " + lowerPrice;
        }
        if (lowerPrice != 0 && upperPrice != 0) {
            sql += " and  o.listedPrice between " + lowerPrice + " and " + upperPrice;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                products.add(new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return products;

    }

    public List<Product> getProductsByTitle(String name) {
        List<Product> products = new ArrayList<>();
        String sql = "select o.id as oid,o.categoryID, o.title, o.listedPrice,o.description,o.thumbnail"
                + " as othumbnail,o.discount,o.finalPrice,p.id as pid,p.name as pname,p.stock,p.thumbnail as pthumbnail\n"
                + "from OriginalProducts o  join  Products p on p.originalProductID = o.id where 1=1 ";

        if (name != null) {
            sql += "and o.title like N'%" + name + "%'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                products.add(new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return products;

    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "select o.id as oid, o.categoryID, o.title, o.listedPrice, o.description, o.thumbnail as othumbnail, "
                + "o.discount, o.finalPrice, p.id as pid, p.name as pname, p.stock, p.thumbnail as pthumbnail "
                + "from OriginalProducts o join Products p on p.originalProductID = o.id "
                + "where p.id between 1 and 5 or p.id between 30 and 35 or p.id between 41 and 47";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                products.add(new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return products;

    }

    public List<Product> getNewProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "select top 3 o.id as oid,o.categoryID, o.title, o.listedPrice,o.description,o.thumbnail"
                + " as othumbnail,o.discount,o.finalPrice,p.id as pid,p.name as pname,p.stock,p.thumbnail as pthumbnail\n"
                + "from OriginalProducts o  join  Products p on p.originalProductID = o.id where 1=1 order by p.createdAt ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                products.add(new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return products;

    }

    public List<Product> getGoodProducts() {
        List<Product> products = new ArrayList<>();
        String sql = " select o.id as oid,o.categoryID, o.title, o.listedPrice,o.description,o.thumbnail\n"
                + "                 as othumbnail,o.discount,o.finalPrice,p.id as pid,p.name as pname,p.stock,p.thumbnail as pthumbnail\n"
                + "                from OriginalProducts o  join  Products p on p.originalProductID = o.id  join ( \n"
                + "select min(p.id ) as pid\n"
                + "                from OriginalProducts o  join  Products p on p.originalProductID = o.id where 1=1 group by o.categoryID ) pi on pi.pid = p.id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OriginalProduct o = new OriginalProduct(rs.getInt("oid"), rs.getInt("categoryID"),
                        rs.getString("title"), rs.getInt("listedPrice"), rs.getString("description"),
                        rs.getString("othumbnail"), rs.getDouble("discount"), rs.getDouble("finalPrice"));
                products.add(new Product(rs.getInt("pid"), o, rs.getString("pname"), rs.getInt("stock"),
                        rs.getString("pthumbnail")));
            }

        } catch (Exception e) {
        }
        return products;

    }

//     int id;
//    int category;
//    String title;
//    int listedPrice;
//    String description;
//    String thumbnail;
//    double discount;
//    double finalPrice;
//     public List<Product> getProductsByBrand( String brand) {
//        List<Product> products = new ArrayList<>();
//        String sql = "select * from Products where brand = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, brand);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                products.add(new Product(rs.getInt("id"),
//                        rs.getString("brand"), rs.getString("image"),
//                        rs.getString("describe"), rs.getInt("price")));
//            }
//            return products;
//
//        } catch (Exception e) {
//        }
//        return null;
//
//    }
    public void delete(int id) {
        String sql = "delete from Products where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public void update ( Product p){
//         String sql = "update Products set brand=?,image=?,describe=?,price=? where id=? ";
//         try {
//             PreparedStatement st = connection.prepareStatement(sql);
//             st.setInt(5, p.getId());
//             st.setString(1, p.getBrand());
//             st.setString(2, p.getImage());
//             st.setString(3, p.getDescribe());
//             st.setInt(4, p.getPrice());
//
//             st.executeUpdate();
//         } catch (Exception e) {
//         }
//     }
//    

    public static void main(String[] args) {
        ProductDAO pr = new ProductDAO();
        System.out.println(pr.getProducts(0, null, 0, 0, 8).size()
        );
//        System.out.println(pr.getProducts().size());
    }

}
