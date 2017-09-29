package com.xingou.controller;/*
*类RelaController
*@DATE2017/9/24
*@author viczyf
*
*/

import com.xingou.entity.FriendRequest;
import com.xingou.entity.Info;
import com.xingou.entity.User;
import com.xingou.service.RelaService;
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
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
    @RequestMapping("/relaManage")
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
    @RequestMapping("/refuseRequest/{id}")
    public String refuseRequest(HttpServletRequest request,@PathVariable("id") Integer id) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        relaService.refuseRequest(uid,id);
        return "redirect:/relaManage";
    }
    @RequestMapping("/cancelRequest/{id}")
    public String cancelRequest(@PathVariable("id") Integer id,HttpServletRequest request) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        relaService.cancelRequest(uid,id);
        return "redirect:/relaManage";
    }

    @RequestMapping(value = "/addRequest",method = RequestMethod.POST)
    public String addRequest(@RequestParam("relaName")String relaName,@RequestParam("information")String information,HttpServletRequest request) {
//    public String addRequest(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        User toUser = userService.findUserByName(relaName);
        FriendRequest f = new FriendRequest();
        f.setRequest_user(user);
        f.setToreceived_user(toUser);
        f.setInformation(information);
        relaService.addRequest(f);
//        return "relaManage";
        return "redirect:/relaManage";
    }
    @RequestMapping(value = "/addFriend/{id}/{requestId}")
    public String addFriends(@PathVariable("id") Integer id,@PathVariable("requestId") Integer requestId, HttpServletRequest request) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int uid = user.getUid();
        relaService.refuseRequest(uid,requestId);
        userService.addFriend(user,id);
        return "redirect:/relaManage";
    }

    @RequestMapping(value = "/deleteFriend/{friendId}")
    public String deleteFriend(@PathVariable("friendId") Integer friendId, HttpServletRequest request) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        userService.deleteFriend(user,friendId);
        return "redirect:/relaManage";
    }
}

