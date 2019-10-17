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
		<title>登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" href="j91008/css/style.css" />
		<link rel="stylesheet" href="j91008/css/login.css" />
	</head>
	<body>
		<div class="login_bg"></div>
    	<div class="login-view">
    		<div class="login-tab">
    			<a href="fish/toRegister" class="reglink">注册</a>
    			<div class="row-text">
	    			<i class="iconfont icon-yonghuming1 login-icon"></i>
	    			<input type="text" placeholder="请输入账号"/> 			
	    		</div>  		
	    		<div class="row-text">
	    			<i class="iconfont icon-mima4 login-icon"></i>
		    		<input type="password" placeholder="请输入密码" id="password"/>
	    		</div>
    		</div>
    		<a class="logindown">下载App</a>
    		<a href="findpwd.jsp" class="login-pwd">忘记密码？</a>
    		<div class="login-btn">
	            <input type="button" value="登  录">
	        </div>        			    		
    	</div>	    	


	</body>
	<script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<%--MD5加密--%>
	<script type="text/javascript" src="j91008/js/md5.js" ></script>
	<script>
		function login () {
		  
		}















		// md5加密
		function md5 (param) {
			return hex_md5(param);
		}

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
