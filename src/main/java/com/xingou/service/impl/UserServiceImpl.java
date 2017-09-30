package com.xingou.service.impl;
/*
*类UserServiceImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import org.springframework.stereotype.Service;
import com.xingou.dao.DoctorDao;
import com.xingou.dao.UserDao;
import com.xingou.entity.Doctor;
import com.xingou.entity.User;
import com.xingou.service.UserService;


import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    public User validLogin(User user) {
        return userDao.findByNameAndPass(user);
    }
    public List findFriends(int uid){
        return userDao.findFriends(uid);
    };
    public User findUserById(int uid) {
        return userDao.get(uid);
    }

    public User findUserByName(String uname) {
        return userDao.findByName(uname);
    }

    public String findUnameById(int id) {
        return userDao.findUnameById(id);
    }
    public void addFriend(User user, int id) {
        User requestUser = userDao.get(id);
//        Set userFriends = user.getFriends();
        Set userFriends =new HashSet<User>(userDao.findFriends(user.getUid()));
        userFriends.add(requestUser);
        user.setFriends(userFriends);
//        Set requestUserFriends = requestUser.getFriends();
        Set requestUserFriends =new HashSet<User>(userDao.findFriends(requestUser.getUid()));
        requestUserFriends.add(user);
        requestUser.setFriends(requestUserFriends);
        userDao.merge(user);
        userDao.saveOrUpdate(requestUser);
    }

    public void deleteFriend(User user, int id) {
        User requestUser = userDao.get(id);
//        Set userFriends = user.getFriends();
        Set userFriends =new HashSet<User>(userDao.findFriends(user.getUid()));
        userFriends.remove(requestUser);
        user.setFriends(userFriends);
//        Set requestUserFriends = requestUser.getFriends();
        Set requestUserFriends =new HashSet<User>(userDao.findFriends(requestUser.getUid()));
        requestUserFriends.remove(user);
        requestUser.setFriends(requestUserFriends);
        userDao.merge(user);
        userDao.saveOrUpdate(requestUser);
    }
}
