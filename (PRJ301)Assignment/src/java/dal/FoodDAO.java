package dal;

import java.util.*;
import java.sql.*;
import model.*;

public class FoodDAO extends MyDAO {

    public List<Food> getFoods() {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x;
        List<Food> t = new ArrayList<>();
        String xSql = "select * from Food";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public Food getFood(int fid) {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x = null;
        List<Food> t = new ArrayList<>();
        String xSql = "select * from Food where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public List<Food> getFourTopSale() {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x;
        List<Food> t = new ArrayList<>();
        String xSql = "select top 4 * from Food order by sale desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public List<Food> getPopular() {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x;
        List<Food> t = new ArrayList<>();
        String xSql = "select top 8 * from Food where sold > 10 order by sold desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public List<Food> getFourPopular() {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x;
        List<Food> t = new ArrayList<>();
        String xSql = "select top 4 * from Food order by sold desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public List<Food> getLessPopular() {
        int id;
        String name;
        double price;
        int sale;
        int sold;
        double cost;
        Food x;
        List<Food> t = new ArrayList<>();
        String xSql = "select * from (select top 4 * from (select top 8 * from food order by sold desc) as top8 order by sold asc) as top4 order by sold desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                price = rs.getDouble("price");
                sale = rs.getInt("sale");
                sold = rs.getInt("sold");
                cost = rs.getDouble("cost");
                x = new Food(id, name, price, sale, sold, cost);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public int getTotalSold() {
        int total = 0;
        String xSql = "select sum(sold) as TotalSold from Food;";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("TotalSold");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    public String getImagePath(int id) {
        String path = "";
        String xSql = "select [path] from Food_Image where id = ?;";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                path = rs.getString("path");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }

    public String verifyImagePath(int id) {
        String orgPath = getImagePath(id);
        return orgPath.substring(0, 3).equals("../") ? orgPath.substring(3) : orgPath;
    }

    public int getLatestId() {
        int id = 0;
        String xSql = "select top 1 * from Food order by id desc";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public void insert(Food f) {
        String xSql = "INSERT INTO Food ([id],[name],[price],[sale],[sold]) VALUES(?,?,(ROUND(?, 2)),?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, f.getId());
            ps.setString(2, f.getName());
            ps.setDouble(3, f.getPrice());
            ps.setInt(4, f.getSale());
            ps.setInt(5, f.getSold());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertFoodRest(Food f, int rId) {
        String xSql = "insert into Food_Restaurant (foodID,restID) values(?,?);";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, f.getId());
            ps.setInt(2, rId);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertFoodImg(Food f, String path) {
        String xSql = "INSERT INTO Food_Image (id,path) VALUES(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, f.getId());
            ps.setString(2, path);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int fid) {
        String xSql1 = "delete from Food_Image where id = ?";
        String xSql2 = "delete from Food_Restaurant where foodID = ?";
        String xSql3 = "delete from Food where id = ?";
        try {
            PreparedStatement ps1 = con.prepareStatement(xSql1);
            ps1.setInt(1, fid);
            ps1.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement(xSql2);
            ps2.setInt(1, fid);
            ps2.executeUpdate();
            PreparedStatement ps3 = con.prepareStatement(xSql3);
            ps3.setInt(1, fid);
            ps3.executeUpdate();
            ps1.close();
            ps2.close();
            ps3.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(Food f, String path) {
        String xSql1 = "update Food_Image set [path] = ? where id = ?";
        String xSql2 = "update Food set name = ?, price = ROUND(?, 2), sale = ?, sold = ?, cost = ROUND(?, 2) where id = ?;";
        try {
            PreparedStatement ps1 = con.prepareStatement(xSql1);
            ps1.setString(1, path);
            ps1.setInt(2, f.getId());
            ps1.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement(xSql2);
            ps2.setString(1, f.getName());
            ps2.setDouble(2, f.getPrice());
            ps2.setInt(3, f.getSale());
            ps2.setInt(4, f.getSold());
            ps2.setDouble(5, f.getCost());
            ps2.setInt(6, f.getId());
            ps2.executeUpdate();
            ps1.close();
            ps2.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        FoodDAO fd = new FoodDAO();
//        List<Food> list = fd.getFourPopular();
//        for (Food x : list) {
//            System.out.println(x.getName());
//        }
        System.out.println(fd.getImagePath(2));
    }
}
