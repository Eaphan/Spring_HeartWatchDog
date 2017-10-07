package com.xingou.service.impl;
/*
*类UserServiceImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.dao.UrineDao;
import com.xingou.entity.Urine;
import com.xingou.service.UrineService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("urineService")
public class UrineServiceImpl implements UrineService {
    @Resource
    private UrineDao urineDao;
    public List<Urine> selectUrine(int uid) {
//        String hql = "from Urine u where u.uid ="+uid+" order by u.id desc";
//        String hql = "from Urine u where u.uid ="+uid;
//        String hql = "from Urine u order by u.id desc";
        String hql = "from Urine u where u.user.uid="+uid+" order by u.id desc";
        return urineDao.find(hql);
    }


    public List<Urine> selectUrineByTime(int uid, String startDate, String endDate) {
        String hql = "from Urine u where u.user.uid=" + uid + " and u.date>'" + startDate + "' and u.date<'" + endDate+"' order by u.id desc";
        return urineDao.find(hql);
    }

    public boolean deleteUrine(int uid, int id) {
        Urine urine=urineDao.get(id);
//        int urineUid=0;
//        try {
//            urineUid = urine.getUser().getUid();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//        if (uid == urineUid) {
//            urineDao.delete(id);
//            return true;
//        } else {
//            return false;
//        }
        if (urine == null) {
            return false;
        } else if (urine.getUser().getUid() == uid) {
            urineDao.delete(id);
            return true;
        } else {
            return false;
        }
    }


    public Urine singleUrine(int uid,int id) {
        Urine urine = urineDao.get(id);
        if (uid == urine.getUser().getUid()) {
            return urine;
        } else {
            return null;
        }
    }


}