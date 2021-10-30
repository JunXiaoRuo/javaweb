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
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/update")
public class UserUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String updatetype = (String) session.getAttribute("updatetype");


        //接收请求参数
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String ident = req.getParameter("ident");
        String telephone = req.getParameter("telephone");
        String address = req.getParameter("address");
        String comment = req.getParameter("comment");
        String sname = req.getParameter("sname");

        
        //获取数据库中的密码
        UserService userService = new UserService();
        String password1 = null;
        try {
            password1 = userService.findPasswordById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (password.equals("d41d8cd98f00b204e9800998ecf8427e")){//d41d8cd98f00b204e9800998ecf8427e
            System.out.println("不修改密码");
            password = password1;
        }else {
            System.out.println("密码已修改");
            password = MD5.create().digestHex(password+"JunXiaoRuo");
        }

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String day = dateFormat.format(date);

        User user = new User();

        user.setId(Integer.parseInt(id));
        user.setName(name);
        user.setUsername(username);
        user.setPassword(password);
        user.setIdent(Integer.parseInt(ident));
        user.setTelephone(telephone);
        user.setAddress(address);
        user.setComment(comment);
        user.setSname(sname);
        user.setTime(day);

        int i = 0;
        try {
            i = userService.update(user);
            System.out.println(i);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (updatetype.equals("1")){
            //跳转
            if (i>0){
                req.setAttribute("mess","修改成功,重新登录后更新！");
                req.setAttribute("code","0");
                //req.setAttribute("UpUser",user);
                req.getRequestDispatcher("main.jsp").forward(req,resp);
                // req.getRequestDispatcher("update.jsp").forward(req,resp);
            }else {
                req.setAttribute("mess","修改失败，手机号已存在！");
                req.setAttribute("code","0");
            /*req.setAttribute("mess","修改失败");
            req.getRequestDispatcher("update.jsp").forward(req,resp);*/
                //req.setAttribute("UpUser",user);
                req.getRequestDispatcher("main.jsp").forward(req,resp);

            }
        }else {
            //跳转
            if (i>0){
                req.setAttribute("mess","修改成功");
                req.setAttribute("code","0");
                //req.setAttribute("UpUser",user);
                req.getRequestDispatcher("findAll").forward(req,resp);
                // req.getRequestDispatcher("update.jsp").forward(req,resp);
            }else {
                req.setAttribute("mess","修改失败");
                req.setAttribute("code","0");
            /*req.setAttribute("mess","修改失败");
            req.getRequestDispatcher("update.jsp").forward(req,resp);*/
                //req.setAttribute("UpUser",user);
                req.getRequestDispatcher("findAll").forward(req,resp);

            }
        }

    }
}
