package com.junruo.hungry.servlet.food;

import com.junruo.hungry.service.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/upAndDownFood")
public class FoodUpAndDownServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接收请求参数
        String id = req.getParameter("id");
        String type = req.getParameter("type");
        //System.out.println(type);

        //存储数据
        FoodService foodService = new FoodService();
        int i = 0;
        try {
            if (type.equals("1")||type.equals("3")||type.equals("5")){
                //上架
                i = foodService.up(Integer.parseInt(id));
                //System.out.println("执行上架操作");
            }else if (type.equals("2")||type.equals("4")||type.equals("6")){
                //下架
                i = foodService.down(Integer.parseInt(id));
                //System.out.println("执行下架操作");
            }
            ///System.out.println(i);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //跳转
        if (i>0){
            if (type.equals("1")||type.equals("2")){
                req.setAttribute("code","0");
                req.setAttribute("mess","操作成功");
                req.getRequestDispatcher("food.jsp").forward(req,resp);
            }else if (type.equals("3")||type.equals("4")){
                req.setAttribute("code","0");
                req.setAttribute("mess","操作成功");
                req.getRequestDispatcher("findFoodById.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","操作成功");
                req.getRequestDispatcher("findFoodAll").forward(req,resp);
            }

        }else {
            if (type.equals("1")||type.equals("2")){
                req.setAttribute("code","0");
                req.setAttribute("mess","操作失败");
                req.getRequestDispatcher("food.jsp").forward(req,resp);
            }else if (type.equals("3")||type.equals("4")){
                req.setAttribute("code","0");
                req.setAttribute("mess","操作失败");
                req.getRequestDispatcher("findFoodById.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","操作失败");
                req.getRequestDispatcher("findFoodAll").forward(req,resp);
            }
        }

    }
}
