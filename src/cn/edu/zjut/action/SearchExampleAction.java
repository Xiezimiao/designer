package cn.edu.zjut.action;

import java.util.List;

import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePicture;
import cn.edu.zjut.service.SearchExampleService;

public class SearchExampleAction {
	private String condition;
	private List examples;
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	} 
	
	public String searchAllExample()
	{
		SearchExampleService ses = new SearchExampleService();
		examples = ses.findAllExamples(condition);
		
		
		
		
		System.out.println("size"+examples.size());
		Example e =(Example)examples.get(0);
		System.out.println(e.getName());
		
		
		return "success";
	}
	public String findall()
	{
		SearchExampleService ses = new SearchExampleService();
		examples = ses.findAll();
		return "success";
	}


}
