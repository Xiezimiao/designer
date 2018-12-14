 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%> 
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sx:head parseContent="true" extraLocales="UTF-8"/> 
<link type="text/css" rel="stylesheet" href="css/common.css" />
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
 <script type="text/javascript">  
 function signup(Needs,Designer)
 {
	 if(Designer==""){
			alert("请先登录！");
	 } 
	 else{
	 if(confirm("确认报名？")){
			$.post(
				"SignUp.action",
				{needs:Needs,designer:Designer},
				function(result){
					var ret = $.parseJSON(result);
					if(ret.success){
						alert("报名成功");
						location.reload();
					}
					else{
						alert("报名失败");
					}
				}
			);
		}
	 }
 }
    </script>
</head> 
<body>
<div class="project_msg">
		<div class="_msg_info">
			<div style="margin: 25px 30px 0px 30px;overflow: hidden;border-bottom: 1px dotted #EDECED;">
				<div class="proj_name">
					<h2 style="color: #333;font-family: 'Microsoft YaHei' ! important;font-size: 24px;font-weight: normal;"><s:property value="needs.title"/></h2>
					<div style="color: #666;margin-top: 5px;margin-bottom: 5px;">
                        <span><s:date name="needs.time1" format="yyyy-MM-dd HH:mm:ss"/>发布</span>
                        <span style="border-left:1px solid #ddd;padding-left:10px;padding-right:10px;margin-left:10px;margin-right:10px;">发布者：<s:property value="needs.employerID"/></span>
                    </div>
				</div>
				<div class="btne apply_for">
				<div><button id="signup"  class="detail"  onclick="signup('${needs}','${designer}')">报名</button></div>
		        <div style="float:right;padding:20px 40px;color: #666;">已有<span style="color:red;"><s:property value="needs.enrollment"/></span>位设计师报名</div>
				</div>
			</div>
			<div class="proj_massages" style="margin-top:15px;padding-bottom: 20px;">
				<div class="_massa">
					<div><label>项目地点：</label><s:property value="needs.city"/></div>
					<div><label>项目风格：</label><s:property value="needs.style"/></div>
					<div><label>项目规模：</label><em><s:property value="needs.area"/></em>m<sup>2<sup></div>
					<div><label>设计预算：</label><em><s:property value="needs.money"/></em></div>
					<div><label>设计截止时间：</label><s:date name="needs.time3" format="yyyy-MM-dd HH:mm:ss"/></div>
					<div><label>报名截止时间：</label><s:date name="needs.time2" format="yyyy-MM-dd HH:mm:ss"/></div>
				</div>
				<div class="btn apply_end">
					
				</div>
			</div>
			<div class="proj_devise">
				<div style="margin-bottom: 20px;color: #333;">设计要求</div>
				<div style="line-height: 24px;color: #666;"><s:property value="needs.description"/></div>
			</div>
		</div>
	</div>
</body>
</html>