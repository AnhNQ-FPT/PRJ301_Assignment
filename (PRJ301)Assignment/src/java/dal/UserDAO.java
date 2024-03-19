package dal;

import java.util.*;
import java.sql.*;
import model.*;

public class UserDAO extends MyDAO {

    public List<User> getUsers() {
        int id;
        String name;
        String password;
        String email;
        boolean admin;
        double balance;
        List<Order> orders;
        OrderDAO od = new OrderDAO();
        User x;
        List<User> t = new ArrayList<>();
        String xSql = "select * from [User]";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                orders = od.getOrders();
                x = new User(id, name, password, email, balance, admin, orders);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public User getUser(int uid) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        User x = null;
        String xSql = "select * from [User] where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                x = new User(id, name, password, email, balance, admin, null);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public User getUserByEmailAndPassword(String uemail, String upass) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        List<Order> orders;
        OrderDAO od = new OrderDAO();
        User x = null;
        String xSql = "select * from [User] where email = ? and password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, uemail);
            ps.setString(2, upass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                orders = od.getOrders();
                x = new User(id, name, password, email, balance, admin, orders);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public boolean checkExistingName(String xname) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        List<Order> orders;
        OrderDAO od = new OrderDAO();
        User x = null;
        String xSql = "select * from [User] where name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, xname);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                orders = od.getOrders();
                x = new User(id, name, password, email, balance, admin, orders);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x != null;
    }
    
    public boolean checkExistingNameExceptSelf(User xU) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        User x = null;
        String xSql = "select * from [User] where name = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, xU.getName());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                x = new User(id, name, password, email, balance, admin, null);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x != null && x.getId()!=xU.getId());
    }

    public boolean checkExistingEmailExceptSelf(User xU) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        User x = null;
        String xSql = "select * from [User] where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, xU.getEmail());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                x = new User(id, name, password, email, balance, admin, null);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x != null && x.getId()!=xU.getId());
    }
    
    public boolean checkExistingEmail(String xemail) {
        int id;
        String name;
        String password;
        String email;
        double balance;
        boolean admin;
        List<Order> orders;
        OrderDAO od = new OrderDAO();
        User x = null;
        String xSql = "select * from [User] where email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, xemail);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                password = rs.getString("password");
                email = rs.getString("email");
                balance = rs.getDouble("balance");
                admin = rs.getBoolean("role");
                orders = od.getOrders();
                x = new User(id, name, password, email, balance, admin, orders);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x != null;
    }

    public int getLatestId() {
        int id = 0;
        String xSql = "select top 1 * from [User] order by id desc";
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

    public void insert(User u) {
        String xSql = "INSERT INTO [dbo].[User] ([id],[name],[password],[email],[role]) VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, u.getId());
            ps.setString(2, u.getName());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getEmail());
            ps.setBoolean(5, u.isAdmin());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(User u) {
        String xSql = "update [User] set name = ?, password = ?, email = ?, role = ? where id = ?;";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getEmail());
            ps.setBoolean(4, u.isAdmin());
            ps.setInt(5, u.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean getRole(int xid) {
        boolean role = false;
        String xSql = "select role from [User] where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, xid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                role = rs.getBoolean("role");
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }

    public void delete(int fid) {
        String xSql = "delete from [User] where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, fid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public double getBalance(int uid){
        double balance = 0;
        String sql = "select balance from [User] where id = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,uid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                balance = rs.getDouble("balance");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return balance;
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        User u = ud.getUserByEmailAndPassword("user1@gmail.com", "abc");
//        List<User> list = ;
//        for (User x : list) {
//            System.out.println(x.getName());
//        }
        System.out.println(u.getName());
        System.out.println(ud.checkExistingName("Alice"));
    }

}
