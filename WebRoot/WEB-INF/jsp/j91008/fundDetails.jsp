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
		<title>奖金明细</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" href="j91008/css/style.css" />
	</head>
	<body>
		<header class="mui-bar mui-bar-nav headernav-bg">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
			<h1 class="mui-title header-h1">奖金明细</h1>
		</header>
	   	<div class="content-view">
	    	<ul class="mui-table-view fund-view">
				<li class="mui-table-view-cell fund-cell">
					<div class="mui-row">
						<div class="mui-col-xs-8">
							<p class="fund-number">15806514854</p>
							<p class="fund-row">类型：0.00万</p>
							<p class="fund-row">时间：2019-09-21 00:00:00</p>
						</div>					
						<div class="mui-col-xs-4 mui-text-right">
							<p class="fund-row">数量：<span class="fund-text">+4586.25</span></p>
							<p class="fund-row">状态：转入</p>
						</div>				
					</div>				
				</li>
				<li class="mui-table-view-cell fund-cell">
					<div class="mui-row">
						<div class="mui-col-xs-8">
							<p class="fund-number">15806514854</p>
							<p class="fund-row">类型：0.00万</p>
							<p class="fund-row">时间：2019-09-21 00:00:00</p>
						</div>					
						<div class="mui-col-xs-4 mui-text-right">
							<p class="fund-row">数量：<span class="fund-text1">-4586.25</span></p>
							<p class="fund-row">状态：转出</p>
						</div>				
					</div>				
				</li>
				<li class="mui-table-view-cell fund-cell">
					<div class="mui-row">
						<div class="mui-col-xs-8">
							<p class="fund-number">15806514854</p>
							<p class="fund-row">类型：0.00万</p>
							<p class="fund-row">时间：2019-09-21 00:00:00</p>
						</div>					
						<div class="mui-col-xs-4 mui-text-right">
							<p class="fund-row">数量：<span class="fund-text">+4586.25</span></p>
							<p class="fund-row">状态：转入</p>
						</div>				
					</div>				
				</li>
				<li class="mui-table-view-cell fund-cell">
					<div class="mui-row">
						<div class="mui-col-xs-8">
							<p class="fund-number">15806514854</p>
							<p class="fund-row">类型：0.00万</p>
							<p class="fund-row">时间：2019-09-21 00:00:00</p>
						</div>					
						<div class="mui-col-xs-4 mui-text-right">
							<p class="fund-row">数量：<span class="fund-text">+4586.25</span></p>
							<p class="fund-row">状态：转入</p>
						</div>				
					</div>				
				</li>
			</ul>    	
	    </div>  
	</body>
    <script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<script type="text/javascript">
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
