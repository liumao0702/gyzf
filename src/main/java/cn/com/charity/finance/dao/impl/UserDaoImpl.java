package cn.com.charity.finance.dao.impl;

import java.util.List;
import cn.com.charity.finance.dao.UserDao;
import cn.com.charity.finance.entity.AcctUser;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public AcctUser load(String id) {
        return (AcctUser) this.getCurrentSession().load(AcctUser.class, id);
    }

    @Override
    public AcctUser get(String id) {
        return (AcctUser) this.getCurrentSession().get(AcctUser.class, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<AcctUser> findAll() {
        List<AcctUser> acctUsers = this.getCurrentSession().createQuery("from AcctUser").setCacheable(true).list();
        return acctUsers;
    }

    @Override
    public void persist(AcctUser entity) {
        this.getCurrentSession().persist(entity);
    }

    @Override
    public String save(AcctUser entity) {
        return (String) this.getCurrentSession().save(entity);
    }

    @Override
    public void saveOrUpdate(AcctUser entity) {
        this.getCurrentSession().saveOrUpdate(entity);
    }

    @Override
    public void delete(String id) {
        AcctUser entity = this.load(id);
        this.getCurrentSession().delete(entity);
    }

    @Override
    public void flush() {
        this.getCurrentSession().flush();
    }

    @Override
    public AcctUser findUserByNickname(String username) {
        AcctUser acctUser = null;
        //先用nickName去查询
        acctUser = (AcctUser) this.getCurrentSession()
                .createQuery(" from AcctUser where nickName = ?").setParameter(0, username).uniqueResult();
        if(acctUser == null){
            acctUser = (AcctUser) this.getCurrentSession()
                    .createQuery(" from AcctUser where email = ?").setParameter(0, username).uniqueResult();
        }
        if(acctUser == null){
            acctUser = (AcctUser) this.getCurrentSession()
                    .createQuery(" from AcctUser where telephone = ?").setParameter(0, username).uniqueResult();
        }
        return acctUser;
    }

}

