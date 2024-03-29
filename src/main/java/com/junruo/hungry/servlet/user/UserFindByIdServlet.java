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

@WebServlet("/findById")
public class UserFindByIdServlet extends HttpServlet {


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
        //System.out.println(id);

        //查询数据
        UserService userService = new UserService();
        User u = null;
        try {
             u = userService.findByID(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (u == null){
            req.setAttribute("code","0");
            req.setAttribute("mess","未找到改ID用户，请输入正确的ID");
            req.getRequestDispatcher("findById.jsp").forward(req,resp);
        }else {
            req.setAttribute("code","1");
            req.setAttribute("findUser",u);
            req.getRequestDispatcher("findById.jsp").forward(req,resp);
        }



    }
}
