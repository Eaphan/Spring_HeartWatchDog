package com.xingou.controller;
/*
*类LoginController
*@DATE2017/7/27
*@author viczyf
*/

import com.xingou.entity.Doctor;
import com.xingou.entity.User;
import com.xingou.service.DoctorService;
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

@Controller
public class LoginController {
    private UserService userService;
    private DoctorService doctorService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService=userService;
    }
    @Autowired
    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }
    @RequestMapping(value = "/getCheckCodeImage")
    public String getImage(HttpSession session, HttpServletResponse response) throws Exception {
        int width = 200;
        int height = 50;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //获取图形上下文
        Graphics g = image.getGraphics();
        //随机类
        Random random = new Random();
        //设定背景
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);
        //设定字体
        g.setFont(new Font("Times New Roman", Font.PLAIN, 22));
        //随机产生干扰线
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 100; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }
        //随机产生4位验证码
//    String[] codes = {"2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        String[] codes = {"2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        String checkcode = "";
        for (int i = 0; i < 4; i++) {
            String str = codes[random.nextInt(codes.length)];
            checkcode += str;
            // 将认证码显示到图象中
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            //调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
            g.drawString(str, 45 * i + 16, 30);
        }
        // 将认证码存入SESSION
        session.setAttribute("checkcode", checkcode);
        // 图象生效
        g.dispose();
        // 输出图象到页面
        ImageIO.write(image, "JPEG", response.getOutputStream());
        return null;
    }
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) fc = 255;
        if (bc > 255) bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    @RequestMapping(value = "/processUserLogin", method = RequestMethod.POST)
    public ModelAndView processUserLogin(HttpServletRequest request, User user,String checkcode ){
        User dbUser=userService.validLogin(user);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("forward:/login.jsp");
        HttpSession session = request.getSession();
        String checkCode = (String) request.getSession().getAttribute("checkcode");
        if (!checkCode.equalsIgnoreCase(checkcode)) {
            mav.addObject("errorMsg", "验证码错误");
        }else if (dbUser == null) {
            mav.addObject("errorMsg", "用户密码不正确");
        }else{
            session.setAttribute("user", dbUser);
            mav.setViewName("redirect:/homepage");
        }
        return mav;
    }
    @RequestMapping(value = "/processDoctorLogin", method = RequestMethod.POST)
    public ModelAndView processDoctorLogin(HttpServletRequest request, Doctor doctor,String checkcode ){
        Doctor dbDoctor=doctorService.validLogin (doctor);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("forward:/login.jsp");
        HttpSession session = request.getSession();
        String checkCode = (String) request.getSession().getAttribute("checkcode");
        if (!checkCode.equalsIgnoreCase(checkcode)) {
            mav.addObject("errorMsg", "验证码错误");
        }else if (dbDoctor == null) {
            mav.addObject("errorMsg", "用户密码不正确");
        }else{
            session.setAttribute("doctor", dbDoctor);
            mav.setViewName("redirect:/doctor/homepage");
        }
        return mav;
    }
}
