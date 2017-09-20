package com.xingou.dao.impl;
import com.xingou.dao.BaseDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

//@Repository("baseDao")
@SuppressWarnings("all")
//该批注的作用是给编译器一条指令，告诉它对被批注的代码元素内部的某些警告保持静默。
public class BaseDaoImpl<T> implements BaseDao<T> {

    private SessionFactory sessionFactory;
    private Class<T> clz;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    private Class<T> getClz() {
        if (clz == null) {
            //获取泛型的Class对象
            clz = ((Class<T>)
                    (((ParameterizedType) (this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
        }
        return clz;
    }

    public Serializable save(T o) {

        return this.getCurrentSession().save(o);
    }

    public void saveOrUpdate(T o) {
        this.getCurrentSession().saveOrUpdate(o);
    }

    public void update(T o) {
        this.getCurrentSession().update(o);
    }

    public void delete(T o) {
        this.getCurrentSession().delete(o);
    }

    public void delete(Serializable id) {
        T o = this.get(id);
        this.getCurrentSession().delete(o);
    }

    public T get(Serializable id) {
        return (T) this.getCurrentSession().get(getClz(), id);
    }

    public List<T> find(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        return q.list();
    }

    public List<T> find(String hql , Object... params)
    {
        // 创建查询
        Query query = getSessionFactory().getCurrentSession()
                .createQuery(hql);
        // 为包含占位符的HQL语句设置参数
        for(int i = 0 , len = params.length ; i < len ; i++)
        {
            query.setParameter(i + "" , params[i]);
        }
        return (List<T>)query.list();
    }
//    public List<T> find(String hql, Map<String, Object> params) {
//        Query q = this.getCurrentSession().createQuery(hql);
//        if (params != null && !params.isEmpty()) {
//            for (String key : params.keySet()) {
//                q.setParameter(key, params.get(key));
//            }
//        }
//        return q.list();
//    }

    //获得所查询到的记录总数
    public Integer count(String hql) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        List cc = q.list();
        Long a = (Long) cc.get(0);
        return a.intValue();
    }

    public Integer count(String hql, Integer id) {
        Query q = sessionFactory.getCurrentSession().createQuery(hql);
        q.setParameter(0, id);
        List cc = q.list();
        Long a = (Long) cc.get(0);
        return a.intValue();
    }

    public Integer count(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return (Integer) q.uniqueResult();
    }

    public int executeHql(String hql) {
        Query q = this.getCurrentSession().createQuery(hql);
        return q.executeUpdate();
    }

    public int executeHql(String hql, Map<String, Object> params) {
        Query q = this.getCurrentSession().createQuery(hql);
        if (params != null && !params.isEmpty()) {
            for (String key : params.keySet()) {
                q.setParameter(key, params.get(key));
            }
        }
        return q.executeUpdate();
    }

    public Integer findByUid(Integer uid) {
        // TODO Auto-generated method stub
        return null;
    }

    public Integer findTicketByCid(Integer cid) {
        // TODO Auto-generated method stub
        return null;
    }
}