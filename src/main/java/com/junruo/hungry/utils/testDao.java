package com.junruo.hungry.utils;

import com.junruo.hungry.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class   testDao {
    public static void main(String[] args) {
        String sql = "select * from user";
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        List<User> list = new ArrayList<User>();
        User user;

        try {
            //加载驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            long start = System.currentTimeMillis();
            //建立连接
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eat","root","123456");
            long end = System.currentTimeMillis();
            System.out.println("建立连接耗时："+(end-start)+"ms 毫秒");
            //创建PreparedStatement对象
            ps = conn.prepareStatement(sql);
            //执行SQL语句
            rs = ps.executeQuery();
            //System.out.println("id");
            while(rs.next()){
                /*
                user = new User(rs.getInt("id"),rs.getString("name"),rs.getString("username"),
                        rs.getString("username"),rs.getString("password"),rs.getInt("ident"),
                        rs.getString("telephone"),rs.getString("address"),rs.getString("comment"),
                        rs.getTimestamp("time"),rs.getString("sname"));
                 */
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setIdent(rs.getInt("ident"));
                user.setTelephone(rs.getString("telephone"));
                user.setAddress(rs.getString("address"));
                user.setComment(rs.getString("comment"));

                user.setTime(rs.getString("time"));
                user.setSname(rs.getString("sname"));
                list.add(user);
            }
            System.out.println(list.toString());
            for(User u:list){
                System.out.println(u.getId()+" "+u.getName()+" "+u.getUsername()+" "+u.getPassword()+" "+u.getIdent()+" "+u.getTelephone()+
                        " "+u.getAddress()+" "+u.getComment()+" "+u.getTime()+" "+u.getSname()+" ");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                if(rs!=null){
                    rs.close();
                }
            } catch (Exception e) {
            }
            try {
                if(ps!=null){
                    ps.close();
                }
            } catch (Exception e) {
            }
            try {
                if(conn!=null){
                    conn.close();
                }
            } catch (Exception e) {
            }
        }
    }
}
