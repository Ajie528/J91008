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
		<title>联系我们</title>
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
			<h1 class="mui-title header-h1">联系我们</h1>
		</header>
	   	<div class="content-view">
	    	<div class="pwdset-view">
				<div class="pwdset-tab">
					<div class="contact-div">
						<div class="qqimg"></div>
						<span class="contact-span">14251478592</span>
					</div>
				</div>
				<div class="pwdset-tab">
					<div class="contact-div">
						<div class="chartimg"></div>
						<span class="contact-span">14251478592</span>
					</div>
				</div>				
			</div>		
	    </div>  
	</body>
    <script type="text/javascript" src="j91008/j91008/js/mui.min.js" ></script>
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
