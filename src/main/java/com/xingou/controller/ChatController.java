package com.xingou.controller;

import com.google.gson.GsonBuilder;
import com.xingou.entity.Message;
import com.xingou.service.UserService;
import com.xingou.websocket.MyWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/*
 * Created by viczyf on 2017/9/30.
 */
@Controller
public class ChatController {

    @Autowired
    MyWebSocketHandler myWebSocketHandler;
    @Autowired
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @RequestMapping("/chat")
    public String chat() {
        return "/user/chat";
    }
    @RequestMapping("/onlineusers")
    @ResponseBody
    public Set<String> onlineusers(HttpSession session){
        Map<Integer, WebSocketSession> map= MyWebSocketHandler.userSocketSessionMap;
        Set<Integer> set=map.keySet();
        Iterator<Integer> it = set.iterator();
        Set<String> nameset=new HashSet<String>();
        while(it.hasNext()){
            Integer entry = it.next();
//            String name=userService.findUserById(entry).getUname();
            String name=userService.findUnameById(entry);
            String username=(String)session.getAttribute("username");
            if(!username.equals(name))
                nameset.add(name);
        }
        return nameset;
//        将userSocketSessionMap中不是user的用户名放进nameset中
    }
//    发布系统广播
@ResponseBody
@RequestMapping(value = "broadcast", method = RequestMethod.POST)
public void broadcast(@RequestParam("text") String text) throws IOException {
    Message msg = new Message();
    msg.setDate(new Date());
    msg.setFrom(-1);//-1表示系统广播
    msg.setFromName("系统广播");
    msg.setTo(0);
    msg.setText(text);
    myWebSocketHandler.broadcast(new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
}
}
