package cn.edu.zjut.action;

import cn.edu.zjut.service.PanoramaService;

public class PanoramaAction {
	private String path;

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String show()
	{
		PanoramaService panoramaServ=new PanoramaService();
		panoramaServ.show(path);
		return "showSuccess";
	}
	
	
}
