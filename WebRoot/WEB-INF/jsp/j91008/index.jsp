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
		<title>首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="j91008/css/style.css" />
	</head>
	<body>
		<div class="indexbg"></div>
		<div class="index-content">
			<!--header -->
			<div class="index_header mui-row">
				<div class="index_header_tab1 mui-col-xs-3">				
					<a href="j91008/charge.jsp"><div class="index_header_charge_cash">充值</div></a>			
					<a href="j91008/cash.jsp"><div class="index_header_charge_cash index_header_cash_mt">提现</div></a>
				</div>
				<div class="index_header_tab2 mui-col-xs-5">				
					<div class="index_header_feed">
						<img src="j91008/images/add.png"  class="index_header_feed_add"/>
						<b>0</b>
						<img src="j91008/images/feed.png" class="index_header_feed_img"/>
					</div>
				</div>
				<div class="index_header_tab3 mui-col-xs-4">
					<div class="index_header_number_today">
						<b class="number">0</b>
						<img src="j91008/images/today.png" class="index_header_number_img"/>					
					</div>
					<div class="index_header_number_today index-mt">
						<b class="number">0</b>
						<img src="j91008/images/number.png" class="index_header_number_img"/>					
					</div>
				</div>
			</div>
			<div class="fish">
				<img src="j91008/images/fish.gif" />
			</div>
			<div class="index_adoption">
				<button>领养</button>
			</div>	
		</div>	
	
   
    <footer>
		<nav class="mui-bar mui-bar-tab nav-bg">
			<a class="mui-tab-item nav-item mui-active" href="j91008/index.jsp">
				<span class="mui-icon iconfont icon-shouye8"></span>
				<span class="mui-tab-label">领养</span>
			</a>
			<a class="mui-tab-item nav-item" href="j91008/feeding.jsp">
				<span class="mui-icon iconfont icon-weiyang"></span>
				<span class="mui-tab-label">喂养</span>
			</a>
			<a class="mui-tab-item nav-item" href="j91008/platoon.jsp">
				<span class="mui-icon iconfont icon-dingdan7"></span>
				<span class="mui-tab-label">公排</span>
			</a>				
			<a class="mui-tab-item nav-item" href="j91008/center.jsp">
				<span class="mui-icon iconfont icon-huiyuan21"></span>
				<span class="mui-tab-label">我的</span>
			</a>
		</nav>
	</footer>
	</body>
	<script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<script>
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