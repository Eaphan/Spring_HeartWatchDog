package com.xingou.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Statement;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * DAO基类，其它DAO可以直接继承这个DAO，不但可以复用共用的方法，还可以获得泛型的好处。
 */


public class AnotherBaseDao<T>{
    private Class<T> entityClass;

    private HibernateTemplate hibernateTemplate;
    /**
     * 通过反射获取子类确定的泛型类
     */
    public AnotherBaseDao() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }

    /**
     * 根据ID加载PO实例
     */
    public T load(Serializable id) {
        return (T) getHibernateTemplate().load(entityClass, id);
    }

    /*** 根据ID获取PO实例*/
    public T get(Serializable id) {
        return (T) getHibernateTemplate().get(entityClass, id);
    }

    /**获取PO的所有对象*/
    public List<T> loadAll() {
        return getHibernateTemplate().loadAll(entityClass);
    }

    /**保存PO*/
    public void save(T entity) {
        getHibernateTemplate().save(entity);
    }

    /*** 删除PO*/
    public void remove(T entity) {
        getHibernateTemplate().delete(entity);
    }

    /**
     * 删除tableNames数据
     */
    public void removeAll(String tableName) {
        getSession().createSQLQuery("truncate TABLE " + tableName +"").executeUpdate();
    }

    /**
     * @param entity
     */
    public void update(T entity) {
        getHibernateTemplate().update(entity);
    }

    /**
     * 执行HQL查询
     *
     * @param sql
     * @return 查询结果
     */
    public List find(String hql) {
        return this.getHibernateTemplate().find(hql);
    }

    /**
     * 执行带参的HQL查询
     *
     * @param sql
     * @param params
     * @return 查询结果
     */
    public List find(String hql, Object... params) {
        return this.getHibernateTemplate().find(hql,params);
    }

    /**
     * 对延迟加载的实体PO执行初始化
     * @param entity
     */
    public void initialize(Object entity) {
        this.getHibernateTemplate().initialize(entity);
    }



    /**
     * 创建Query对象. 对于需要first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设置.
     * 留意可以连续设置,如下：
     * <pre>
     * dao.getQuery(hql).setMaxResult(100).setCacheable(true).list();
     * </pre>
     * 调用方式如下：
     * <pre>
     *        dao.createQuery(hql)
     *        dao.createQuery(hql,arg0);
     *        dao.createQuery(hql,arg0,arg1);
     *        dao.createQuery(hql,new Object[arg0,arg1,arg2])
     * </pre>
     *
     * @param values 可变参数.
     */
    public Query createQuery(String hql, Object... values) {
        Assert.hasText(hql);
        Query query = getSession().createQuery(hql);
        for (int i = 0; i < values.length; i++) {
            query.setParameter(i, values[i]);
        }
        return query;
    }

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    @Autowired
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }
    public Session getSession() {
        return hibernateTemplate.getSessionFactory().getCurrentSession();
    }

}
