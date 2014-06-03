/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swifta.lecportal.entities;

/**
 *
 * @author princeyekaso
 */
public class MinimumRate {
    private int id;
    private String amount;
    private String datecreated;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(String datecreated) {
        this.datecreated = datecreated;
    }
    public String toString(){
        return this.id + ">>ID - "+this.amount+">>AMOUNT - "+this.datecreated+">> DATE";
    }
}
