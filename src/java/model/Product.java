/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Product {
   int id;
   OriginalProduct oproduct;
   String name;
   int stock;
   String thumbnail;

    public Product() {
    }

    public Product(int id, OriginalProduct oProduct, String name, int stock, String thumbnail) {
        this.id = id;
        this.oproduct = oProduct;
        this.name = name;
        this.stock = stock;
        this.thumbnail = thumbnail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public OriginalProduct getOproduct() {
        return oproduct;
    }

    public void setOproduct(OriginalProduct oproduct) {
        this.oproduct = oproduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
   
   
}
