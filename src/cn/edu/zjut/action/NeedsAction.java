package cn.edu.zjut.action;

import cn.edu.zjut.po.Needs;
import cn.edu.zjut.service.NeedService;

public class NeedsAction {
	private Needs need;

	public Needs getNeed() {
		return need;
	}

	public void setNeed(Needs need) {
		this.need = need;
	}
	public String order(){
		NeedService service=new NeedService();
		if(service.wanted(need)) {
			return "success";
		}
		return "fail";
	}

}
