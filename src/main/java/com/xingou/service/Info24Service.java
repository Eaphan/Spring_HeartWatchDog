package com.xingou.service;

import com.xingou.entity.Info24;

import java.util.List;

/*
 * Created by HASS-PC on 2017/10/3.
 */
public interface Info24Service {
    List<Info24> selectInfo24(int uid);

    List<Info24> selectInfo24ByTime(int uid, String startDate, String endDate);

    boolean deleteInfo24(int uid, int id,String filePath);

    Info24 singleInfo24(int uid, int id);
}
