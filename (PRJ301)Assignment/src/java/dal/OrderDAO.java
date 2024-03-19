package dal;

import java.util.*;
import java.sql.*;
import java.time.*;
import model.*;

public class OrderDAO extends MyDAO {

    public List<Order> getOrders() {
        int id;
        int userID;
//        int restID;
        String address;
        LocalDateTime created;
        float total;
//        String status;
        Order x;

        OrderedFoodDAO ofd = new OrderedFoodDAO();
        List<OrderedFood> list;
        List<Order> t = new ArrayList<>();
        String xSql = "select * from [Order]";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                userID = rs.getInt("userID");
//                restID = rs.getInt("restID");
                address = rs.getString("address");
                created = rs.getTimestamp("created_on").toLocalDateTime();
                list = ofd.getFoodList(id);
                total = rs.getFloat("total");
//                status = rs.getString("status");
                x = new Order(id, userID, address, created, list, total);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public Order getOrder(String xId) {
        int id;
        int userID;
//        int restID;
        String address;
        LocalDateTime created;
        float total;
//        String status;
        Order x = null;
        OrderedFoodDAO ofd = new OrderedFoodDAO();
        List<OrderedFood> list;
        String xSql = "select * from [Order] where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                userID = rs.getInt("userID");
//                restID = rs.getInt("restID");
                address = rs.getString("address");
                created = rs.getTimestamp("created_on").toLocalDateTime();
                list = ofd.getFoodList(id);
                total = rs.getFloat("total");
//                status = rs.getString("status");
                x = new Order(id, userID, address, created, list, total);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public int getTotalRevenue() {
        int total = 0;
        String xSql = "select sum(total) as TotalRevenue from [Order];";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("TotalRevenue");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public int getOrdersCount() {
        int count = 0;
        String xSql = "select count(*) as NumberOfOrders from [Order];";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt("NumberOfOrders");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getLatestOrderId() {
        int oid = 1;
        try {
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oid;
    }

    public void addOrder(User user, Order order) {
        LocalDateTime created = LocalDateTime.now();
        Order x;
        try {
            //add order
            String sql = "insert into [Order] values (?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, getLatestOrderId()+1);
            st.setInt(2, user.getId());
            st.setString(3, order.getAddress());
            st.setObject(4, created);
            st.setDouble(5, order.getTotal());
//            st.setString(6, order.getStatus());
            st.executeUpdate();
            //get id of added order
            int oid = getLatestOrderId();
            //add to OrderDetails
            for (OrderedFood of : order.getList()) {
                String sql2 = "insert into [OrderDetails] values (?,?,?,ROUND(?,2))";
                PreparedStatement st2 = connection.prepareStatement(sql2);
                st2.setInt(1, oid);
                st2.setInt(2, of.getId());
                st2.setInt(3, of.getQuantity());
                st2.setDouble(4, of.getPrice() * of.getQuantity());
                st2.executeUpdate();
                //change sold number
                String sql3 = "update Food set sold = sold + ? where id = ?";
                PreparedStatement st3 = connection.prepareStatement(sql3);
                st3.setInt(1, of.getQuantity());
                st3.setInt(2, of.getId());
                st3.executeUpdate();
            }
            //update balance
            String sql4 = "update [User] set balance = balance - ROUND(?,2) where id = ?";
            PreparedStatement st4 = connection.prepareStatement(sql4);
            st4.setDouble(1, order.getTotal());
            st4.setInt(2, user.getId());
            st4.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void completeOrder(Order o) {
        String sql = "update [Order] set status = 'completed' where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, o.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
