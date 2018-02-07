package com.xingou.controller;

import com.xingou.entity.Temperature;
import com.xingou.entity.User;
import com.xingou.service.TempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by viczyf on 2017/11/27.
 */
@Controller
public class TempController {
    private TempService tempService;

    @Autowired
    public void setTempService(TempService tempService) {
        this.tempService = tempService;
    };

    @RequestMapping(value = "/tempTend")
    public ModelAndView tempTend(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List<Temperature> tempList = tempService.selectTemp(uid);
        List<Temperature> tempMaxList = tempService.selectMaxTemp(uid);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user/temptend");
        mav.addObject("tempList", tempList);
        mav.addObject("tempMaxList", tempMaxList);
        return mav;
    }
}
