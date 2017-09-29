package com.xingou.service;/*
*类UserService
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.entity.FriendRequest;
import com.xingou.entity.User;

import java.util.List;

public interface RelaService {
    List findRequestFriends(int uid);
    List findToreceivedFriends(int uid);

    void refuseRequest(int uid, int id);

    void cancelRequest(int uid, int id);

    void addRequest(FriendRequest friendRequest);
}
