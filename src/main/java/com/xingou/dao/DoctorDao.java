package com.xingou.dao;/*
*类DoctorDao
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.entity.Doctor;

import java.util.List;

public interface DoctorDao extends BaseDao<Doctor> {
    Doctor findByNameAndPass(Doctor doctor);
    Doctor findByName(String name);

    List findDoctors(int uid);
}
