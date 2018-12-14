package cn.edu.zjut.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import cn.edu.zjut.dao.ExampleDAO;

public class SearchExampleService {
	private List examples = new ArrayList();
	private Map<String,Object> request, session; //获取request,session

	public List findAllExamples(String condition) {
		ExampleDAO dao = new ExampleDAO();
		ActionContext ctx= ActionContext.getContext();
		session=(Map) ctx.getSession();
		request=(Map) ctx.get("request");
		String hql = "from Example as ex where ex.description like '%"+condition+"%'";
		examples = dao.findByHql(hql);
		

		
		request.put("examples", examples);

		return examples;
	}
	public List findAll() {
		ExampleDAO dao = new ExampleDAO();
		ActionContext ctx= ActionContext.getContext();
		session=(Map) ctx.getSession();
		request=(Map) ctx.get("request");
		String hql = "from Example";
		examples = dao.findByHql(hql);
		request.put("examples", examples);
		return examples;
	}
}


