package com.xingou.dao;

import com.xingou.entity.File;

/*
 * Created by viczyf on 2017/11/29.
 */
public interface FileDao extends BaseDao<File> {
    int queryMaxId();
}
