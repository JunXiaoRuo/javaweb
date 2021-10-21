package com.junruo.hungry.servlet.user;

import cn.hutool.crypto.digest.MD5;
import com.junruo.hungry.entity.User;
import com.junruo.hungry.service.UserService;
import com.junruo.hungry.utils.SendSms;

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

@WebServlet("/reg")
public class RegUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接收请求参数
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String code = req.getParameter("code");

        //验证手机号是否存在
        //查询数据
        UserService userService = new UserService();
        User u = null;
        try {
            u = userService.findByPhone(phone);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (u == null){
            //手机号不存在，可以注册！
            HttpSession session = req.getSession();
            String ccode =(String) session.getAttribute("vcode");
            if (ccode == null || ccode.equals("")){
                System.out.println("验证码过期！");
                req.setAttribute("code","0");
                req.setAttribute("mess","验证码已过期，请重新获取！");
                req.getRequestDispatcher("reg.jsp").forward(req,resp);
            }else if (code.equals(ccode)) {
                session.removeAttribute("vcode");
                System.out.println("验证成功！");
                password = MD5.create().digestHex(password+"JunXiaoRuo");

                Date date = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String day = dateFormat.format(date);

                User user = new User();
                user.setName(name);
                user.setUsername(username);
                user.setPassword(password);
                user.setTelephone(phone);
                user.setTime(day);

                //存储数据
                UserService userService1 = new UserService();
                int i = 0;
                try {
                    i = userService1.add(user);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                //跳转
                if (i>0){
                    SendSms sendSms = new SendSms();
                    sendSms.registerSuccess(phone,name);
                    req.setAttribute("code","0");
                    req.setAttribute("mess","注册成功");
                    req.getRequestDispatcher("reg.jsp").forward(req,resp);
                }else {
                    req.setAttribute("code","0");
                    req.setAttribute("mess","注册失败,用户已存在！");
                    req.getRequestDispatcher("reg.jsp").forward(req,resp);

                }



            }

        }else {
            req.setAttribute("code","0");
            req.setAttribute("mess","手机号已存在，请直接登录！");
            req.getRequestDispatcher("reg.jsp").forward(req,resp);

        }
    }
}
