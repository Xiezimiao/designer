package cn.edu.zjut.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;
import cn.edu.zjut.dao.NeedDao;
import cn.edu.zjut.dao.NeedsDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Needs;

public class NeedService {
	private List needs1 = new ArrayList();
	private Map<String, Object> request, session;

	public List findneeds(String city, int area0, int area1, int money0, int money1, int order) {
		NeedDao dao = new NeedDao();
		String hql = "from Needs as needs";
		if (city != null) {
			hql = hql + " where city like '%" + city + "%'";
			if (!(area0 == 0 && area1 == 0)) {
				if (area1 != 0)
					hql = hql + " and area between " + area0 + " and " + area1;
				else
					hql = hql + " and area>" + area0;
			}
			if (!(money0 == 0 && money1 == 0)) {
				if (money1 != 0)
					hql = hql + " and money between " + money0 + " and " + money1;
				else
					hql = hql + " and money>" + money0;
			}
		} else {
			if (!(area0 == 0 && area1 == 0)) {
				if (area1 != 0)
					hql = hql + " where area between " + area0 + " and " + area1;
				else
					hql = hql + " where area>" + area0;
				if (!(money0 == 0 && money1 == 0)) {
					if (money1 != 0)
						hql = hql + " and money between " + money0 + " and " + money1;
					else
						hql = hql + " and money>" + money0;
				}
			} else {
				if (!(money0 == 0 && money1 == 0)) {
					if (money1 != 0)
						hql = hql + " where money between " + money0 + " and " + money1;
					else
						hql = hql + " where money>" + money0;
				}
			}
		}
		if (order == 1) {
			hql = hql + " order by time1 DESC";
		} else if (order == 2) {
			hql = hql + " order by area DESC";
		}
		System.out.println(hql);
		System.out.println(area0 + " " + area1 + " " + money0 + " " + money1);
		List list = dao.findneeds(hql);
		dao.getSession().close();
		return list;
	}

	public Needs getNeedsByID(int needsID) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		String hql = "from Needs where needsID=" + needsID + "";
		System.out.print(hql);
		NeedDao dao = new NeedDao();
		List list = dao.findneeds(hql);
		Needs needs = null;
		int enrollment = 0;
		if (!list.isEmpty()) {
			needs = (Needs) list.get(0);
			for (Object s : needs.getDesigners()) {
				Designer designer = (Designer) s;
				System.out.print(designer.getDesignerId());
				enrollment++;
			}
			needs.setEnrollment(enrollment);
			request.put("needs", needs);
		}
		dao.getSession().close();
		return needs;
	}

	public boolean wanted(Needs need) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		NeedsDAO dao = new NeedsDAO();
		int id = dao.find();
		need.setNeedsId(id + 1);
		// Employer user=session.get("user");
		// need.setEmployer(user);
		Employer user = new Employer();
		user.setEmployerId("001");
		need.setEmployer(user);
		need.setEnrollment(0);
		Timestamp d = new Timestamp(System.currentTimeMillis());
		need.setTime1(d);
		Transaction tran = null;
		try {
			tran = dao.getSession().beginTransaction();
			dao.save(need);
			tran.commit();
			request.put("tip", "�����ɹ�");
			return true;
		} catch (Exception e) {
			if (tran != null) {
				tran.rollback();
				request.put("tip", "����ʧ��");
			}
			return false;
		} finally {
			dao.getSession().close();
		}
	}
}
