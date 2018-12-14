<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>案例详情</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/details_style.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">

<script>
	var cusid
	function praiseex() {
		//request中取得设计师id
		//案例id
		var desiger = "${requestScope.exampleId}";
		alert(desiger);
		//
	}
</script>
</head>
<body>
	<!-- banner -->
	<div class="banner jarallax">
		<div class="container">
			<nav class="navbar navbar-default">
			<div class="navbar-header navbar-left">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>
					<a class="navbar-brand" href="index.html">Upholstery</a>
				</h1>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right"
				id="bs-example-navbar-collapse-1">
				<nav class="link-effect-8" id="link-effect-8">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">主页</a></li>
					<li class="active"><a href="projects.jsp">找装修</a></li>
					<li><a href="#">论坛</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">装修攻略 <b class="caret"></b></a>
						<ul class="dropdown-menu agile_short_dropdown">
							<li><a href="icons.html">问答</a></li>
							<li><a href="typography.html">装修宝典</a></li>
						</ul></li>
					<li><s:if test="%{#session.id==null}">
							<li><a href="login.jsp">登陆</a></li>
							<li><a href="contact.html">注册</a></li>
						</s:if> <s:else>
							<li><a href="#">个人主页</a></li>
						</s:else></li>
				</ul>
				</nav>
			</div>
			</nav>
		</div>


		<div class="bigtitle">
			<s:property value="#request.example.name" />
		</div>
		<div class="contain">
			<div class="leftcontain">
				<div class="detail">
					<div class="surface">
						<img src="images/s1.jpg" alt="">
					</div>
					<div class="rightdetail">
						<div class="tags">
							<div class="tag">
								<p>设计风格</p>
								<p>
									<s:property value="#request.example.style" />
								</p>
							</div>
							<div class="tag">
								<p>面积</p>
								<p>
									<s:property value="#request.example.area" />
								</p>
							</div>
							<div class="tag">
								<p>上传时间</p>
								<p>
									<s:property value="#request.example.time" />
								</p>
							</div>
						</div>

						<p>
							<s:property value="#request.example.description" />
						</p>
						<div class="icons">
							<div class="praise" onclick="praiseex();">
								<div class="picon"></div>
								<p>
									<s:property value="#request.example.praise" />
								</p>
							</div>

							<div class="star" onclick="">
								<div class="sicon"></div>
							</div>
						</div>
						<s:iterator value="#request.example.panoramas" status="pa">
							<div class="panorama">
								<s:form action="showPanorama" method="post" theme="simple">
									<s:hidden name="path" value="%{panorama1}" />
									<s:submit value="全景图" />
								</s:form>
							</div>
						</s:iterator>
					</div>
				</div>

				<div class="pictures">
					<s:iterator value="#request.example.pictures">
						<div class="onepic" >
							<img src="<s:property value="picture1" />" style="width:720px" />
						</div>
					</s:iterator>
				</div>
			</div>
			<div class="rightcontain">
				<s:property value="#request.designer.account" />
				<s:property value="#request.example.designer.designerId" />
				<div class="designer">
					<div>头像</div>
					<div class="touxiang">昵称</div>
					<div class="touxiang">赞数</div>
					<div class="touxiang">评分</div>
					<div class="touxiang">
						<!-- 
					<a href="visitDesigner.action/designerID=<s:property value="#request.example.designer.designerID"/>"><input type="button" value="访问设计师主页"/></a>
					 -->
						<a href="putDesigner.action?designer.designerId=<s:property value="#request.example.designer.designerId" />"><input
							type="button" value="访问设计师主页" /></a>
					</div>
				</div>
				<div class="comments">
					<s:form action="Review" method="post">
						<div class="inputtext">
							<s:hidden name="example.exampleId"
								value="%{#request.example.exampleId}" />
							<s:textarea name="comments.content" cols="25" rows="5" />
							<s:submit value="评论" />
						</div>
					</s:form>
<s:iterator value="#request.displayComs">
					<div class="existcomment">
						<div class="giver">
							<img src="<s:property value="profilePhoto"/>"></img>
							<div>
								<p><s:property value="account"/></p>
								<p><s:property value="time"/></p>
							</div>
						</div>
						<div class="content"><s:property value="content"/></div>
					</div>
</s:iterator>
				</div>
			</div>
		</div>

	</div>
</body>
</html>