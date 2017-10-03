package com.xingou.service.impl;
/*
*类UserServiceImpl
*@DATE2017/9/5
*@author viczyf
*
*/

import com.xingou.dao.Info24Dao;
import com.xingou.entity.Info24;
import com.xingou.service.Info24Service;
import com.xingou.service.InfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Service("info24Service")
public class Info24ServiceImpl implements Info24Service {
    @Resource
    private Info24Dao info24Dao;
    public List<Info24> selectInfo24(int uid) {
        String hql = "from Info24 u where u.user.uid="+uid+" order by u.id desc";
        return info24Dao.find(hql);
    }


    public List<Info24> selectInfo24ByTime(int uid, String startDate, String endDate) {
        String hql = "from Info24 u where u.user.uid=" + uid + " and u.date>'" + startDate + "' and u.date<'" + endDate+"' order by u.id desc";
        return info24Dao.find(hql);
    }

    public boolean deleteInfo24(int uid, int id,String filePath) {
        Info24 info24=info24Dao.get(id);
        if (info24 == null) {
            return false;
        } else if (info24.getUser().getUid() == uid) {

            File file = new File(filePath);
            System.out.println("+++++"+filePath);
            if (file.exists() && file.isFile()) {
                if (file.delete()) {
                    System.out.println("删除单个文件" + filePath + "成功！");
                    info24Dao.delete(id);
                    return true;
                } else {
                    System.out.println("删除单个文件" + filePath + "失败！");
                    return false;
                }
            } else {
                System.out.println("删除单个文件失败：" + filePath + "不存在！");
                info24Dao.delete(id);
                return false;
            }
        } else {
            return false;
        }
    }


    public Info24 singleInfo24(int uid,int id) {
        Info24 info24 = info24Dao.get(id);
        if (uid == info24.getUser().getUid()) {
            return info24;
        } else {
            return null;
        }
    }
}