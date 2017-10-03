package com.xingou.dao;/*
*类UserDao
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.entity.User;

import java.util.List;

public interface UserDao extends BaseDao<User> {

    User findByNameAndPass(User user);

    User findByName(String name);

    List findFriends(int uid);

    //增加好友，删除好友，查看好友信息
    String findUnameById(int uid);
    int findIdByUname(String uname);

    List findPatients(int doctorid);
}
