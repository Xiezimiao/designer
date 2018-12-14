package cn.edu.zjut.dao; 

import java.util.List; 
import org.hibernate.Query;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import cn.edu.zjut.po.Designer;

public class DesignerDAO extends BaseHibernateDAO{
	private Log log = LogFactory.getLog(DesignerDAO.class);
	
	public List findByHql(String hql) { 
		log.debug("finding Designer instance by hql"); 
		try {
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString); 
			return queryObject.list();
		} 
		catch (RuntimeException re) { 
			log.error("find by hql failed", re); 
			throw re;
		}
	}
	public Designer findById(String id){
		log.debug("finding Designer instance by exampleId");
		Designer e;
		try {
			e=(Designer)getSession().get(Designer.class,id);
			log.debug("find successful");
			return e;
		}
		catch (RuntimeException re) { 
			log.error("find failed", re); 
			throw re;
		}
	}
	public void save(Designer instance) { 
		log.debug("saving Designer instance"); 
		try {
			getSession().save(instance); 
			log.debug("save successful");
		}
		catch (RuntimeException re) { 
			log.error("save failed", re); 
			throw re;
		}
	}
	public void update(Designer instance) {
		log.debug("updating Designer instance"); 
		try {
			getSession().update(instance); 
			log.debug("update successful");
		}
		catch (RuntimeException re) { 
			log.error("update failed", re); 
			throw re;
		}
	} 
	public void delete(Designer instance) {
		log.debug("deleting Designer instance"); 
		try {
			getSession().delete(instance); 
			log.debug("delete successful");
		} 
		catch (RuntimeException re) { 
			log.error("delete failed", re); 
			throw re;
		}
	}
}



