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
		<title>修改资料</title>
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
			<h1 class="mui-title header-h1">个人信息</h1>
		</header>

		<div class="content-view">			
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>账号：</label></div>
				<div class="mui-col-xs-8"><input type="text" value="15472596745"/></div>	
			</div>			
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>姓名：</label></div>
				<div class="mui-col-xs-8"><input type="text" value="哈哈哈"/></div>	
			</div>
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>银行卡：</label></div>
				<div class="mui-col-xs-8"><input type="text" value="167426741165484155685"/></div>	
			</div>
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>开户行地址：</label></div>
				<div class="mui-col-xs-8"><input type="text" value="南宁"/></div>	
			</div>
			<div class="charge-row mui-row">
				<div class="mui-col-xs-4"><label>手机号：</label></div>
				<div class="mui-col-xs-8"><input type="text" value="1485247568472"/></div>	
			</div>
			<div class="charge-row mui-row cash-pt">
				<div class="mui-col-xs-4"><label>收款二维码：</label></div>
				<div class="mui-col-xs-8 cash-row ">
					<div class="modify-code">
						<img src="j91008/images/upload.png" />
						<input type="file" class="upload-file" />
					</div>
					<div class="modify-code"><img src="j91008/images/code.png" /> </div>
				</div>	
			</div>
			<button type="button" class="charge-btn">修改资料</button>
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