package cn.edu.zjut.action;

import java.util.List;

import cn.edu.zjut.po.Needs;
import cn.edu.zjut.service.NeedService;

public class NeedAction {
	private String city;
	private int area0;
	private int area1;
	private int money0;
	private int money1;
	private int order;
	private List needs1;
	public String findneeds() {
		NeedService needserv=new NeedService();
		needs1=needserv.findneeds(city, area0, area1, money0, money1,order);
		return "findneedssuccess";
	}
	
	private Needs needs;
	private int needsId;
	public int getNeedsId() {
		return needsId;
	}
	public void setNeedsId(int needsId) {
		this.needsId = needsId;
	} 
	public Needs getNeeds() {
		return needs;
	}
	public void setNeeds(Needs needs) {
		this.needs = needs;
	} 
	public String getNeedsByID() {
		NeedService ns = new NeedService();
		needs=ns.getNeedsByID(needsId);
		return "success";
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getArea0() {
		return area0;
	}
	public void setArea0(int area0) {
		this.area0 = area0;
	}
	public int getArea1() {
		return area1;
	}
	public void setArea1(int area1) {
		this.area1 = area1;
	}
	public int getMoney0() {
		return money0;
	}
	public void setMoney0(int money0) {
		this.money0 = money0;
	}
	public int getMoney1() {
		return money1;
	}
	public void setMoney1(int money1) {
		this.money1 = money1;
	}
	public List getNeeds1() {
		return needs1;
	}
	public void setNeeds1(List needs1) {
		this.needs1 = needs1;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
}
