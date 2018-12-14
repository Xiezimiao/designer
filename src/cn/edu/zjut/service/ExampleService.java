package cn.edu.zjut.service;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.CommentsDAO;
import cn.edu.zjut.dao.DesignerDAO;
import cn.edu.zjut.dao.EmployerDAO;
import cn.edu.zjut.dao.ExampleDAO;
import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.DisplayCom;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;

public class ExampleService {

	private Map<String, Object> request, session;

	public void putExample(Example example) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		ExampleDAO e_dao = new ExampleDAO();
		DesignerDAO d_dao = new DesignerDAO();
		EmployerDAO em_dao = new EmployerDAO();
		example = e_dao.findById(example.getExampleId());
		request.put("example", example);
		Set<Comments> commentss = new HashSet();
		Set<DisplayCom> displayComs = new HashSet(0);
		commentss = example.getComments();
		Iterator<Comments> it = commentss.iterator();
		Designer designer = new Designer();
		Employer employer = new Employer();
		while (it.hasNext()) {
			DisplayCom displayCom = new DisplayCom();
			Comments comment = it.next();
			String str = comment.getReviewer();
			if (str.charAt(0) == '0') {
				designer = d_dao.findById(str);
				displayCom.setProfilePhoto(designer.getProfilePhoto());
				displayCom.setAccount(designer.getAccount());
				displayCom.setContent(comment.getContent());
				displayCom.setTime(comment.getTime());
				displayComs.add(displayCom);
			} else {
				employer = em_dao.findById(str);
				displayCom.setProfilePhoto(employer.getProfilePhoto());
				displayCom.setAccount(employer.getAccount());
				displayCom.setContent(comment.getContent());
				displayCom.setTime(comment.getTime());
				displayComs.add(displayCom);
			}
		}
		request.put("displayComs", displayComs);
	}

	public boolean review(Example example, Comments comments) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		session = (Map) ctx.get("session");
		ExampleDAO e_dao = new ExampleDAO();
		CommentsDAO c_dao = new CommentsDAO();
		DesignerDAO d_dao = new DesignerDAO();
		EmployerDAO em_dao = new EmployerDAO();

		// 判断是设计师还是用雇主
		if (session.get("designer") != null)// 如果是设计师
		{
			Designer designer = (Designer) session.get("designer");
			comments.setReviewer(designer.getDesignerId()); // 把设计师编号赋值给评论者
		} else// 如果是雇主
		{
			Employer employer = (Employer) session.get("session");
			comments.setReviewer(employer.getEmployerId());// 把雇主编号赋值给评论者
		}
		Transaction tran = null;
		try {
			tran = c_dao.getSession().beginTransaction();
			example = e_dao.findById(example.getExampleId());
			c_dao.save(comments);
			example.getComments().add(comments);
			e_dao.update(example);
			tran.commit();

			request.put("example", example);
			Set<Comments> commentss = new HashSet();
			Set<DisplayCom> displayComs = new HashSet(0);
			commentss = example.getComments();
			Iterator<Comments> it = commentss.iterator();
			Designer designer = new Designer();
			Employer employer = new Employer();
			while (it.hasNext()) {
				DisplayCom displayCom = new DisplayCom();
				Comments comment = it.next();
				String str = comment.getReviewer();
				if (str.charAt(0) == '0') {
					designer = d_dao.findById(str);
					displayCom.setProfilePhoto(designer.getProfilePhoto());
					displayCom.setAccount(designer.getAccount());
					displayCom.setContent(comment.getContent());
					displayCom.setTime(comment.getTime());
					displayComs.add(displayCom);
				} else {
					employer = em_dao.findById(str);
					displayCom.setProfilePhoto(employer.getProfilePhoto());
					displayCom.setAccount(employer.getAccount());
					displayCom.setContent(comment.getContent());
					displayCom.setTime(comment.getTime());
					displayComs.add(displayCom);
				}
			}
			request.put("displayComs", displayComs);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			if (tran != null)
				tran.rollback();
			return false;
		} finally {
			c_dao.getSession().close();
		}

	}
}
