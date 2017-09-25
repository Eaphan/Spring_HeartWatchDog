package com.xingou.service;

import com.xingou.entity.Info;

import java.util.List;

/*
 * Created by HASS-PC on 2017/9/21.
 */
public interface InfoService {
    boolean deleteInfo(int uid, int id);

    List<Info> selectInfo(int uid);

    List<Info> selectInfoByTime(int uid,String startDate,String endDate);

    Info singleInfo(int uid,int id);
}
