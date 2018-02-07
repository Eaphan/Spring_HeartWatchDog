package com.xingou.service;

import com.xingou.entity.Temperature;

import java.util.List;

/**
 * Created by viczyf on 2017/11/27.
 */
public interface TempService {
    List<Temperature> selectTemp(int uid);
    List<Temperature> selectMaxTemp(int uid);
}
