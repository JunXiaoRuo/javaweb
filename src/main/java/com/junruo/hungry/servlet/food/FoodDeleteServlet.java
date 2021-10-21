package com.junruo.hungry.servlet.food;

import com.junruo.hungry.service.FoodService;
import com.junruo.hungry.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteFood")
public class FoodDeleteServlet extends HttpServlet {


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


        //存储数据
        FoodService foodService = new FoodService();
        int i = 0;
        try {
            i = foodService.delete(Integer.parseInt(id));
            ///System.out.println(i);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (type.equals("1")){
            //跳转
            if (i>0){
                req.setAttribute("code","0");
                req.setAttribute("mess","删除成功");
                req.getRequestDispatcher("findFoodById.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","删除失败");
                req.getRequestDispatcher("findFoodById.jsp").forward(req,resp);

            }
        }else if (type.equals("2")){
            //跳转
            if (i>0){
                req.setAttribute("code","0");
                req.setAttribute("mess","删除成功");
                req.getRequestDispatcher("findFoodAll").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","删除失败");
                req.getRequestDispatcher("findFoodAll").forward(req,resp);
            }
        }else if (type.equals("3")){
            //跳转
            if (i>0){
                req.setAttribute("code","0");
                req.setAttribute("mess","删除成功");
                req.getRequestDispatcher("food.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","删除失败");
                req.getRequestDispatcher("food.jsp").forward(req,resp);
            }
        }



    }
}
