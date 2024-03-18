/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.*;
import java.util.*;
import model.*;

/**
 *
 * @author ADMIN
 */
public class CityDAO extends MyDAO{
        public List<City> getEightTop() {
        int id;
        City x;
        List<City> t = new ArrayList<>();
        String xSql = "select top 8 c.id, count(r.id) as restNo from City c join Restaurant r on c.id = r.cityID group by c.id order by count(r.id) desc;";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                x = getCity(id);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }
        
    public City getCity(int xId) {
        int id;
        String name;
        City x = null;
        String xSql = "select * from City where id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setInt(1, xId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
                name = rs.getString("name");
                x = new City(id, name);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public static void main(String[] args) {
        CityDAO cd = new CityDAO();
        List<City> list = cd.getEightTop();
        for (City x : list) {
            System.out.println(x.getName());
        }
    }
}
