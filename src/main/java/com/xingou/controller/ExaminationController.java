package com.xingou.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.xingou.entity.Examination;
import com.xingou.entity.User;
import com.xingou.service.ExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/*
 * Created by viczyf on 2017/12/7.
 */
@Controller
public class ExaminationController {
    //    private ExaminationService

    private ExaminationService examinationService;

    @Autowired
    public void setExaminationService(ExaminationService examinationService) {
        this.examinationService = examinationService;
    }

    @RequestMapping(value = "examinationList")
    public String examinationList() {
        return "user/examinationlist";
    }
    @RequestMapping(value = "examinationAdd")
    public String examinationAdd(){
        return "user/examinationadd";
    }


//    列表界面,查找列表，单个，删除动作，添加动作，添加编辑界面，查看趋势图,修改界面，修改提交动作
    @RequestMapping(value = "/examinationSelect")
    public void examinationSelect(HttpSession session, HttpServletResponse response) throws IOException{

        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List list = examinationService.selectExamination(uid);
        JsonArray array = new JsonArray();
        for (int i = 0; i < list.size(); i++) {
            Examination single = (Examination) list.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i + 1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("hospital", single.getHospital());
            ob.addProperty("read", "<a href=\"examinationSingle/" + single.getId() + " \"target=\"_blank\">查看</a>");
            ob.addProperty("del", "<a href=\"examinationDelete/" + single.getId() + "\">删除</a>");
            array.add(ob);
        }
        PrintWriter out = response.getWriter();
        out.print(array);
    }
    //添加体检报告动作
    @RequestMapping(value="/addExamination")
    public String addExamination(Examination em,HttpSession session) {
        User user = (User)session.getAttribute("user");
        em.setUser(user);
        user.getExaminations().add(em);
        examinationService.saveOrUpdateExamination(em);
        return "redirect:/examinationList";

    }
//    趋势图
    @RequestMapping(value = "examinationTend")
    public ModelAndView examinationTend(HttpSession session) {
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List examinationList = examinationService.selectExamination(uid);
        ModelAndView model = new ModelAndView();
        model.addObject("emList", examinationList);
        model.setViewName("user/examinationtend");
        return model;
    }
    @RequestMapping(value = "/examinationSingle/{id}",method = RequestMethod.GET)
    public String ExaminationSingle(HttpSession session, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Examination em = examinationService.singleExamination(uid, id);
        map.put("em", em);
        return "user/examinationsingle";
    }
    @RequestMapping(value = "/examinationModify/{id}",method = RequestMethod.GET)
    public String examinationModify(HttpSession session, @PathVariable("id") Integer id, Map<String, Object> map) throws ServletException, IOException {
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Examination em = examinationService.singleExamination(uid, id);
        map.put("em", em);
        return "user/examinationmodify";
    }
//修改完之后转到single界面
    @RequestMapping(value = "/modifyExamination",method = RequestMethod.POST)
    public String modifyExamination(HttpSession session,Examination em, Map<String, Object> map) throws ServletException, IOException {
        System.out.println("姓名"+em.getName());
        System.out.println(em.getAge());
        System.out.println(em.getHospital());
        System.out.println(em.getTizhicon());
        System.out.println("性别"+em.getGender());
        User user = (User) session.getAttribute("user");
        em.setUser(user);
        examinationService.saveOrUpdateExamination(em);

//        map.put("em", em);
//        return "user/examinationsingle";
        return "redirect:/examinationSingle/" + em.getId();
    }
}
