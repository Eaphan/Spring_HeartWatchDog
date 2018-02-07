package com.xingou.dao.impl;


import com.xingou.dao.FileDao;
import com.xingou.entity.File;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;


/*
 * Created by viczyf on 2017/11/29.
 */
@Repository("fileDao")
public class FileDapImpl extends BaseDaoImpl<File> implements FileDao{
    public int queryMaxId() {
        String hql = "select max(f.id) from File f";
        Integer maxId = (Integer) this.getCurrentSession().createQuery(hql).uniqueResult();
        if (maxId == null) {
            maxId = 0;
        }
        return maxId;
    }
}
