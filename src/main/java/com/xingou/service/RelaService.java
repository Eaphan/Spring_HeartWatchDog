package com.xingou.service;/*
*类UserService
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.entity.User;

import java.util.List;

public interface RelaService {
    List findRequestFriends(int uid);
    List findToreceivedFriends(int uid);
}
