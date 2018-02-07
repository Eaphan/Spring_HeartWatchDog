package com.xingou.service.impl;

import com.xingou.dao.FileDao;
import com.xingou.entity.File;
import com.xingou.service.FileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/*
 * Created by viczyf on 2017/11/30.
 */
@Service("fileService")
public class FileServiceImpl implements FileService {
    @Resource
    private FileDao fileDao;
    public List<File> selectFile(int uid) {
        String hql = "from File f where f.user.uid="+uid+" order by f.id desc";
        return fileDao.find(hql);
    }


    public int queryMaxId(){
        return fileDao.queryMaxId();
    }

    public void saveFile(File file) {
        fileDao.saveOrUpdate(file);
    }
    public File querySingleFile(int uid, int id){
        File file= fileDao.get(id);
        if (uid == file.getUser().getUid()) {
            return file;
        } else {
            return null;
        }
    }

    public void deleteFile(int uid, int id) {
        fileDao.delete(id);
    }
}
