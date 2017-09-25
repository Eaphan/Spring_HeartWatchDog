package com.xingou.service.impl;
/*
*类UserServiceImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.dao.InfoDao;
import com.xingou.entity.Info;
import com.xingou.service.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
    @Resource
    private InfoDao infoDao;
    public List<Info> selectInfo(int uid) {
//        String hql = "from Info u where u.uid ="+uid+" order by u.id desc";
//        String hql = "from Info u where u.uid ="+uid;
//        String hql = "from Info u order by u.id desc";
        String hql = "from Info u where u.user.uid="+uid+" order by u.id desc";
        return infoDao.find(hql);
    }


    public List<Info> selectInfoByTime(int uid, String startDate, String endDate) {
        String hql = "from Info u where u.user.uid=" + uid + " and u.date>'" + startDate + "' and u.date<'" + endDate+"' order by u.id desc";
        return infoDao.find(hql);
    }

    public boolean deleteInfo(int uid, int id) {
        Info info=infoDao.get(id);
//        int infoUid=0;
//        try {
//            infoUid = info.getUser().getUid();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//        if (uid == infoUid) {
//            infoDao.delete(id);
//            return true;
//        } else {
//            return false;
//        }
        if (info == null) {
            return false;
        } else if (info.getUser().getUid() == uid) {
            infoDao.delete(id);
            return true;
        } else {
            return false;
        }
    }


    public Info singleInfo(int uid,int id) {
        Info info = infoDao.get(id);
        if (uid == info.getUser().getUid()) {
            return info;
        } else {
            return null;
        }
    }


}