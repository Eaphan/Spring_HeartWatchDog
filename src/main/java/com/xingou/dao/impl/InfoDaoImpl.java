package com.xingou.dao.impl;
/*
*类UserDaoImpl
*@DATE2017/9/5
*@author viczyf
*/

import com.xingou.dao.InfoDao;
import com.xingou.dao.UserDao;
import com.xingou.entity.Info;
import com.xingou.entity.User;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository("infoDao")
public class InfoDaoImpl extends BaseDaoImpl<Info>  implements InfoDao{
}
