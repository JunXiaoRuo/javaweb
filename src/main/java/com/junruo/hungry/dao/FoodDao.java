package com.junruo.hungry.dao;

import com.junruo.hungry.entity.Food;
import com.junruo.hungry.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDao {
    private Connection connection = JDBCUtils.getConnection();

    private PreparedStatement ps;


    public List<Food> findByID(int uid) throws  SQLException{
        String sql = "select food.id,food.uid,food.foodname,food.type,foodtype.typename,food.feature,food.material,food.price,food.picture,food.hits,food.state,food.comment from food left join foodtype on food.type = foodtype.id where uid=?";
        ps = connection.prepareStatement(sql);
        ps.setInt(1,uid);

        ResultSet resultSet = ps.executeQuery();

        List<Food> list = new ArrayList<Food>();

        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String foodname = resultSet.getString("foodname");
            int type = resultSet.getInt("type");
            String typename = resultSet.getString("typename");
            String feature = resultSet.getString("feature");
            String material = resultSet.getString("material");
            Double price = resultSet.getDouble("price");
            String picture = resultSet.getString("picture");
            int hits = resultSet.getInt("hits");
            int state = resultSet.getInt("state");
            String comment = resultSet.getString("comment");

            Food food = new Food(id,uid,foodname,feature,material,price,type,typename,picture,hits,state,comment);
            list.add(food);

        }
        return list;
    }


    public List<Food> findByAll() throws  SQLException{
        String sql = "select food.id,food.uid,food.foodname,food.type,foodtype.typename,food.feature,food.material,food.price,food.picture,food.hits,food.state,food.comment from food left join foodtype on food.type = foodtype.id ORDER BY food.id";
        ps = connection.prepareStatement(sql);

        ResultSet resultSet = ps.executeQuery();

        List<Food> list = new ArrayList<Food>();

        while (resultSet.next()){
            int id = resultSet.getInt("id");
            int uid = resultSet.getInt("uid");
            String foodname = resultSet.getString("foodname");
            int type = resultSet.getInt("type");
            String typename = resultSet.getString("typename");
            String feature = resultSet.getString("feature");
            String material = resultSet.getString("material");
            Double price = resultSet.getDouble("price");
            String picture = resultSet.getString("picture");
            int hits = resultSet.getInt("hits");
            int state = resultSet.getInt("state");
            String comment = resultSet.getString("comment");

            Food food = new Food(id,uid,foodname,feature,material,price,type,typename,picture,hits,state,comment);
            list.add(food);

        }
        return list;
    }

    public int delete(int id) throws SQLException{
        String sql = "delete from food where id=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,id);
        return ps.executeUpdate();
    }
    public int up(int id) throws SQLException{
        String sql = "update food set state=1 where id=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,id);
        return ps.executeUpdate();
    }
    public int down(int id) throws SQLException{
        String sql = "update food set state=0 where id=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,id);
        return ps.executeUpdate();
    }


    /*public int add(User user) throws SQLException{

        *//*
         INSERT INTO `user` VALUES (null, '王五', 'wangwu', '123456', 1, '18888888', '四川省成都市都江堰市青城山镇成都东软学院', '这是备注', '2021-09-22 08:47:59', 'admin');
         *//*
        String sql = "INSERT INTO user(name,username,password,ident,telephone,address,comment,time,sname) VALUES (?,?,?,?,?,?,?,?,?)";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,user.getName());
        ps.setObject(2,user.getUsername());
        ps.setObject(3,user.getPassword());
        ps.setObject(4,user.getIdent());
        ps.setObject(5,user.getTelephone());
        ps.setObject(6,user.getAddress());
        ps.setObject(7,user.getComment());
        ps.setObject(8,user.getTime());
        ps.setObject(9,user.getSname());

        return ps.executeUpdate();
    }

    public int delete(int id) throws SQLException{
        String sql = "delete from user where id=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,id);
        return ps.executeUpdate();
    }

    public int update(User user) throws SQLException{
        String sql = "update user set name=?,username=?,password=?,ident=?,telephone=?,address=?,comment=?,time=?,sname=? where id=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,user.getName());
        ps.setObject(2,user.getUsername());
        ps.setObject(3,user.getPassword());
        ps.setObject(4,user.getIdent());
        ps.setObject(5,user.getTelephone());
        ps.setObject(6,user.getAddress());
        ps.setObject(7,user.getComment());
        ps.setObject(8,user.getTime());
        ps.setObject(9,user.getSname());
        ps.setObject(10,user.getId());
        return ps.executeUpdate();
    }

    public List<User> findAll() throws SQLException{
        String sql = "select * from user";
        ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        List<User> list = new ArrayList<User>();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            int ident = resultSet.getInt("ident");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
            User user = new User(id,name,username,password,ident,telephone,address,comment,time,sname);
            list.add(user);
        }
        return list;
    }

    public User login(User user) throws  SQLException{
        String sql = "select * from user where username=? and password=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,user.getUsername());
        ps.setObject(2,user.getPassword());
        ResultSet resultSet = ps.executeQuery();
        User u = null;
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            int ident = resultSet.getInt("ident");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
            u = new User(id,name,username,password,ident,telephone,address,comment,time,sname);
        }
        return u;
    }

    public User findByID(int id) throws  SQLException{
        String sql = "select * from user where id=?";
        ps = connection.prepareStatement(sql);
        ps.setInt(1,id);

        ResultSet resultSet = ps.executeQuery();
        User u = null;

        while (resultSet.next()){
            int uid = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            int ident = resultSet.getInt("ident");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
             u = new User(uid,name,username,password,ident,telephone,address,comment,time,sname);

        }
        return u;
    }*/
}
