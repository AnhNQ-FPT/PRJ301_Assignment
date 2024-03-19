/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.*;
import java.util.*;

/**
 *
 * @author ADMIN
 */
public class Order {

    private int id;
    private int userID;
//    private int restID;
    private String address;
    private LocalDateTime created;
    private List<OrderedFood> list;
    private double total;
//    private String status;

    public Order() {
    }

//    public Order(int id, int userID, int restID, String address, LocalDateTime created, List<OrderedFood> list) {
//        this.id = id;
//        this.userID = userID;
//        this.restID = restID;
//        this.address = address;
//        this.created = created;
//        this.list = list;
//    }
    public Order(int id, int userID, String address, LocalDateTime created, List<OrderedFood> list, float total) {
        this.id = id;
        this.userID = userID;
        this.address = address;
        this.created = created;
        this.list = list;
        this.total = total;
//        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
//
//    public int getRestID() {
//        return restID;
//    }
//
//    public void setRestID(int restID) {
//        this.restID = restID;
//    }

    public List<OrderedFood> getList() {
        return list;
    }

    public void setList(List<OrderedFood> list) {
        this.list = list;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

//    public String getStatus() {
//        return status;
//    }
//
//    public void setStatus(String status) {
//        this.status = status;
//    }
    public int getQuantityById(int id) {
        return getOrderedFoodById(id).getQuantity();
    }

    private OrderedFood getOrderedFoodById(int id) {
        for (OrderedFood x : list) {
            if (x.getId() == id) {
                return x;
            }
        }
        return null;
    }

    public void addOrderedFood(OrderedFood x) {
        if (getOrderedFoodById(x.getId()) != null) {
            OrderedFood m = getOrderedFoodById(x.getId());
            m.setQuantity(m.getQuantity() + x.getQuantity());
        } else {
            list.add(x);
        }
    }

    public void removeOrderedFood(int id) {
        if (getOrderedFoodById(id) != null) {
            list.remove(getOrderedFoodById(id));
        }
    }

    public Order(String cartinfo, List<Food> list) {
        double total = 0;
        this.list = new ArrayList<OrderedFood>();
        try {
            if (cartinfo != null && cartinfo.length() != 0) {
                String[] raw = cartinfo.split(":");
                this.userID = Integer.parseInt(raw[0]);
                String[] s = raw[1].split("/");
                for (String i : s) {
                    String[] n = i.split("-");
                    int id = Integer.parseInt(n[0]);
                    Food f = null;
                    for (Food x : list) {
                        if (x.getId() == id) {
                            f = x;
                            break;
                        }
                    }
                    String name = f.getName();
                    double price = f.getPrice();
                    int sale = f.getSale();
                    int sold = f.getSold();
                    double cost = f.getCost();
                    int quantity = Integer.parseInt(n[1]);
                    OrderedFood t = new OrderedFood(id, name, price, sale, sold, cost, quantity);
                    addOrderedFood(t);

                    total += quantity * price * sale / 100;
                }
                BigDecimal bd = new BigDecimal(total);
                BigDecimal rounded = bd.setScale(2, RoundingMode.HALF_EVEN);
                total = rounded.doubleValue();
                setTotal(total);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Order constructor failed");
        }
    }

    public int getSize(String cartinfo) {
        if (cartinfo.isEmpty()) {
            return 0;
        }
        String[] raw = cartinfo.split(":");
        String[] s = raw[1].split("/");
        return s.length;
    }

    public double getFinalTotal() {
        double total = 0;
        for (int i = 0; i < list.size(); i++) {
            BigDecimal bd = new BigDecimal(list.get(i).getPrice() * list.get(i).getQuantity() * list.get(i).getSale() / 100);
            BigDecimal rounded = bd.setScale(2, RoundingMode.HALF_EVEN);
            total += rounded.doubleValue();
        }
        return total;
    }
}
