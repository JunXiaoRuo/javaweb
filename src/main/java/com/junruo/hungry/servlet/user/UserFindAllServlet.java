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
import java.util.List;

@WebServlet("/findAll")
public class UserFindAllServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //查询数据
        UserService userService = new UserService();
        try {
            List<User> all = userService.findAll();
            //System.out.println(all.toString());
            HttpSession session = req.getSession();
            session.setAttribute("findAll",all);
            //req.setAttribute("findAll",all);

            req.getRequestDispatcher("findAll.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }



    }
}
