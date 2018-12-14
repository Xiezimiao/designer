package cn.edu.zjut.dao;

import java.util.List;
import org.hibernate.Query;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class NeedDao extends BaseHibernateDAO{
	private static final Log log = LogFactory.getLog(NeedDao.class);
	public List findneeds(String hql) {      
		log.debug("finding all needs");
		try {
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all needs failed", re);
			throw re;
		}
	}
}
