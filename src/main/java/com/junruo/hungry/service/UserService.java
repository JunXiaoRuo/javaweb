package com.junruo.hungry.service;

import com.junruo.hungry.dao.UserDao;
import com.junruo.hungry.entity.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private UserDao userDao = new UserDao();

    public int add(User user) throws SQLException{
        return userDao.add(user);
    }

    public int delete(int id) throws SQLException{
        return userDao.delete(id);
    }

    public int update(User user) throws SQLException{
        return userDao.update(user);
    }

    public List<User> findAll() throws SQLException{
        return userDao.findAll();
    }

    public User findByID(int id) throws  SQLException{
        return userDao.findByID(id);
    }

    public User login(User user) throws  SQLException{
        return userDao.login(user);
    }

    public User findByPhone(String phone) throws  SQLException{
        return userDao.findByPhone(phone);
    }


}
