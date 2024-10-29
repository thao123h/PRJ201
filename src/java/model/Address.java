/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author asus
 */
public class Address {
    int id;
    String numhouse;
    Ward ward;

    public Address() {
    }

    public Address(int id, String numhouse, Ward ward) {
        this.id = id;
        this.numhouse = numhouse;
        this.ward = ward;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumhouse() {
        return numhouse;
    }

    public void setNumhouse(String numhouse) {
        this.numhouse = numhouse;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }
      
}
