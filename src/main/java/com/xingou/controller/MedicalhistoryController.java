package com.xingou.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.xingou.entity.Medicalhistory;
import com.xingou.entity.User;
import com.xingou.service.MedicalhistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/*
 * Created by viczyf on 2017/12/8.
 */
@Controller
public class MedicalhistoryController {
    //    应该包括一下几个动作，列表，列表界面，单个，删除，添加界面，添加动作，修改界面，修改动作
    private MedicalhistoryService medicalhistoryService;

    @Autowired
    public void setMedicalhistoryService(MedicalhistoryService medicalhistoryService) {
        this.medicalhistoryService = medicalhistoryService;
    }
    @RequestMapping(value = "medicalhistoryList")
    public String medicalhistoryList() {
        return "user/medicalhistorylist";
    }
    @RequestMapping(value = "medicalhistoryAdd")
    public String medicalhistoryAdd(){
        return "user/medicalhistoryadd";
    }
    @RequestMapping(value="/addMedicalhistory")
    public String addMedicalhistory(Medicalhistory mh,HttpSession session) {
        User user = (User)session.getAttribute("user");
        mh.setUser(user);
        user.getMedicalhistorys().add(mh);
        medicalhistoryService.saveOrUpdateMedicalhistory(mh);
        return "redirect:/medicalhistoryList";

    }

    @RequestMapping(value = "/medicalhistorySelect")
    public void medicalhistorySelect(HttpSession session, HttpServletResponse response) throws IOException {

        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        System.out.println("城市"+uid);
        List list = medicalhistoryService.selectMedicalhistory(uid);
        JsonArray array = new JsonArray();
        System.out.println(list.size());
        for (int i=0;i< list.size();i++){
            Medicalhistory mhis=(Medicalhistory) list.get(i);
            JsonObject ob=new JsonObject();
            ob.addProperty("id",i+1);
            ob.addProperty("city",mhis.getCity());
            ob.addProperty("date",mhis.getDate());
            ob.addProperty("hospital",mhis.getHospital());
            ob.addProperty("office",mhis.getOffice());
            ob.addProperty("doctor",mhis.getDoctor());
            ob.addProperty("conclusion",mhis.getConclusion());
            ob.addProperty("edit","<a href=\"MedicalhistoryServlet?action=single&id="+mhis.getId()+"\" target=\"_blank\">编辑</a>");
            ob.addProperty("del","<a href=\"MedicalhistoryServlet?action=del&id="+mhis.getId()+"\">删除</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }




    @RequestMapping(value = "/medicalhistorySingle/{id}",method = RequestMethod.GET)
    public String MedicalhistorySingle(HttpSession session, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Medicalhistory mh = medicalhistoryService.singleMedicalhistory(uid, id);
        map.put("mh", mh);
        return "user/medicalhistorysingle";
    }

    @RequestMapping(value = "/medicalhistoryModify/{id}",method = RequestMethod.GET)
    public String medicalhistoryModify(HttpSession session, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Medicalhistory mh = medicalhistoryService.singleMedicalhistory(uid, id);
        map.put("mh", mh);
        return "user/medicalhistorymodify";
    }

    //修改完之后转到single界面
    @RequestMapping(value = "/modifyMedicalhistory",method = RequestMethod.POST)
    public String modifyMedicalhistory(HttpSession session,Medicalhistory mh, Map<String, Object> map) throws ServletException, IOException {

        User user = (User) session.getAttribute("user");
        mh.setUser(user);
        medicalhistoryService.saveOrUpdateMedicalhistory(mh);

        return "redirect:/medicalhistoryList";
    }

}
