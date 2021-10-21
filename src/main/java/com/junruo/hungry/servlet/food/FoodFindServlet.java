package com.junruo.hungry.servlet.food;

import com.junruo.hungry.entity.Food;
import com.junruo.hungry.service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/findFood")
public class FoodFindServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        //接收请求参数
        int id = Integer.parseInt(req.getParameter("id"));
        //查询数据
        FoodService foodService = new FoodService();
        try {
            List<Food> foodList = foodService.findByID(id);
            HttpSession session = req.getSession();
            req.setAttribute("code","1");
            session.setAttribute("foodList",foodList);
            //System.out.println(foodList.toString());

            req.getRequestDispatcher("food.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }



    }
}
