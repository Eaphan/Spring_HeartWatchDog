package com.xingou.service;

import com.xingou.entity.Examination;

import java.util.List;

/*
 * Created by viczyf on 2017/12/7.
 */
public interface ExaminationService {
    List<Examination> selectExamination(int uid);

    Examination singleExamination(int uid,int id);

    void deleteExamination(int uid, int id);

    void saveOrUpdateExamination(Examination examination);

}
