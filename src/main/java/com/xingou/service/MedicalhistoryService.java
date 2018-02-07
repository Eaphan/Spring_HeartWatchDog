package com.xingou.service;

import com.xingou.entity.Medicalhistory;

import java.util.List;

/**
 * Created by viczyf on 2017/12/8.
 */
public interface MedicalhistoryService {
    List<Medicalhistory> selectMedicalhistory(int uid);

    Medicalhistory singleMedicalhistory(int uid,int id);

    void deleteMedicalhistory(int uid, int id);

    void saveOrUpdateMedicalhistory(Medicalhistory medicalhistory);



}
