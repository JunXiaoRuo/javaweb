package com.junruo.hungry.dao;

import com.junruo.hungry.entity.User;
import com.junruo.hungry.utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {
    private Connection connection = JDBCUtils.getConnection();

    private PreparedStatement ps;

    public int add(User user) throws SQLException{

        /*
         INSERT INTO `user` VALUES (null, '王五', 'wangwu', '123456', 1, '18888888', '四川省成都市都江堰市青城山镇成都东软学院', '这是备注', '2021-09-22 08:47:59', 'admin');
         */
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
        String sql = "select user.id,user.name,user.username,user.password,user.ident,power.pname,user.telephone,user.address,user.comment,user.time,user.sname from user left join power on user.ident = power.id";
        ps = connection.prepareStatement(sql);
        ResultSet resultSet = ps.executeQuery();
        List<User> list = new ArrayList<User>();
        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            int ident = resultSet.getInt("ident");
            String pname = resultSet.getString("pname");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
            User user = new User(id,name,username,password,ident,pname,telephone,address,comment,time,sname);
            list.add(user);
        }
        return list;
    }

    public User login(User user) throws  SQLException{
        String sql = "select user.id,user.name,user.username,user.password,user.ident,power.pname,user.telephone,user.address,user.comment,user.time,user.sname from user left join power on user.ident = power.id where username=? and password=?";
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
            String pname = resultSet.getString("pname");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
            u = new User(id,name,username,password,ident,pname,telephone,address,comment,time,sname);
        }
        return u;
    }

    public User findByID(int id) throws  SQLException{
        String sql = "select user.id,user.name,user.username,user.password,user.ident,power.pname,user.telephone,user.address,user.comment,user.time,user.sname from user left join power on user.ident = power.id where user.id=?";
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
            String pname = resultSet.getString("pname");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
             u = new User(uid,name,username,password,ident,pname,telephone,address,comment,time,sname);

        }
        return u;
    }
    public User findByPhone(String phone) throws  SQLException{
        String sql = "select user.id,user.name,user.username,user.password,user.ident,power.pname,user.telephone,user.address,user.comment,user.time,user.sname from user left join power on user.ident = power.id where user.telephone=?";
        ps = connection.prepareStatement(sql);
        ps.setObject(1,phone);

        ResultSet resultSet = ps.executeQuery();
        User u = null;

        while (resultSet.next()){
            int uid = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String username = resultSet.getString("username");
            String password = resultSet.getString("password");
            int ident = resultSet.getInt("ident");
            String pname = resultSet.getString("pname");
            String telephone = resultSet.getString("telephone");
            String address = resultSet.getString("address");
            String comment = resultSet.getString("comment");
            String time = resultSet.getString("time");
            String sname = resultSet.getString("sname");
             u = new User(uid,name,username,password,ident,pname,telephone,address,comment,time,sname);

        }
        return u;
    }
}
