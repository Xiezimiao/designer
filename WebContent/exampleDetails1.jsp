<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>案例详情</title>
</head>
<body>
	<table>
		<tr>
			<td>案例详情：
				<p>
			</td>
		</tr>
		<tr>
			<td>案例名称：</td>
			<td><s:property value="#request.example.name" /></td>
		</tr>
		<tr>
			<td>案例描述：</td>
			<td><s:property value="#request.example.description" /></td>
		</tr>
		<tr>
			<td>设计风格：</td>
			<td><s:property value="#request.example.style" /></td>
		</tr>
		<tr>
			<td>赞数：</td>
			<td><s:property value="#request.example.praise" /></td>
		</tr>
		<tr>
			<td>面积：</td>
			<td><s:property value="#request.example.area" /></td>
		</tr>
		<tr>
			<td>时间：</td>
			<td><s:property value="#request.example.time" /></td>
		</tr>
		<s:iterator value="#request.example.panoramas" status="pa">
			<tr>
				<td><s:form action="showPanorama" method="post">
						<s:hidden name="path" value="%{panorama1}" />
						<s:submit value="全景图" />
					</s:form></td>
			</tr>
		</s:iterator>
		<s:iterator value="#request.example.pictures">
			<div>
				<tr>
					<td>平面图路径：<s:property value="picture1" />
					</td>
				</tr>
				<img src="<s:property value="picture1" />" width="500" height="300" />
			</div>
		</s:iterator>
	</table>

	<s:form action="Review" method="post">
		<s:hidden name="example.exampleId" value="%{#request.example.exampleId}" />
		<s:textarea name="comments.content" cols="100" rows="10" />
		<s:submit value="评论" />
	</s:form>
</body>
</html>