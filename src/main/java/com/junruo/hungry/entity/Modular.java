package com.junruo.hungry.entity;

public class Modular {
    private int id;
    private int mid;
    private String name;
    private String address;
    private String comment;

    public Modular(int id, int mid, String name, String address, String comment) {
        this.id = id;
        this.mid = mid;
        this.name = name;
        this.address = address;
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "modular{" +
                "id=" + id +
                ", mid=" + mid +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
