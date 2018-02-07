package com.xingou.service.impl;/*
*类RelaServiceImpl
*@DATE2017/9/26
*@author viczyf
*
*/

import com.xingou.dao.RelaDao;
import com.xingou.entity.FriendRequest;
import com.xingou.service.RelaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class RelaServiceImpl implements RelaService {
    @Resource
    private RelaDao relaDao;
    public List findRequestFriends(int uid){
        List<FriendRequest> requestFriends = relaDao.findRequestFriends(uid);
        return requestFriends;
    };

    public List findToreceivedFriends(int uid){
        List<FriendRequest> toreceivedFriends = relaDao.findToreceivedFriends(uid);
        return toreceivedFriends;
    };

    public void refuseRequest(int uid, int id){
        FriendRequest friendRequest = relaDao.get(id);
        if (friendRequest.getToreceived_user().getUid() == uid) {
            relaDao.deleteRequest(id);
        }
    };

    public void cancelRequest(int uid, int id) {
        FriendRequest friendRequest = relaDao.get(id);
        if (friendRequest.getRequest_user().getUid() == uid) {
            relaDao.deleteRequest(id);
        }
    }

    public void addRequest(FriendRequest friendRequest) {
        relaDao.save(friendRequest);
    }
}
