package com.xingou.controller;/*
*类Info24Controller
*@DATE2017/10/3
*@author viczyf
*
*/

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.xingou.entity.Info24;
import com.xingou.entity.User;
import com.xingou.service.Info24Service;
import com.xingou.tools.MyTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;
import java.util.Map;

@Controller
public class Info24Controller {
    private Info24Service info24Service;
    @Autowired
    public void setInfo24Service(Info24Service info24Service) {
        this.info24Service = info24Service;
    }
    
    @RequestMapping(value = "/info24Time", method = RequestMethod.GET)
    public String info24time() {
        return "user/info24time";
    }

    @RequestMapping(value = "/info24List", method = RequestMethod.GET)
    public String info24list() {
        return "user/info24list";
    }

    @RequestMapping(value = "/info24Select")
    public void info24Select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List info24List = info24Service.selectInfo24(uid);
        JsonArray array = new JsonArray();
        for (int i = 0; i < info24List.size(); i++) {
            Info24 single = (Info24) info24List.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"info24Single/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"info24Delete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/info24SelectByTime")
    public void info24SelectByTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        int uid = user.getUid();
        List<Info24> info24List = info24Service.selectInfo24ByTime(uid, startdate, enddate);
        JsonArray array = new JsonArray();
        for (int i = 0; i < info24List.size(); i++) {
            Info24 single = (Info24) info24List.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"info24Single/" + single.getId() + " \"target=\"_blank\">查看记录</a>");
            ob.addProperty("del", "<a href=\"info24Delete/" + single.getId() + "\">删除记录</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }

    @RequestMapping(value = "/info24Single/{id}",method = RequestMethod.GET)
    public String info24Single(HttpServletRequest request, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Info24 info24 = info24Service.singleInfo24(uid,id);
        map.put("info24single", info24);
        if (info24.getTime() <= 3700) {
            return "user/info24single";
        } else {
            return "user/info24singlemore";
        }
    }
    @RequestMapping(value = "/info24SingleData",method = RequestMethod.POST)
    public void info24SingleData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addr = request.getParameter("addr");
        String file = request.getSession().getServletContext().getRealPath("/") +"24holter/"+ addr;
        System.out.println("输出文件地址"+file);
        String datascale =request.getParameter("datascale");
        System.out.println(datascale);
        float scale = (float) MyTools.strTofloat(datascale);
        String str="";
        try {
            BufferedReader rd  =new BufferedReader(new FileReader(file));
            String s = rd.readLine();
            while (null != s) {
                str += s;
                s = rd.readLine();
            }
            rd.close();
//            System.out.println(str);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String[] xlist = str.split(",");
        int len = xlist.length;
        StringBuilder xData = new StringBuilder("");
        int startIndex = (int)Math.floor(scale * (len-5324.8));//92160
        for(int i=0;i<5325;i++) {
            xData.append(xlist[startIndex+i]);
            xData.append(",");
        }
        String str_xData = xData.toString();
        JsonObject ob = new JsonObject();
        ob.addProperty("len", len);
        ob.addProperty("Data", str_xData);
        PrintWriter out=response.getWriter();
        out.print(ob);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/info24SingleDataMore",method = RequestMethod.POST)
    public void info24SingleDataMore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String addr = request.getParameter("addr");
        String file = request.getSession().getServletContext().getRealPath("/") +"24holter/"+ addr;
        System.out.println("输出文件地址"+file);
        String datascale =request.getParameter("datascale");
        System.out.println(datascale);
        float scale = (float) MyTools.strTofloat(datascale);
        String str="";
        try {
            BufferedReader rd  =new BufferedReader(new FileReader(file));
            String s = rd.readLine();
            while (null != s) {
                str += s;
                s = rd.readLine();
            }
            rd.close();
//            System.out.println(str);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String[] xlist = str.split(",");
        int len = xlist.length;
        StringBuilder xData = new StringBuilder("");
        int startIndex = (int)Math.floor(scale * (len-92160));//92160
        for(int i=0;i<92161;i++) {
            xData.append(xlist[startIndex+i]);
            xData.append(",");
        }
        String str_xData = xData.toString();
        JsonObject ob = new JsonObject();
        ob.addProperty("len", len);
        ob.addProperty("Data", str_xData);
        PrintWriter out=response.getWriter();
        out.print(ob);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/info24Delete/{id}",method = RequestMethod.GET)
    public ModelAndView info24Delete(HttpServletRequest request, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        String addr = info24Service.singleInfo24(uid, id).getDataaddr();
        String filePath = request.getSession().getServletContext().getRealPath("/") +"24holter/"+ addr;
        Boolean mark = info24Service.deleteInfo24(uid,id,filePath);
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/info24List");
        if (!mark) {
            model.addObject("errorMsg", "删除记录失败，请刷新界面后重试");
            System.out.println("删除失败");
        }
        return model;
    }

    @RequestMapping("/getInfo24Con")
    @ResponseBody
    public void getInfo24Con(@RequestParam("id")int id, @RequestParam("uid")int uid,HttpServletResponse response)throws ServletException, IOException {
        Info24 info24 = info24Service.singleInfo24(uid,id);
//        System.out.println(info24.getDataaddr()+"+++");
//        return info24.getDataaddr();
        PrintWriter out = response.getWriter();
        out.print(info24.getConclusion());
    }
}
