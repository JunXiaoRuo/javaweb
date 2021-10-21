package com.junruo.hungry.entity;

public class Food {
    private int id;
    private int uid;
    private String foodname;
    private String feature;
    private String material;
    private Double price;
    private int type;
    private String typename;
    private String picture;
    private int hits;
    private int state;
    private String comment;

    public Food() {
    }

    public Food(int id, int uid, String foodname, String feature, String material, Double price, int type, String typename, String picture, int hits, int state, String comment) {
        this.id = id;
        this.uid = uid;
        this.foodname = foodname;
        this.feature = feature;
        this.material = material;
        this.price = price;
        this.type = type;
        this.typename = typename;
        this.picture = picture;
        this.hits = hits;
        this.state = state;
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", uid=" + uid +
                ", foodname='" + foodname + '\'' +
                ", feature='" + feature + '\'' +
                ", material='" + material + '\'' +
                ", price=" + price +
                ", type=" + type +
                ", typename='" + typename + '\'' +
                ", picture='" + picture + '\'' +
                ", hits=" + hits +
                ", state=" + state +
                ", comment='" + comment + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getHits() {
        return hits;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
