package com.junruo.hungry.entity;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String username;
    private String password;
    private int ident;
    private String pname;
    private String telephone;
    private String address;
    private String comment;
    private String time;
    private String sname;


    public User() {
    }

    public User(int id, String name, String username, String password, int ident, String pname, String telephone, String address, String comment, String time, String sname) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.ident = ident;
        this.pname = pname;
        this.telephone = telephone;
        this.address = address;
        this.comment = comment;
        this.time = time;
        this.sname = sname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdent() {
        return ident;
    }

    public void setIdent(int ident) {
        this.ident = ident;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", ident=" + ident +
                ", pname='" + pname + '\'' +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                ", comment='" + comment + '\'' +
                ", time='" + time + '\'' +
                ", sname='" + sname + '\'' +
                '}';
    }


}
