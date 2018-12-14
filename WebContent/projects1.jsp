<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" extraLocales="UTF-8" />
<title>装修案例</title>
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
<link rel="stylesheet" href="css/lsb.css">
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>


<link rel="stylesheet" type="text/css" href="style/list.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var tab = new $.fn.tab({
			tabList : "#demo1 .ui-tab-container .ui-tab-list li",
			contentList : "#demo1 .ui-tab-container .ui-tab-content"
		});
		var tab = new $.fn.tab({
			tabList : "#demo1 .ui-tab-container .ui-tab-list2 li",
			contentList : "#demo1 .ui-tab-container .ui-tab-content2"
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$("#selectList").find(".more").toggle(function() {
			$(this).addClass("more_bg");
			$(".more-none").show()
		}, function() {
			$(this).removeClass("more_bg");
			$(".more-none").hide()
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var taboy_box = $(".lefttable-list");
		taboy_box.children("tbody").find("tr:gt(2)").hide();
		$(".leftbox-morea").toggle(function() {
			$(this).parent().prev().find("tr").show();
			$(this).addClass("more-i")
		}, function() {
			$(this).removeClass("more-i");
			$(this).parent().prev().children("tbody").find("tr:gt(2)").hide();
		});
	});
</script>
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
</head>

<body>
	<!-- banner -->
	<div class="banner1 jarallax">
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
							<li class="active"><a href="index.html">主页</a></li>
							<li><a href="projects.jsp">找装修</a></li>
							<li><a href="services.html">论坛</a></li>
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

		<div class="searchframe">
			<form action="searchAllExample" method="post">
				<input class="searchtext" type="text" name="condition"
					placeholder="输入搜索条件" required=""> <input
					class="searchbutton" type="submit" value="搜索">
			</form>
		</div>

		<div class="subnav">
			<div id="selectList" class="screenBox screenBackground">
				<div class="oneline">
					<dl attr="terminal_os_s">
						<dt class="lefttitle">
							<p>风格</p>
						</dt>
						<dd>
							<div class="righttitle">

								<label><input name="radio2" type="radio" value=""
									autocomplete="off" /> <a href="javascript:;" value="">简约</a></label> <label><input
									name="radio2" type="radio" value="" autocomplete="off" /> <a
									href="javascript:;" value="">地中海</a></label>
							</div>
						</dd>
					</dl>
				</div>
				<div class="oneline">
					<dl attr="terminal_os_s">
						<dt class="lefttitle">
							<p>户型</p>
						</dt>
						<dd>
							<div class="righttitle">

								<label><input name="radio1" type="radio" value=""
									autocomplete="off" /> <a href="javascript:;" value="">小户型</a></label> <label><input
									name="radio1" type="radio" value="" autocomplete="off" /> <a
									href="javascript:;" value="">一居室</a></label>
							</div>
						</dd>
					</dl>
				</div>
				<div class="oneline">
					<dl attr="terminal_os_s">
						<dt class="lefttitle">
							<p>面积</p>
						</dt>
						<dd>
							<div class="righttitle">

								<label><input name="radio3" type="radio" value=""
									autocomplete="off" /> <a href="javascript:;" value="">100m2</a></label>
								<label><input name="radio3" type="radio" value=""
									autocomplete="off" /> <a href="javascript:;" value="">120m2</a></label>
							</div>
						</dd>
					</dl>
				</div>
			</div>
			<div class="resultList">
				<div class="oneline" style="border-bottom: 0px;">
					<div>
						<dl class="selected clearfix">
							<dt class="lefttitle">
								<p>已选条件</p>
							</dt>
							<!--  clearDd    显示位置 -->
							<dd style="DISPLAY: none" class=clearDd>

								<div class="clearList  righttitle"></div>
							</dd>
						</dl>

					</div>
					<div style="float: right;" class="eliminateCriteria">【清空全部】</div>
				</div>
			</div>


			<script type="text/javascript" src="js/shaixuan.js"></script>
		</div>


		<!-- projects -->

		<div class="results">
			<s:iterator value="#request.examples">
				<div class="resultitem">
					<a
						href="putExample.action?example.exampleId=<s:property value='exampleId'/>">

						<s:iterator value="pictures" begin="0" end="1" status="st">
							<s:if test="%{#st.first==true}">
								<img src="<s:property value="picture1"/>" />
							</s:if>
							<s:else>
								<img style="display: none; border: 0px;"
									src="<s:property value="picture1"/>" />
							</s:else>
						</s:iterator>
						<div class="description">

							<h4>
								<s:property value="name" />
							</h4>
							<p>
								<s:property value="description" />
							</p>
						</div>
					</a>
				</div>
			</s:iterator>
		</div>
		<!-- //projects -->

		<!-- footer -->
		<div class="footer">
			<div class="container">
				<div class="w3_agile_footer_grids">
					<div class="col-md-4 w3_agile_footer_grid">
						<h3>Latest Tweets</h3>
						<ul class="agile_footer_grid_list">
							<li><i class="fa fa-twitter" aria-hidden="true"></i>Nam
								libero tempore, cum soluta nobis est eligendi optio cumque nihil
								impedit. <span>1 day ago</span></li>
							<li><i class="fa fa-twitter" aria-hidden="true"></i>Itaque
								earum rerum hic tenetur a sapiente delectus <a
								href="mailto:info@mail.com">info@mail.com</a> cumque nihil
								impedit. <span>2 days ago</span></li>
						</ul>
					</div>
					<div class="col-md-4 w3_agile_footer_grid">
						<h3>Navigation</h3>
						<ul class="agileits_w3layouts_footer_grid_list">
							<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
								href="index.html">Home</a></li>
							<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
								href="services.html">Services</a></li>
							<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
								href="projects.html">Projects</a></li>
							<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
								href="contact.html">Contact</a></li>
						</ul>
					</div>
					<div class="col-md-4 w3_agile_footer_grid">
						<h3>Latest Works</h3>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s6.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s2.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s1.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s3.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s4.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="w3_agileits_footer_grid_left">
							<a href="#"><img src="images/s5.jpg" alt=" "
								class="img-responsive" /></a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>


				<div class="agileinfo_copyright">
					<p>
						© 2018 Upholstery. All Rights Reserved | Design by <a
							href="https://w3layouts.com/">W3layouts</a>
					</p>
				</div>
			</div>
		</div>
		<!-- //footer -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<!-- here stars scrolling icon -->
		<script type="text/javascript">
			$(document).ready(function() {
				/*
					var defaults = {
					containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
					};
				 */

				$().UItoTop({
					easingType : 'easeOutQuart'
				});

			});
		</script>
		<!-- //here ends scrolling icon -->
		<!-- for bootstrap working -->
		<script src="js/bootstrap.js"></script>
		<!-- //for bootstrap working -->
		<script src="js/jarallax.js"></script>
		<script src="js/SmoothScroll.min.js"></script>
		<script type="text/javascript">
			/* init Jarallax */
			$('.jarallax').jarallax({
				speed : 0.5,
				imgWidth : 1366,
				imgHeight : 768
			})
		</script>
		<!-- lightspeedBox -->
		<script src="js/lsb.js"></script>
		<!-- //lightspeedBox -->
</body>
</html>