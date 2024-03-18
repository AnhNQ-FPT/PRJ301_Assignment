/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.*;
import java.util.*;

/**
 *
 * @author ADMIN
 */
public class Order {

    private int id;
    private int userID;
    private int restID;
    private String address;
    private LocalDateTime created;
    private List<OrderedFood> list;
    private String status;

    public Order() {
    }

    public Order(int id, int userID, int restID, String address, LocalDateTime created, List<OrderedFood> list) {
        this.id = id;
        this.userID = userID;
        this.restID = restID;
        this.address = address;
        this.created = created;
        this.list = list;
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

    public int getRestID() {
        return restID;
    }

    public void setRestID(int restID) {
        this.restID = restID;
    }

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

    
}
