package com.xingou.service.impl;

import com.xingou.dao.ExaminationDao;
import com.xingou.entity.Examination;
import com.xingou.service.ExaminationService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/*
 * Created by viczyf on 2017/12/7.
 */
@Repository("examinationService")
public class ExamiantionServiceImpl implements ExaminationService{

    @Resource
    private ExaminationDao examinationDao;

    @Override
    public List<Examination> selectExamination(int uid) {
        String hql = "from Examination e where e.user.uid=" + uid + "order by e.id desc";
        List list = examinationDao.find(hql);
        return list;
    }

    @Override
    public Examination singleExamination(int uid, int id) {
        Examination examination = examinationDao.get(id);
        if (uid == examination.getUser().getUid()) {
            return examination;
        } else {
            return null;
        }
    }

    @Override
    public void deleteExamination(int uid, int id) {
        Examination examination = examinationDao.get(id);
        if (uid == examination.getUser().getUid()) {
            examinationDao.delete(examination);
        }
    }

    @Override
    public void saveOrUpdateExamination(Examination examination) {
        examinationDao.saveOrUpdate(examination);

    }
}
