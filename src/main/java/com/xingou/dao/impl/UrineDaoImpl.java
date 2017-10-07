package com.xingou.dao.impl;
/*
*类UserDaoImpl
*@DATE2017/9/5
*@author viczyf
*/

import com.xingou.dao.UrineDao;
import com.xingou.entity.Urine;
import org.springframework.stereotype.Repository;

@Repository("urineDao")
public class UrineDaoImpl extends BaseDaoImpl<Urine>  implements UrineDao{

}
