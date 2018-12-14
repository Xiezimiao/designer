package cn.edu.zjut.action;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.ExampleService;

public class ExampleAction {
	private Example example;
	private Comments comments;
	
	public Example getExample() {
		return example;
	}
	public void setExample(Example example) {
		this.example = example;
	}
	public Comments getComments() {
		return comments;
	}
	public void setComments(Comments comments) {
		this.comments = comments;
	}
	
	public String execute()
	{
		ExampleService exampleServ=new ExampleService();
		exampleServ.putExample(example);
		return"success";
	}
	public String review()
	{
		ExampleService exampleServ=new ExampleService();
		if(exampleServ.review(example, comments))
			return "viewSuccess";
		else
			return "viewFail";
	}
}
