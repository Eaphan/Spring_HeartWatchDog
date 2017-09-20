package com.xingou.controller;
/*
*类MainController
*@DATE2017/6/12
*@author viczyf
*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class MainController {
    @RequestMapping(value = "/user_homepage", method = RequestMethod.GET)
    public String index(){
        return "/user/homepage";
    }
    @RequestMapping(value = "/doctor_homepage", method = RequestMethod.GET)
    public String doctor_homepage(){
        return "/doctor/homepage";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "/login";
    }
    @RequestMapping(value = "/prototype", method = RequestMethod.GET)
    public String prototype(){
        return "/prototype";
    }
    @RequestMapping(value = "/module1", method = RequestMethod.GET)
    public String module1(){
        return "/module1";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String reg(){
        return "/register";
    }
    @RequestMapping(value = "/enterimage", method = RequestMethod.GET)
    public String enterimage(){
        return "/enterimage";
    }
}


