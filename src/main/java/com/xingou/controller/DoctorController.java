package com.xingou.controller;
/*
*类MainController
*@DATE2017/6/12
*@author viczyf
*/
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DoctorController {
    private UserService userService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService=userService;
    }

    @RequestMapping(value = "/doctor/chat", method = RequestMethod.GET)
    public String index(){
        return "doctor/chat";
    }




}


