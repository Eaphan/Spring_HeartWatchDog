package com.xingou.service.impl;
/*
*类UserServiceImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.dao.DoctorDao;
import com.xingou.dao.UserDao;
import com.xingou.entity.Doctor;
import com.xingou.service.DoctorService;
import com.xingou.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Service("doctorService")
public class DoctorServiceImpl implements DoctorService {
    @Resource
    private DoctorDao doctorDao;

    public Doctor validLogin(Doctor doctor) {
        return doctorDao.findByNameAndPass(doctor);
    }

    public List findDoctors(int uid) {
        return doctorDao.findDoctors(uid);
    }
}
