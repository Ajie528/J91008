<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<base href="<%=basePath%>">
<head>
    <meta charset="utf-8">
    <title>邀请好友</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="j91008/css/mui.min.css">
    <link rel="stylesheet" href="j91008/fonts/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="j91008/css/style.css"/>
</head>
<body>
<header class="mui-bar mui-bar-nav headernav-nobg">
    <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left header-a1"></a>
    <h1 class="mui-title header-h1">邀请好友</h1>
</header>
<div class="invitationbg"></div>
<div class="content-view">
    <div class="invitation-view">
        <div class="invitation-header">
            <div class="invitation-header-img"><img src="j91008/images/tx.jpg"/></div>
            <%--编号--%>
            <div class="invitation-header-text">${user.J91008_USER_ID}</div>

        </div>
        <div class="invitation-code">
            <%--二维码 j91008/images/code.png --%>
            <img id="code" src=""/>
        </div>
        <p>扫描二维码 , 加入我们</p>
    </div>

</div>


</body>
<script type="text/javascript" src="j91008/js/mui.min.js"></script>
<script type="text/javascript" src="j91008/js/jquery-3.4.1.js"></script>

<script>

$(function() {
    $("#code").attr("src", "fish/qr_code.do?phone=" + ${user.PHONE});
});



    mui('body').on('tap', 'a', function () {
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