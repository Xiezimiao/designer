package cn.edu.zjut.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

import cn.edu.zjut.po.Needs;

public class NeedsDAO extends BaseHibernateDAO{
	private Log log=LogFactory.getLog(NeedsDAO.class);
	  public void save(Needs need) {
		   log.debug("saving need instance");
		   try {
			   getSession().save(need);
			 //  session.flush();
			   log.debug("save successfully!");
			   
		   }catch(RuntimeException re) {
			   log.error("save fail",re);
			   throw re;
		   }
	   }
	  public int find() {
		   log.debug("finding maxId instance");
		   Configuration conf=new Configuration().configure();
		   StandardServiceRegistry standardServiceRegistry = new StandardServiceRegistryBuilder() 
				   .applySettings(conf.getProperties()).build();
		   SessionFactory sf = conf.buildSessionFactory(standardServiceRegistry);
		   Session session=sf.openSession();
		   try {
			   Integer maxValue=(Integer)session.createQuery("select max(needsID) from Needs ").uniqueResult();
			   if(maxValue==null) {
				   return 0;
			   }
			   return maxValue;
			  
		   }catch(RuntimeException re) {
			   log.error("find failed", re);
			   System.out.println("err");
			   throw re;
		   }finally {
			   session.close();
		   }
	  }
}
