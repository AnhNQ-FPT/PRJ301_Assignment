/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalTime;

/**
 *
 * @author ADMIN
 */
public class Restaurant {

    private int id;
    private String name;
    private int cityID;
    private String address;
    private int sale;
    private float rating;
    private LocalTime open;
    private LocalTime close;

    public Restaurant() {
    }

    public Restaurant(int id, String name, int cityID, String address, int sale, float rating, LocalTime open, LocalTime close) {
        this.id = id;
        this.name = name;
        this.cityID = cityID;
        this.address = address;
        this.sale = sale;
        this.rating = rating;
        this.open = open;
        this.close = close;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCityID() {
        return cityID;
    }

    public void setCityID(int cityID) {
        this.cityID = cityID;
    }

    public LocalTime getOpen() {
        return open;
    }

    public void setOpen(LocalTime open) {
        this.open = open;
    }

    public LocalTime getClose() {
        return close;
    }

    public void setClose(LocalTime close) {
        this.close = close;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
