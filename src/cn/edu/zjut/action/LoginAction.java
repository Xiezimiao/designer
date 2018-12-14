package cn.edu.zjut.action;

import cn.edu.zjut.service.LoginService;

public class LoginAction {
	private String phone;
	private String password;
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	} 
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
	public String login() {
		LoginService ls = new LoginService();
		if(ls.login(phone,password))
			return "success";
		return "fail";
	} 	
}