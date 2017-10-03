package com.xingou.controller;
/*
*类LoginController
*@DATE2017/7/27
*@author viczyf
*/

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.xingou.entity.Doctor;
import com.xingou.entity.Info;
import com.xingou.entity.User;
import com.xingou.service.DoctorService;
import com.xingou.service.InfoService;
import com.xingou.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import static java.awt.SystemColor.info;

@Controller
public class InfoController {

    private InfoService infoService;

    @Autowired
    public void setInfoService(InfoService infoService) {
        this.infoService = infoService;
    }

    @RequestMapping(value = "/infoTime", method = RequestMethod.GET)
    public String infotime() {
        return "user/infotime";
    }

    @RequestMapping(value = "/infoList", method = RequestMethod.GET)
    public String infolist() {
        return "user/infolist";
    }

    @RequestMapping(value = "/infoSelect")
    public void infoSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List infoList = infoService.selectInfo(uid);
        JsonArray array = new JsonArray();
        for (int i = 0; i < infoList.size(); i++) {
            Info single = (Info) infoList.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"infoSingle/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"infoDelete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/infoSelectByTime")
    public void infoSelectByTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        int uid = user.getUid();
        List<Info> infoList = infoService.selectInfoByTime(uid, startdate, enddate);
        JsonArray array = new JsonArray();
        for (int i = 0; i < infoList.size(); i++) {
            Info single = (Info) infoList.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"infoSingle/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"infoDelete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/infoSingle/{id}",method = RequestMethod.GET)
    public String infoSingle(HttpServletRequest request,@PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Info info = infoService.singleInfo(uid,id);
        map.put("infosingle", info);
        return "user/infosingle";
    }

    @RequestMapping(value = "/infoDelete/{id}",method = RequestMethod.GET)
    public ModelAndView infoDelete(HttpServletRequest request,@PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Boolean mark = infoService.deleteInfo(uid,id);
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/infoList");
        if (!mark) {
            model.addObject("errorMsg", "删除记录失败，请刷新界面后重试");
            System.out.println("删除失败");
        }
        return model;
    }

}

