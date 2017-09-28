package com.xingou.dao;

import com.xingou.entity.FriendRequest;

import java.util.List;

/*
 * Created by HASS-PC on 2017/9/26.
 */
/*
需要实现的功能有，查询好友申请，用户的申请，撤销申请，添加新好友，同意或者拒绝
*/
public interface RelaDao extends BaseDao<FriendRequest> {

    List findRequestFriends(int uid);
    List findToreceivedFriends(int uid);
    void deleteRequest(int id);
    void saveRequest(FriendRequest f);

}
