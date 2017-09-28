package com.xingou.dao.impl;
/*
*类UserDaoImpl
*@DATE2017/9/5
*@author viczyf
*/

import com.xingou.dao.InfoDao;
import com.xingou.dao.RelaDao;
import com.xingou.entity.FriendRequest;
import com.xingou.entity.Info;
import com.xingou.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("relaDao")
public class RelaDaoImpl extends BaseDaoImpl<FriendRequest>  implements RelaDao {
    public List findRequestFriends(int uid){
        String hql = "select f from FriendRequest f where f.toreceived_user.uid=?0";
        List<FriendRequest> requestFriends = find(hql, uid);
        return requestFriends;
    };

    public List findToreceivedFriends(int uid){
        String hql = "select f from FriendRequest f where f.request_user.uid=?0";
        List<FriendRequest> toreceivedFriends = find(hql, uid);
        return toreceivedFriends;
    };

    public void deleteRequest(int id){
        delete(id);
    };

    public void saveRequest(FriendRequest f) {
        save(f);
    }

}
