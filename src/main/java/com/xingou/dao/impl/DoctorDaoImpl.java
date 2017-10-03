package com.xingou.dao.impl;/*
*类UserDaoImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.dao.DoctorDao;
import com.xingou.dao.UserDao;
import com.xingou.entity.Doctor;
import com.xingou.entity.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("doctorDao")
public class DoctorDaoImpl extends BaseDaoImpl<Doctor> implements DoctorDao {
    public Doctor findByNameAndPass(Doctor doctor) {
        String hql = "from Doctor u where u.uname = ? and u.passwd = ?";
        Query query = this.getCurrentSession().createQuery(hql);
        query.setParameter(0, doctor.getUname());
        query.setParameter(1, doctor.getPasswd());
        return (Doctor) query.uniqueResult();
    }

    public Doctor findByName(String uname) {
        List<Doctor> doctors = find("select p from Doctor p where p.uname=?0", uname);
        if (doctors != null && doctors.size() > -1) {
            return doctors.get(0);
        }
        return null;
    }

    public List findDoctors(int uid) {
        String hql = "select u.doctors from User u where u.uid=?0";
        List<Doctor> doctors= find(hql, uid);
        return doctors;
    }

}
