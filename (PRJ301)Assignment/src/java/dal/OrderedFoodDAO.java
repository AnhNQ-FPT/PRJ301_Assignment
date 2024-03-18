package dal;

import java.util.*;
import java.sql.*;
import model.*;

public class OrderedFoodDAO extends MyDAO {

    public List<OrderedFood> getFoodList(int oid) {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        int restID;
        int quantity;
        OrderedFood x;
        List<OrderedFood> t = new ArrayList<>();
        String xSql = "select * from OrderDetails where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                quantity = rs.getInt("quantity");
                restID = rs.getInt("restID");
                x = new OrderedFood(id, name, price, sale, sold, cost, quantity, restID);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

//    public Food getFood(String xId) {
//        int id;
//        String name;
//        double price;
//        int sale;
//        int sold;
//        Food x = null;
//        List<Food> t = new ArrayList<>();
//        String xSql = "select * from Food where id = ?";
//        try {
//            PreparedStatement ps = con.prepareStatement(xSql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                id = rs.getInt("id");
//                name = rs.getString("name");
//                price = rs.getDouble("price");
//                sale = rs.getInt("sale");
//                sold = rs.getInt("sold");
//                x = new Food(id, name, price, sale, sold);
//            }
//            rs.close();
//            ps.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return x;
//    }

}
