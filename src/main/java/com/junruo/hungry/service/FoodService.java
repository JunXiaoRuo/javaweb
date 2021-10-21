package com.junruo.hungry.service;

import com.junruo.hungry.dao.FoodDao;
import com.junruo.hungry.entity.Food;

import java.sql.SQLException;
import java.util.List;

public class FoodService {
    private FoodDao foodDao = new FoodDao();


    public List<Food> findByID(int id) throws  SQLException{
        return foodDao.findByID(id);
    }
    public List<Food> findByAll() throws  SQLException{
        return foodDao.findByAll();
    }
    public int delete(int id) throws SQLException{
        return foodDao.delete(id);
    }
    public int up(int id) throws SQLException{
        return foodDao.up(id);
    }
    public int down(int id) throws SQLException{
        return foodDao.down(id);
    }






}
