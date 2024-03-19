/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class OrderedFood extends Food {

//    private int restID;
    private int quantity;

    public OrderedFood(int quantity) {
        this.quantity = quantity;
    }
    
    public OrderedFood(int id, int quantity) {
        setId(id);
        this.quantity = quantity;
    }

    public OrderedFood(int id, String name, double price, int sale, int sold, double cost, int quantity) {
        super(id, name, price, sale, sold, cost);
        this.quantity = quantity;
//        this.restID = restID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
