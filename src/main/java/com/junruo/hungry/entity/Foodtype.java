package com.junruo.hungry.entity;

public class Foodtype {
    private int id;
    private String typename;

    public Foodtype(int id, String typename) {
        this.id = id;
        this.typename = typename;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "foodtype{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                '}';
    }
}
