package com.xingou.controller;
/*
*类MainController
*@DATE2017/6/12
*@author viczyf
*/
import com.xingou.entity.User;
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class UserController {
    private UserService userService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService=userService;
    }

    @RequestMapping(value = "/homepage", method = RequestMethod.GET)
    public String index(){
        return "user/homepage";
    }
    @RequestMapping(value = "/doctor/homepage", method = RequestMethod.GET)
    public String doctor_homepage(){
        return "/doctor/homepage";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }
    @RequestMapping(value = "/prototype", method = RequestMethod.GET)
    public String prototype(){
        return "prototype";
    }
    @RequestMapping(value = "/module1", method = RequestMethod.GET)
    public String module1(){
        return "module1";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String reg(){
        return "register";
    }
    @RequestMapping(value = "/enterimage", method = RequestMethod.GET)
    public String enterimage(){
        return "enterimage";
    }



}


