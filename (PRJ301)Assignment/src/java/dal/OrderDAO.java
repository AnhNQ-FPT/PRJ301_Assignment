package dal;

import java.util.*;
import java.sql.*;
import java.time.*;
import model.*;

public class OrderDAO extends MyDAO {

    public List<Order> getOrders() {
        int id;
        int userID;
        int restID;
        String address;
        LocalDateTime created;
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
                restID = rs.getInt("restID");
                address = rs.getString("address");
                created = rs.getTimestamp("created_on").toLocalDateTime();
                list = ofd.getFoodList(id);
                x = new Order(id, userID, restID, address, created, list);
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
        int restID;
        String address;
        LocalDateTime created;
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
                restID = rs.getInt("restID");
                address = rs.getString("address");
                created = rs.getTimestamp("created_on").toLocalDateTime();
                list = ofd.getFoodList(id);
                x = new Order(id, userID, restID, address, created, list);
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
    
    public int getOrdersCount(){
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
}
