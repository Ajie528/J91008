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
		<title>充值</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="j91008/css/mui.min.css">
		<link rel="stylesheet" href="j91008/fonts/iconfont.css" />
		<link rel="stylesheet" href="j91008/css/style.css" />
		<link rel="stylesheet" href="j91008/css/mui.picker.css" />
		<link rel="stylesheet" href="j91008/css/mui.poppicker.css" />
		<style>
			.mui-poppicker-header{
				background-color: #fff;
			}
			.mui-pciker-list li {
				font-size: 14px;
				color: #666;
			}
			.mui-poppicker{
				height: 190px;
			}
			.mui-pciker-list, .mui-pciker-rule {
			    top: 23%;
			}
			.mui-poppicker-body .mui-picker {
			    background-color: #fff;
			}
			.mui-poppicker-body{
			    border-top: 1px solid #d8d8d8;
			}
			.mui-pciker-list li.highlight {
			    color: #333;
			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav headernav-bg">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
			<h1 class="mui-title header-h1">充值</h1>
		</header>

		<div class="content-view">
			<div class="charge-content">
				<div class="charge-row mui-row">
					<div class="mui-col-xs-4"><label>充值现金：</label></div>
					<div class="mui-col-xs-8"><input type="text" placeholder="请输入要充值的现金"/></div>	
				</div>			
				<div class="charge-row mui-row charge-pt">
					<div class="mui-col-xs-6"><label>需要支付的RMB为：</label></div>
					<div class="mui-col-xs-6"><input type="text"/></div>
					<!--<div class="mui-col-xs-6 cash-row">154</div>-->
				</div>
				<div class="charge-row mui-row charge-pt">
					<div class="mui-col-xs-4"><label>支付方式：</label></div>
					<div class="mui-col-xs-8">
						<!--<div class="charge-select-view">
			    			<select class="charge-select">
				    			<option>请选择付款方式</option>
				    			<option>银行卡</option>
				    			<option>支付宝</option>
				    			<option>微信</option>
				    		</select>
				    		<i class="iconfont icon-down-trangle select-icon"></i>
		    			</div>-->
		    			<button id='showUserPicker' class="mui-btn mui-btn-block charge-btn-text" type='button'>请选择付款方式</button>
		    			<i class="iconfont icon-down-trangle select-icon"></i>
					</div>	
					
				</div>
				<div class="charge-row-code mui-row charge-pt">
					<div class="mui-col-xs-4"><label>微信收款码：</label></div>
					<div class="mui-col-xs-8"><div class="charge-code"><img src="j91008/images/code.png" /> </div></div>
				</div>
				<div class="charge-row-code mui-row charge-pt">
					<div class="mui-col-xs-4"><label>微信收款码：</label></div>
					<div class="mui-col-xs-8">
						<div class="charge-code">
							<img src="j91008/images/upload.png" />
							<input type="file" class="upload-file"/>
						</div>						
					</div>	
				</div>
			</div>
			<button type="button" class="charge-btn">确定充值</button>
		</div>
   

	</body>
	<script type="text/javascript" src="j91008/js/mui.min.js" ></script>
	<script src="j91008/js/mui.picker.js"></script>
	<script src="j91008/js/mui.poppicker.js"></script>
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
           
           
        (function($, doc) {
			$.init();
			$.ready(function() {
				/**
				 * 获取对象属性的值
				 * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
				 * @param {Object} obj 对象
				 * @param {String} param 属性名
				 */
				var _getParam = function(obj, param) {
					return obj[param] || '';
				};
				//普通示例
				var userPicker = new $.PopPicker();
				userPicker.setData([{
					value: 'zfb',
					text: '支付宝'
				}, {
					value: 'yhk',
					text: '银行卡'
				}, {
					value: 'wx',
					text: '微信'
				}]);
				var showUserPickerButton = doc.getElementById('showUserPicker');
				showUserPickerButton.addEventListener('tap', function(event) {
					userPicker.show(function(items) {
						showUserPickerButton.innerText = items[0].text;
						//返回 false 可以阻止选择框的关闭
						//return false;
					});
				}, false);			
			});
		})(mui, document);
 	</script>
	
</html>