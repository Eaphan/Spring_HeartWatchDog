package com.xingou.controller;/*
*类RelaController
*@DATE2017/9/24
*@author viczyf
*
*/

import com.xingou.entity.Info;
import com.xingou.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Set;

@Controller
public class RelaController {
    //    private RelaService relaService;
//    @Autowired
//    public void setRelaService(RelaService relaService) {
//        this.relaService = relaService;
//    }
    @RequestMapping("relaList")
    public String relaList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Set<Info> infos = user.getInfos();
        for (Info info: infos) {
            System.out.println("+++++++++++++++++++"+info.getDate());
        }
        return "user/relalist";
    }

}

