package com.xingou.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {

    public Serializable save(T o);

    public void delete(Serializable id);

    public void delete(T o);

    public void update(T o);

    public void merge(T o);

    public void saveOrUpdate(T o);

    public T get(Serializable id);

    public List<T> find(String hql);

    public List<T> find(String hql , Object... params);
//没搞懂map的使用方法
//    public List<T> find(String hql, Map<String, Object> params);

//    public List<T> find(String hql, int page, int rows);

//    public List<T> find(String hql, Map<String, Object> params, int page, int rows);

    public Integer count(String hql);

    public Integer count(String hql, Integer id);

    public Integer count(String hql, Map<String, Object> params);

    public int executeHql(String hql);

    public int executeHql(String hql, Map<String, Object> params);


}
//    Exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.BeanCreationException:
//        Error creating bean with name 'baseDao': Injection of autowired dependencies failed; nested exception is org.springframework.beans.factory.BeanCreationException:
//
//        Could not autowire method: public void com.xingou.dao.impl.BaseDaoImpl.setSessionFactory(org.hibernate.SessionFactory);
//nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'sessionFactory' defined in class path resource [xingou-dao.xml]
//        : Invocation of init method failed; nested exception is org.hibernate.MappingException: Repeated column in mapping for entity:
//        com.xingou.entity.Doctor column: usertype (should be mapped with insert="false" update="false")
