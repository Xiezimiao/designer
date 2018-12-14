<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传案例</title>
<link rel="stylesheet" href="css/main.css" />
<link href="css/upload_style.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<!--<s:form action="UploadCase" method="post" enctype="multipart/form-data">
		<s:textfield name="example.name" label="案例名称" />
		<s:textfield name="example.description" label="案例描述" />
		<s:textfield name="example.style" label="设计风格" />
		<s:textfield name="example.area" label="房屋面积" />
		<s:file name="upload" label="上传全景图" />
		<s:file name="upload" label="上传全景图" />
		<s:file name="upload2" label="上传平面图" />
		<s:file name="upload2" label="上传平面图" />
		<s:submit value="立即上传" />
	</s:form>-->

	<br />
	<br />
	<s:form action="UploadCase" method="post" enctype="multipart/form-data">
		<div class="content">
			<div class="register-box">
				<div class="wrap">
					<div class="register-box-con2">
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian">*</em>案例名称</label>
							<div class="register-box-con2-box-right">
								<input type="text" class="login-box-cen-form-input w358"
									placeholder="不超过20个字" id="reg_info_company" name="example.name" />
							</div>
						</div>
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian"></em>设计风格</label>
							<div class="register-box-con2-box-right">
								<input type="text" class="login-box-cen-form-input w358"
									placeholder="不超过20个字。如：简约、轻奢" id="reg_info_www"
									name="example.style" />
							</div>
						</div>
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian"></em>房屋面积</label>
							<div class="register-box-con2-box-right">
								<input type="text" class="login-box-cen-form-input w358"
									placeholder="填写总面积，如：50m²" id="reg_info_address"
									name="example.area" />
							</div>
						</div>
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian"></em>案例描述</label>
							<div class="register-box-con2-box-right">
								<textarea class="login-box-cen-form-textarea w358 h88"
									id="reg_info_textarea" placeholder="对该案例的详细描述或补充，不超过100个字"
									name="example.description"></textarea>
							</div>
						</div>
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian">*</em>图片</label>
							<div class="register-box-con2-box-right">
								<label class="register-box-con2-box-upload"> <input
									type="file" name="upload" id="reg_info_file" />
									<div class="register-box-con2-box-upload-ti">
										<em id="reg_info_file_w">全景图</em><img
											id="reg_info_file_base64" style="display: none;" />
									</div>
								</label> <label class="register-box-con2-box-upload"> <input
									type="file" name="upload2" id="reg_info_file" />
									<div class="register-box-con2-box-upload-ti">
										<em id="reg_info_file_w">平面图</em><img
											id="reg_info_file_base64" style="display: none;" />
									</div>
								</label>
								<p class="register-box-con2-box-pw">1.支持图片格式JPG/PNG，图片大小不超过200M</p>
								<p class="register-box-con2-box-pw">2.同时支持平面图和全景图的展示</p>
								<label class="err err-top160" id="reg_info_file_text">支持图片格式JPG/PNG，图片大小不超过200M</label>
							</div>
						</div>

						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian"></em>全景图</label>
							<div class="register-box-con2-box-right">
								<div class="line">
									<div id="mybutton2">
										<a href="javascript:;" class="file">上传全景图 <s:file
												name="upload" onchange="getPhoto2()" />
										</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="register-box-con2-box clearfix mar-bottom20">
							<label class="register-box-con2-box-left"><em
								class="bitian"></em>平面图</label>
							<div class="register-box-con2-box-right">
								<div class="line">
									<div id="mybutton">
										<a href="javascript:;" class="file">上传平面图 <s:file
												name="upload2" onchange="getPhoto()" />
										</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="register-box-con2-box clearfix mar-bottom20 mar-top50">
							<label class="register-box-con2-box-left"></label>
							<div class="register-box-con2-box-right">
								<input type="submit" value="确认上传"
									class="login-box-cen-form-button w380" id="reg_info_submit" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</s:form>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/tbdValidate.js"></script>
	<script type="text/javascript" src="js/upload.js"></script>
	<script type="text/javascript" src="js/uploadcase.js"></script>
	<script type="text/javascript" src="js/uploadcase2.js"></script>
</body>
</html>