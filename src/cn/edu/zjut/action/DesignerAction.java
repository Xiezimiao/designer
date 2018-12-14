package cn.edu.zjut.action;

import java.io.File;
import com.opensymphony.xwork2.ActionSupport;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.service.DesignerService;
import cn.edu.zjut.service.ExampleService;

public class DesignerAction extends ActionSupport {
	private Example example;
	private Designer designer;

	// 封装上传文件属性
	private File[] upload;
	private File[] upload2;
	
	public File[] getUpload() {return upload;}
	public void setUpload(File[] upload) {this.upload = upload;}
	public File[] getUpload2() {return upload2;}
	public void setUpload2(File[] upload2) {this.upload2 = upload2;}
	public Example getExample() {return example;}
	public void setExample(Example example) {this.example = example;}
	public Designer getDesigner() {return designer;}
	public void setDesigner(Designer designer) {this.designer = designer;}
	public String upload() throws Exception {
		DesignerService designerServ = new DesignerService();
		if (designerServ.upload(designer,example,upload,upload2))
			return "uploadSucccess";
		else
			return "uploadFail";
	}
	public String viewExampleDetails()
	{
		DesignerService designerServ = new DesignerService();
		if(designerServ.viewExampleDetails(designer, example))
			return "viewSuccess";
		else
			return "viewFail";
	}
	public String execute()
	{
		DesignerService designerServ=new DesignerService();
		if(designerServ.putDesigner(designer))
			return "myself";
		else
			return"others";
	}
	public String judgeIdentity()
	{
		DesignerService designerServ=new DesignerService();
		if(designerServ.judgeIdentity())
			return "designer";
		else
			return "employer";
	}
	

}
