<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<html>
<base href="<%=basePath%>">
	<head>
		<meta charset="utf-8">
		<title>喂养</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="j91008/css/style.css" />
	</head>
	<body>	
		<header class="mui-bar mui-bar-nav headernav-bg">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
			<h1 class="mui-title header-h1">联系我们</h1>
		</header>
		<div class="content-view content-nav">		
			<!--轮播图start-->
			<div id="slider" class="mui-slider slider-height1">
				<div class="mui-slider-group mui-slider-loop">
					<div class="mui-slider-item mui-slider-item-duplicate">
						<a href="#"><img src="j91008/images/index00.png"></a>
					</div>
					<div class="mui-slider-item">
						<a href="#"><img src="j91008/images/login_bg.png"></a>
					</div>
					<div class="mui-slider-item mui-slider-item-duplicate">
						<a href="#"><img src="j91008/images/sign.png"></a>
					</div>
				</div>
			</div>
			<!--轮播图end-->	 
			<div class="feeding-pb">
				<div class="feeding-view-flex">
					<div class="feeding-content">
						<div class="feeding-tab">
							<img src="j91008/images/feeding.png" />
						</div>
						<div class="feeding-view">
							<p>名称：鱼料</p>
							<p>价格：50</p>
							<button class="feeding-btn">喂养小鱼</button>
						</div>
					</div>
					<div class="feeding-content">
						<div class="feeding-tab">
							<img src="j91008/images/feeding.png" />
						</div>
						<div class="feeding-view">
							<p>名称：鱼料</p>
							<p>价格：50</p>
							<button class="feeding-btn">喂养小鱼</button>
						</div>
					</div>
				</div>
				<div class="feeding-view-flex">
					<div class="feeding-content">
						<div class="feeding-tab">
							<img src="j91008/images/feeding.png" />
						</div>
						<div class="feeding-view">
							<p>名称：鱼料</p>
							<p>价格：50</p>
							<button class="feeding-btn">喂养小鱼</button>
						</div>
					</div>
					<div class="feeding-content">
						<div class="feeding-tab">
							<img src="j91008/images/feeding.png" />
						</div>
						<div class="feeding-view">
							<p>名称：鱼料</p>
							<p>价格：50</p>
							<button class="feeding-btn">喂养小鱼</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
   
		<footer>
			<nav class="mui-bar mui-bar-tab nav-bg1">
				<a class="mui-tab-item nav-item" href="index.html">
					<span class="mui-icon iconfont icon-shouye8"></span>
					<span class="mui-tab-label">领养</span>
				</a>
				<a class="mui-tab-item nav-item mui-active" href="feeding.jsp">
					<span class="mui-icon iconfont icon-weiyang"></span>
					<span class="mui-tab-label">喂养</span>
				</a>
				<a class="mui-tab-item nav-item" href="platoon.html">
					<span class="mui-icon iconfont icon-dingdan7"></span>
					<span class="mui-tab-label">公排</span>
				</a>				
				<a class="mui-tab-item nav-item" href="center.html">
					<span class="mui-icon iconfont icon-huiyuan21"></span>
					<span class="mui-tab-label">我的</span>
				</a>
			</nav>
		</footer>
	</body>
	<script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<script>
		var slider = mui("#slider");			
			slider.slider({
				interval: 5000
			});
		
		mui('body').on('tap', 'a', function() {
                var id = this.getAttribute('href');
                var href = this.href;
                mui.openWindow({
                    id: id,
                    url: this.href,
                    show: {
                        autoShow: true
                    }
                });
           });
 	</script>
	
</html>