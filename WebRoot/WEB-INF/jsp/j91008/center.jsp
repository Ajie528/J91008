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
		<title>我的</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="j91008/css/style.css" />
	</head>
	<body>	
		<div class="content-nav">
			<!--轮播图start-->
			<div id="slider" class="mui-slider slider-height">
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
			<div class="mui-row mar-bg mui-clearfix">
				<div class="mui-col-xs-2"><i class="iconfont icon-tongzhigonggao1 mar-icon"></i></div>
				<div class="mui-col-xs-10">
					<marquee class="mar-text">今天企业正式上市</marquee>
				</div>
			</div>
			<div class="center-view">
				<div class="center-feed mui-row">
					<div class="mui-col-xs-3 center-feed-text">鱼料</div>
					<div class="mui-col-xs-4 center-feed-number">0</div>
					<div class="mui-col-xs-5 center-feed-btn">
						<button class="center-feed-charge-btn">充值</button>					
						<button class="center-feed-cash-btn">提现</button>
					</div>
				</div>
				<div class="center-bg center-myearnings-view">
					<p class="center-myearnings"><i class="iconfont icon-shouyi2 center-icon"></i>我的收益</p>
					<div class="center-flex">
						<div class="center-myearnings-text"><p class="center-zero">0</p>鱼料</div>
						<div class="center-myearnings-text"><p class="center-zero">0</p>今日喂养</div>
						<div class="center-myearnings-text"><p class="center-zero">0</p>推荐数量</div>
						<div class="center-myearnings-text"><p class="center-zero">0</p>爱心币</div>
					</div>
				</div>
				<div class="center-bg center-myearnings-view">				
					<div class="center-flex center-tab">
						<a href="fundDetails.jsp"><div class="center-tab-text"><i class="iconfont icon-zijinmingxi center-icon1"></i>奖金明细</div></a>
						<a href="myteam.html"><div class="center-tab-text"><i class="iconfont icon-tuandui4 center-icon1"></i>我的团队</div></a>
						<a href="contactus.jsp"><div class="center-tab-text"><i class="iconfont icon-xinxi center-icon1"></i>联系我们</div></a>
						<a href="#"><div class="center-tab-text"><i class="iconfont icon-banshidating center-icon1"></i>交易所</div></a>
						
					</div>
				</div>				
				<ul class="mui-table-view center-tab-cell center-bg">
					<li class="mui-table-view-cell center-cell-view">					
						<a href="invitation" class="mui-navigate-right center-cell-text"><i class="iconfont icon-yaoqing center-icon-list"></i>邀请好友</a>
					</li>
					<li class="mui-table-view-cell center-cell-view">					
						<a href="modifydata" class="mui-navigate-right center-cell-text"><i class="iconfont icon-gerenxinxi center-icon-list"></i>个人信息</a>
					</li>
					<li class="mui-table-view-cell center-cell-view">					
						<a href="modifypwd" class="mui-navigate-right center-cell-text"><i class="iconfont icon-xiugaimima5 center-icon-list"></i>修改密码</a>
					</li>
					<li class="mui-table-view-cell center-cell-view">					
						<a href="#" class="mui-navigate-right center-cell-text"><i class="iconfont icon-tuichu9 center-icon-list"></i>安全退出</a>
					</li>
				</ul>				
			</div>
		</div>

		<footer>
			<nav class="mui-bar mui-bar-tab nav-bg1">
				<a class="mui-tab-item nav-item" href="fish/toIndex.do">
					<span class="mui-icon iconfont icon-shouye8"></span>
					<span class="mui-tab-label">领养</span>
				</a>
				<a class="mui-tab-item nav-item" href="fish/toFeeding.do">
					<span class="mui-icon iconfont icon-weiyang"></span>
					<span class="mui-tab-label">喂养</span>
				</a>
				<a class="mui-tab-item nav-item" href="fish/toPlatoon.do">
					<span class="mui-icon iconfont icon-dingdan7"></span>
					<span class="mui-tab-label">公排</span>
				</a>
				<a class="mui-tab-item nav-item mui-active" href="fish/toCenter.do">
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