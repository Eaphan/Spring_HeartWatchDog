package com.xingou.controller;/*
*类RelaController
*@DATE2017/9/24
*@author viczyf
*
*/

import com.xingou.entity.Info;
import com.xingou.entity.User;
import com.xingou.service.RelaService;
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Controller
public class RelaController {
    //    private RelaService relaService;
//    @Autowired
//    public void setRelaService(RelaService relaService) {
//        this.relaService = relaService;
//    }
    private UserService userService;
    private RelaService relaService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService=userService;
    }

    @Autowired
    public void setRelaService(RelaService relaService) {
        this.relaService = relaService;
    }
    @RequestMapping("relaManage")
    public ModelAndView relaList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        List friends = userService.findFriends(uid);
//
        List requestFriends = relaService.findRequestFriends(uid);
//
        List toreceivedFriends = relaService.findToreceivedFriends(uid);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user/relamanage");
        mav.addObject("friends", friends);
        mav.addObject("requestFriends", requestFriends);
        mav.addObject("toreceivedFriends", toreceivedFriends);
        return mav;
    }
}

