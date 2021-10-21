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
import java.util.Timer;
import java.util.TimerTask;

@WebServlet("/sendSms")
public class SendSmsLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        //接收请求参数
        String phone = req.getParameter("phone");
        String type = req.getParameter("type");
        String code = req.getParameter("code");

        if (type.equals("1")){
            String vcode = "";
            for (int i = 0; i < 6; i++) {
                vcode = vcode + (int)(Math.random() * 9);
            }

            HttpSession session = req.getSession();
            session.setAttribute("vcode",vcode);

            SendSms sendSms = new SendSms();
            sendSms.login(phone,vcode);

            // 将验证码生成时间存入SESSION，若超过五分钟则不通过校验
            try {
                // Timer 和 TimerTask都是java.util包下
                final Timer timer = new Timer();
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        session.removeAttribute("vcode");
                        System.out.println("vcode删除成功");
                        timer.cancel();
                    }
                }, 5 * 60 * 1000);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }else {
            HttpSession session = req.getSession();
            String ccode =(String) session.getAttribute("vcode");
            if (ccode == null || ccode.equals("")){
                System.out.println("验证码过期！");
                req.setAttribute("code","0");
                req.setAttribute("mess","验证码已过期，请重新获取！");
                req.getRequestDispatcher("phoneLogin.jsp").forward(req,resp);
            }else if (code.equals(ccode)){
                session.removeAttribute("vcode");
                System.out.println("验证成功！");
                //查询数据
                UserService userService = new UserService();
                User u = null;
                try {
                    u = userService.findByPhone(phone);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                if (u == null){
                    req.setAttribute("code","0");
                    req.setAttribute("mess","用户不存在，请先注册！");
                    req.getRequestDispatcher("phoneLogin.jsp").forward(req,resp);
                }else {
                    HttpSession session1 = req.getSession();
                    session1.setAttribute("user",u);

                    if (u.getIdent() == 1){

                        resp.sendRedirect("food.jsp");
                    }else {
                        resp.sendRedirect("main.jsp");
                    }
                }
            }else {
                System.out.println("验证失败！");
                req.setAttribute("code","0");
                req.setAttribute("mess","验证码错误，请重新输入！");
                req.getRequestDispatcher("phoneLogin.jsp").forward(req,resp);
            }

        }

    }
}
