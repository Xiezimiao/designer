package cn.edu.zjut.service;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.LoginDao;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;

public class LoginService {
	private Map<String,Object> request, session; //获取request,session
	public boolean login(String phone,String password)
	{
		ActionContext ctx= ActionContext.getContext();
		session=(Map)ctx.get("session");
		request=(Map)ctx.get("request");
		String hql = "from Designer where phone='" + phone+ "' and password='" + password + "'";
		String hql2 = "from Employer where phone='" + phone+ "' and password='" + password + "'";
		LoginDao dao = new LoginDao();
		List list = dao.findByHql(hql);  //查询设计师表
		List list2 = dao.findByHql(hql2); //查询普通用户表
		dao.getSession().close();
		if (!list.isEmpty())
		{
			Designer designer=(Designer)list.get(0);
			session.put("id", designer.getDesignerId());
			request.put("tip", "登录成功！ ");
			session.put("designer", designer);
			return true;
		}
		else if(!list2.isEmpty())
		{
			Employer employer=(Employer)list2.get(0);
			session.put("id", employer.getEmployerId());
			session.put("employer", employer);
			return true;
		}
		else{
			return false;
		}
	}
}
