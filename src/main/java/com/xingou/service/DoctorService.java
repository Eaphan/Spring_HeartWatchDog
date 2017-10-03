package com.xingou.service;/*
*类UserService
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.entity.Doctor;

import java.util.List;

public interface DoctorService {
    // 用户名不存在
    public static final int LOGIN_NOTEXIST = -1;
    // 登录失败
    public static final int LOGIN_FAIL = 0;
    // 以普通用户登录
    public static final int LOGIN_DOCTOR = 2;

    Doctor validLogin(Doctor doctor);

    List findDoctors(int uid);
}
