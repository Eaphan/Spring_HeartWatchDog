package com.xingou.dao.impl;

import com.xingou.dao.TempDao;
import com.xingou.entity.Temperature;
import org.hibernate.SessionFactory;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by viczyf on 2017/11/27.
 */
@Repository("tempDao")
public class TempDaoImpl extends BaseDaoImpl<Temperature>  implements TempDao{

}
