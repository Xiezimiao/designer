package cn.edu.zjut.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Transaction;
import com.opensymphony.xwork2.ActionContext;
import cn.edu.zjut.dao.DesignerDAO;
import cn.edu.zjut.dao.ExampleDAO;
import cn.edu.zjut.dao.ExamplePanoramaDAO;
import cn.edu.zjut.dao.ExamplePictureDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Example;
import cn.edu.zjut.po.ExamplePanorama;
import cn.edu.zjut.po.ExamplePicture;

public class DesignerService {

	private Map<String, Object> request, session;

	public boolean upload(Designer designer, Example example, File[] upload, File[] upload2) {
		// 1.拿到ServletContext
		ServletContext servletContext = ServletActionContext.getServletContext();
		// 获取request
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		session = (Map) ctx.get("session");
		// 获取设计师和案例的DAO
		DesignerDAO d_dao = new DesignerDAO();
		ExampleDAO e_dao = new ExampleDAO();
		// 创建一个事务对象
		Transaction tran = null;
		designer = (Designer) session.get("designer");
		// 2.调用realPath方法，获取根据一个虚拟目录得到的真实目录
		String pathOfPanoramas = servletContext
				.getRealPath("/file/" + designer.getDesignerId() + "/" + example.getName() + "/panoramas/");
		String pathOfPictures = servletContext
				.getRealPath("/file/" + designer.getDesignerId() + "/" + example.getName() + "/pictures/");
		// 3.如果这个真实的目录不存在，需要创建
		File fileOfPanoramas = new File(pathOfPanoramas);
		File fileOfPictures = new File(pathOfPictures);
		if (!fileOfPanoramas.exists()) {
			fileOfPanoramas.mkdirs();
		}
		if (!fileOfPictures.exists()) {
			fileOfPictures.mkdirs();
		}
		try {
			tran = d_dao.getSession().beginTransaction(); // 开始一个事务
			// 剪切：把临时文件剪切指定的位置，并且给他重命名。 注意：临时文件没有了
			for (int i = 0; i < upload.length; i++) {
				upload[i].renameTo(new File(fileOfPanoramas, Integer.toString(i) + ".jpg"));
				ExamplePanorama panorama = new ExamplePanorama("file/" + designer.getDesignerId() + "/"
						+ example.getName() + "/panoramas/" + Integer.toString(i) + ".jpg");
				example.getPanoramas().add(panorama);
			}
			for (int i = 0; i < upload2.length; i++) {
				upload2[i].renameTo(new File(fileOfPictures, Integer.toString(i) + ".jpg"));
				ExamplePicture picture = new ExamplePicture("file/" + designer.getDesignerId() + "/" + example.getName()
						+ "/pictures/" + Integer.toString(i) + ".jpg");
				example.getPictures().add(picture);
			}
			// designer = (Designer) d_dao.findById(designer.getDesignerId());//
			// 需要一个designerID，根据这个designerID获取designer对象

			//e_dao.save(example);
			designer.getExamples_own().add(example);
			d_dao.update(designer);

			tran.commit(); // 提交事务

			request.put("designer", designer);
			request.put("tip", "案例上传成功！");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			if (tran != null)
				tran.rollback();
			return false;
		} finally {
			d_dao.getSession().close();
		}
	}

	public boolean viewExampleDetails(Designer designer, Example example) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		DesignerDAO d_dao = new DesignerDAO();
		ExampleDAO e_dao = new ExampleDAO();

		example = e_dao.findById(example.getExampleId());
		designer = d_dao.findById(designer.getDesignerId());

		e_dao.getSession().close();
		d_dao.getSession().close();

		if (example == null || designer == null)
			return false;
		else {
			request.put("designer", designer);
			request.put("example", example);
			return true;
		}
	}

	public boolean putDesigner(Designer designer) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.get("session");
		if (session.get("designer") != null) {
			String id = ((Designer) session.get("designer")).getDesignerId();
			if (designer.getDesignerId().equals(id))
				return true;
			else {
				request = (Map) ctx.get("request");
				DesignerDAO d_dao = new DesignerDAO();
				designer = d_dao.findById(designer.getDesignerId());

				request.put("designer", designer);
				return false;
			}
		} else {
			request = (Map) ctx.get("request");
			DesignerDAO d_dao = new DesignerDAO();
			designer = d_dao.findById(designer.getDesignerId());
			request.put("designer", designer);
			return false;
		}
	}

	public boolean judgeIdentity() {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.get("session");
		// 判断是设计师还是用雇主
		if (session.get("designer") != null)// 如果是设计师
			return true;
		else// 如果是雇主
			return false;
	}

}
