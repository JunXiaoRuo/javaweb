package com.junruo.hungry.servlet.user;

import com.junruo.hungry.entity.User;
import com.junruo.hungry.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/delete")
public class UserDeleteServlet extends HttpServlet {


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
        UserService userService = new UserService();
        int i = 0;
        try {
            i = userService.delete(Integer.parseInt(id));
            ///System.out.println(i);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (type.equals("1")){
            //跳转
            if (i>0){
                req.setAttribute("code","0");
                req.setAttribute("mess","删除成功");
                req.getRequestDispatcher("findById.jsp").forward(req,resp);
                // req.getRequestDispatcher("update.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","删除失败");
            /*req.setAttribute("mess","修改失败");
            req.getRequestDispatcher("update.jsp").forward(req,resp);*/
                /*   req.setAttribute("UpUser",user);*/
                req.getRequestDispatcher("findById.jsp").forward(req,resp);

            }
        }else {
            //跳转
            if (i>0){
                req.setAttribute("code","0");
                req.setAttribute("mess","删除成功");
                req.getRequestDispatcher("findAll").forward(req,resp);
                // req.getRequestDispatcher("update.jsp").forward(req,resp);
            }else {
                req.setAttribute("code","0");
                req.setAttribute("mess","删除失败");
            /*req.setAttribute("mess","修改失败");
            req.getRequestDispatcher("update.jsp").forward(req,resp);*/
                /*   req.setAttribute("UpUser",user);*/
                req.getRequestDispatcher("findAll").forward(req,resp);

            }
        }



    }
}
