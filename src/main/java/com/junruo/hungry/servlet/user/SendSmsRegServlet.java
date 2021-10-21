package com.junruo.hungry.servlet.user;

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
import java.util.Timer;
import java.util.TimerTask;

@WebServlet("/sendSmsReg")
public class SendSmsRegServlet extends HttpServlet {
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

        
        String vcode = "";
        for (int i = 0; i < 6; i++) {
            vcode = vcode + (int)(Math.random() * 9);
        }

        HttpSession session = req.getSession();
        session.setAttribute("vcode",vcode);

        SendSms sendSms = new SendSms();
        sendSms.register(phone,vcode);

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

    }
}
