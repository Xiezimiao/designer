package cn.edu.zjut.po;

import java.sql.Timestamp;

public class Orderr {
	private String orderrId;
	private String title;
	private Timestamp beginTime;
	private Timestamp finishTime;
	private Float money;
	private String state;
	
	public Orderr() {}
	public Orderr(String orderrId) 
	{
		this.setOrderrId(orderrId);
	}
	public Orderr(String orderrId,String title,Timestamp beginTime,Timestamp finishTime,
			Float money,String state)
	{
		this.setOrderrId(orderrId);
		this.setTitle(title);
		this.setBeginTime(beginTime);
		this.setFinishTime(finishTime);
		this.setMoney(money);
		this.setState(state);
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getOrderrId() {
		return orderrId;
	}
	public void setOrderrId(String orderrId) {
		this.orderrId = orderrId;
	}
}
