package com.xingou.service;

import com.xingou.entity.Urine;

import java.util.List;

/*
 * Created by HASS-PC on 2017/9/21.
 */
public interface UrineService {
    boolean deleteUrine(int uid, int id);

    List<Urine> selectUrine(int uid);

    List<Urine> selectUrineByTime(int uid, String startDate, String endDate);

    Urine singleUrine(int uid, int id);

}
