package com.junruo.hungry.servlet.user;

import cn.hutool.crypto.digest.MD5;
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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接收请求参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        password = MD5.create().digestHex(password+"JunXiaoRuo");


        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        //查询数据
        UserService userService = new UserService();
        User u = null;
        try {
            u = userService.login(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //跳转
        if (u==null){
            req.setAttribute("code","0");
            req.setAttribute("mess","账号或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }else {
            HttpSession session = req.getSession();
            session.setAttribute("user",u);

            if (u.getIdent() == 1){

                resp.sendRedirect("food.jsp");
            }else {
                resp.sendRedirect("main.jsp");
            }
        }


    }
}
