package cn.edu.zjut.dao;

import java.util.List;

import org.hibernate.Query;

public class LoginDao extends BaseHibernateDAO {
	public List findByHql(String hql) {
		try {
			String queryString = hql;
			System.out.println("3");
			Query queryObject = getSession().createQuery(queryString);
			System.out.println("4");
			
			return queryObject.list();
		}
	   catch (RuntimeException re) {
		   throw re;
	   	}
	}
}
