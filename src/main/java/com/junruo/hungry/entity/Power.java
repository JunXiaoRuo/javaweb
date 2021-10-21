package com.junruo.hungry.entity;

public class Power {
    private int id;
    private int mid;
    private String name;
    private String comment;

    public Power(int id, int mid, String name, String comment) {
        this.id = id;
        this.mid = mid;
        this.name = name;
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "power{" +
                "id=" + id +
                ", mid=" + mid +
                ", name='" + name + '\'' +
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
