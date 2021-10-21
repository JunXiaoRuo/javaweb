package com.junruo.hungry.entity;

import java.util.Date;

public class Orders {
    private int id;
    private int oid;
    private int uid;
    private int fid;
    private Double price;
    private String pay_type;
    private int state;
    private Date time;
    private Date paytime;
    private Double update;
    private int upstate;
    private String comment;

    public Orders(int id, int oid, int uid, int fid, Double price, String pay_type, int state, Date time, Date paytime, Double update, int upstate, String comment) {
        this.id = id;
        this.oid = oid;
        this.uid = uid;
        this.fid = fid;
        this.price = price;
        this.pay_type = pay_type;
        this.state = state;
        this.time = time;
        this.paytime = paytime;
        this.update = update;
        this.upstate = upstate;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getPay_type() {
        return pay_type;
    }

    public void setPay_type(String pay_type) {
        this.pay_type = pay_type;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public Double getUpdate() {
        return update;
    }

    public void setUpdate(Double update) {
        this.update = update;
    }

    public int getUpstate() {
        return upstate;
    }

    public void setUpstate(int upstate) {
        this.upstate = upstate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", oid=" + oid +
                ", uid=" + uid +
                ", fid=" + fid +
                ", price=" + price +
                ", pay_type='" + pay_type + '\'' +
                ", state=" + state +
                ", time=" + time +
                ", paytime=" + paytime +
                ", update=" + update +
                ", upstate=" + upstate +
                ", comment='" + comment + '\'' +
                '}';
    }
}
