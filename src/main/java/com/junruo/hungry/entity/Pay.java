package com.junruo.hungry.entity;

import java.util.Date;

public class Pay {
    private int id;
    private int uid;
    private int oid;
    private Date time;

    public Pay(int id, int uid, int oid, Date time) {
        this.id = id;
        this.uid = uid;
        this.oid = oid;
        this.time = time;
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

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Pay{" +
                "id=" + id +
                ", uid=" + uid +
                ", oid=" + oid +
                ", time=" + time +
                '}';
    }
}
