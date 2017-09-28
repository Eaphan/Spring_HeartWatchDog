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

}
