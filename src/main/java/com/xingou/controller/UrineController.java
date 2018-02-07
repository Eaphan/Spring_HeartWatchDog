package com.xingou.controller;
/*
*类LoginController
*@DATE2017/7/27
*@author viczyf
*/

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.xingou.entity.Urine;
import com.xingou.entity.User;
import com.xingou.service.UrineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
public class UrineController {

    private UrineService urineService;

    @Autowired
    public void setUrineService(UrineService urineService) {
        this.urineService = urineService;
    }

    @RequestMapping(value = "/urineTime", method = RequestMethod.GET)
    public String urinetime() {
        return "user/urinetime";
    }

    @RequestMapping(value = "/urineList", method = RequestMethod.GET)
    public String urinelist() {
        return "user/urinelist";
    }

    @RequestMapping(value = "/urineSelect")
    public void urineSelect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List urineList = urineService.selectUrine(uid);
        JsonArray array = new JsonArray();
        for (int i = 0; i < urineList.size(); i++) {
            Urine single = (Urine) urineList.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"urineSingle/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"urineDelete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/urineSelectByTime")
    public void urineSelectByTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        int uid = user.getUid();
        List<Urine> urineList = urineService.selectUrineByTime(uid, startdate, enddate);
        JsonArray array = new JsonArray();
        for (int i = 0; i < urineList.size(); i++) {
            Urine single = (Urine) urineList.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"urineSingle/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"urineDelete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/urineSingle/{id}",method = RequestMethod.GET)
    public String urineSingle(HttpServletRequest request,@PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Urine urine = urineService.singleUrine(uid,id);
        map.put("urinesingle", urine);
        return "user/urinesingle";
    }

    @RequestMapping(value = "/urineDelete/{id}",method = RequestMethod.GET)
    public ModelAndView urineDelete(HttpServletRequest request,@PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Boolean mark = urineService.deleteUrine(uid,id);
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/urineList");
        if (!mark) {
            model.addObject("errorMsg", "删除记录失败，请刷新界面后重试");
            System.out.println("删除失败");
        }
        return model;
    }
}

