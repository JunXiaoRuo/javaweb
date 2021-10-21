package com.junruo.hungry.entity;

import java.util.Date;

public class Review {
    private int id;
    private int fid;
    private String comment;
    private Date time;

    public Review(int id, int fid, String comment, Date time) {
        this.id = id;
        this.fid = fid;
        this.comment = comment;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "review{" +
                "id=" + id +
                ", fid=" + fid +
                ", comment='" + comment + '\'' +
                ", time=" + time +
                '}';
    }
}
