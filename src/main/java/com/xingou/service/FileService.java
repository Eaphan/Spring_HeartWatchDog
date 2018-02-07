package com.xingou.service;

import com.xingou.entity.File;

import java.util.List;

/*
 * Created by viczyf on 2017/11/30.
 */
public interface FileService {
    List<File> selectFile(int uid);

    int queryMaxId();

    //    void addFile();
    void saveFile(File file);

    File querySingleFile(int uid, int id);

    void deleteFile(int uid, int id);

}
