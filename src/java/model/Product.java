/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Minh
 */
public class Product {
    private int id, pid;
    private String title;
    private int price;
    private String icon,describe,genre;

    public Product() {
    }

    public Product(int id,  String title,int pid, int price, String icon, String describe, String genre) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.price = price;
        this.icon = icon;
        this.describe = describe;
        this.genre = genre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", pid=" + pid + ", title=" + title + ", price=" + price + ", icon=" + icon + ", describe=" + describe + ", genre=" + genre + '}';
    }

   
    
}
