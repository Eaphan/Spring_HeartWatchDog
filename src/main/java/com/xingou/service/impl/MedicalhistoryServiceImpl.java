package com.xingou.service.impl;

import com.xingou.dao.MedicalhistoryDao;
import com.xingou.entity.Medicalhistory;
import com.xingou.service.MedicalhistoryService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/*
 * Created by viczyf on 2017/12/8.
 */
@Repository("medicalhistoryService")
public class MedicalhistoryServiceImpl implements MedicalhistoryService {

    @Resource
    private MedicalhistoryDao medicalhistoryDao;

    @Override
    public List<Medicalhistory> selectMedicalhistory(int uid) {
        String hql = "from Medicalhistory m where m.user.uid=" + uid + " order by m.id desc";
        List list = medicalhistoryDao.find(hql);
        return list;
    }

    @Override
    public Medicalhistory singleMedicalhistory(int uid, int id) {
        Medicalhistory medicalhistory = medicalhistoryDao.get(id);
        if (uid == medicalhistory.getUser().getUid()) {
            return medicalhistory;
        } else {
            return null;
        }
    }

    @Override
    public void deleteMedicalhistory(int uid, int id) {
        Medicalhistory medicalhistory = medicalhistoryDao.get(id);
        if (uid == medicalhistory.getUser().getUid()) {
            medicalhistoryDao.delete(medicalhistory);
        }
    }

    @Override
    public void saveOrUpdateMedicalhistory(Medicalhistory medicalhistory) {
        medicalhistoryDao.saveOrUpdate(medicalhistory);
    }
}
