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
		<title>修改密码</title>
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
			<h1 class="mui-title header-h1">修改密码</h1>
		</header>

		<div class="content-view">			
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>旧密码</label></div>
				<div class="mui-col-xs-8"><input type="password" placeholder="请输入旧密码"/></div>	
			</div>			
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>新密码</label></div>
				<div class="mui-col-xs-8"><input type="password" placeholder="请输入新密码"/></div>	
			</div>
			<div class="charge-row mui-row noborderb">
				<div class="mui-col-xs-4"><label>确认密码</label></div>
				<div class="mui-col-xs-8"><input type="password" placeholder="请确认新密码"/></div>	
			</div>		
			<button type="button" class="charge-btn">确定</button>
		</div>
   

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