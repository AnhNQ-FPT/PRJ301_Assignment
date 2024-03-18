package dal;

import java.util.*;
import java.sql.*;
import java.time.*;
import model.*;

public class RestaurantDAO extends MyDAO {

    public List<Restaurant> getRestaurants() {
        int id;
        String name;
        int cityID;
        String address;
        int sale;
        float rating;
        LocalTime open;
        LocalTime close;
        Restaurant x;
        List<Restaurant> t = new ArrayList<>();
        String xSql = "select * from Restaurant";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                cityID = rs.getInt("cityID");
                address = rs.getString("address");
                sale = rs.getInt("sale");
                rating = rs.getFloat("rating");
                open = rs.getTime("open").toLocalTime();
                close = rs.getTime("close").toLocalTime();
                x = new Restaurant(id, name, cityID, address, sale, rating, open, close);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public List<Restaurant> getSixRating() {
        int id;
        String name;
        int cityID;
        String address;
        int sale;
        float rating;
        LocalTime open;
        LocalTime close;
        Restaurant x;
        List<Restaurant> t = new ArrayList<>();
        String xSql = "select top 6 * from Restaurant order by rating desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                cityID = rs.getInt("cityID");
                address = rs.getString("address");
                sale = rs.getInt("sale");
                rating = rs.getFloat("rating");
                open = rs.getTime("open").toLocalTime();
                close = rs.getTime("close").toLocalTime();
                x = new Restaurant(id, name, cityID, address, sale, rating, open, close);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public Restaurant getRestaurant(int xId) {
        int id;
        String name;
        int cityID;
        String address;
        int sale;
        float rating;
        LocalTime open;
        LocalTime close;
        Restaurant x = null;
        String xSql = "select * from Restaurant where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                cityID = rs.getInt("cityID");
                address = rs.getString("address");
                sale = rs.getInt("sale");
                rating = rs.getFloat("rating");
                open = rs.getTime("open").toLocalTime();
                close = rs.getTime("close").toLocalTime();
                x = new Restaurant(id, name, cityID, address, sale, rating, open, close);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public static void main(String[] args) {
        RestaurantDAO fd = new RestaurantDAO();
        List<Restaurant> list = fd.getSixRating();
        for (Restaurant x : list) {
            System.out.println(x.getName());
        }
    }
}
