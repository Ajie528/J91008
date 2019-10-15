<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/ace/css/chosen.css"/>
    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/index/top.jsp" %>
    <!-- 日期框 -->
    <link rel="stylesheet" href="static/ace/css/datepicker.css"/>
</head>
<body class="no-skin">

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">

                        <!-- 检索  -->
                        <form action="system_config/list.do" method="post" name="Form" id="Form">

                            <table id="simple-table" class="table table-striped table-bordered table-hover"
                                   style="margin-top:5px;">
                                <tbody>
                                <!-- 开始循环 -->
                                <c:choose>
                                    <c:when test="${not empty varList}">
                                        <c:if test="${QX.cha == 1 }">
                                            <tr>
                                                <th class='center'>每天提现次数：</th>
                                                <td class='center'><input type="number" name="WITHDRAW_TODAY"
                                                                          id="WITHDRAW_TODAY"
                                                                          value="${varList[0].WITHDRAW_TODAY}"
                                                                          maxlength="20" placeholder="这里输入每天提现次数"
                                                                          style="width:98%;"/></td>
                                                <th class='center'>提现手续费：</th>
                                                <td><input type="number" name="PAYMENT_FEE" id="PAYMENT_FEE"
                                                           value="${varList[0].PAYMENT_FEE}" maxlength="20"
                                                           placeholder="这里输入提现手续费" style="width:98%;"/>
                                                </td>
                                                <th class='center'>提现倍数：</th>
                                                <td><input type="number" name="CASH_MULTIPLIER" id="CASH_MULTIPLIER"
                                                           value="${varList[0].CASH_MULTIPLIER}" maxlength="32"
                                                           placeholder="这里输入提现倍数" style="width:98%;"/></td>
                                            </tr>
                                            <tr>
                                                <th class='center'>推广人数：</th>
                                                <td><input type="number" name="EXTENSION" id="EXTENSION"
                                                           value="${varList[0].EXTENSION}" maxlength="32"
                                                           placeholder="这里输入推广人数" style="width:98%;"/></td>
                                                <th class='center'>获得喂养次数：</th>
                                                <td><input type="number" name="GET_FREQUENCY" id="GET_FREQUENCY"
                                                           value="${varList[0].GET_FREQUENCY}" maxlength="32"
                                                           placeholder="这里输入获得喂养次数" style="width:98%;"/></td>
                                                <th class='center'>喂养封顶：</th>
                                                <td><input type="number" name="FEED_CAPPING" id="FEED_CAPPING"
                                                           value="${varList[0].FEED_CAPPING}" maxlength="32"
                                                           placeholder="这里输入喂养封顶" style="width:98%;"/></td>
                                            </tr>
                                            <tr>
                                                <th class='center'>饲料价格：</th>
                                                <td><input type="number" name="FEED_PRICE" id="FEED_PRICE"
                                                           value="${varList[0].FEED_PRICE}" maxlength="32"
                                                           placeholder="这里输入饲料价格" style="width:98%;"/></td>
                                                <th class='center'>出局收益：</th>
                                                <td><input type="number" name="OUT_EARNINGS" id="OUT_EARNINGS"
                                                           value="${varList[0].OUT_EARNINGS}" maxlength="32"
                                                           placeholder="这里输入出局收益" style="width:98%;"/></td>
                                                <th class='center'>没有推人喂养次数：</th>
                                                <td><input type="number" name="FEEDING_TIMES" id="FEEDING_TIMES"
                                                           value="${varList[0].FEEDING_TIMES}" maxlength="32"
                                                           placeholder="这里输入没有推人喂养次数" style="width:98%;"/></td>
                                            </tr>
                                            <tr>
                                                <th class='center'>轮播图1：</th>
                                                <td><img id="IMG_PATH1" src="${varList[0].IMG_PATH1}" style="width:100px; height: 100px"/></td>
                                                <th class='center'>轮播图2：</th>
                                                <td><img id="IMG_PATH2" src="${varList[0].IMG_PATH2}" style="width:100px; height: 100px"/></td>
                                                <th class='center'>轮播图3：</th>
                                                <td><img id="IMG_PATH3" src="${varList[0].IMG_PATH3}" style="width:100px; height: 100px"/></td>
                                            </tr>
                                            <tr>
                                                <th class='center'>上传轮播图1：</th>
                                                <td>
                                                    <input type='file' name='pictureFile' id='pictureFile1'
                                                           onchange='setImg(this)'>
                                                </td>
                                                <th class='center'>上传轮播图2：</th>
                                                <td>
                                                    <input type='file' name='pictureFile' id='pictureFile2'
                                                           onchange='setImg(this)'>
                                                </td>
                                                <th class='center'>上传轮播图3：</th>
                                                <td>
                                                    <input type='file' name='pictureFile' id='pictureFile3'
                                                           onchange='setImg(this)'>
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${QX.cha == 0 }">
                                            <tr>
                                                <td colspan="100" class="center">您无权查看</td>
                                            </tr>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="main_info">
                                            <td colspan="100" class="center">没有相关数据</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                            <div class="page-header position-relative">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="vertical-align:top;">
                                            <c:if test="${QX.add == 1 }">
                                                <a class="btn btn-mini btn-success" onclick="add();">新增</a>
                                            </c:if>
                                            <c:if test="${QX.del == 1 }">
                                                <a class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');"
                                                   title="批量删除"><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
    </div>
    <!-- /.main-content -->

    <!-- 返回顶部 -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>

</div>
<!-- /.main-container -->

<!-- basic scripts -->
<!-- 页面底部js¨ -->
<%@ include file="../../system/index/foot.jsp" %>
<!-- 删除时确认窗口 -->
<script src="static/ace/js/bootbox.js"></script>
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>
<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 日期框 -->
<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<%-- form表单ajax提交 --%>
<script src="static/js/jquery.form.js"></script>

<script type="text/javascript">
    $(top.hangge());//关闭加载状态
    //检索
    function tosearch() {
        top.jzts();
        $("#Form").submit();
    }


    //删除
    function del(Id) {
        bootbox.confirm("确定要删除吗?", function (result) {
            if (result) {
                top.jzts();
                var url = "<%=basePath%>system_config/delete.do?SYSTEM_CONFIG_ID=" + Id + "&tm=" + new Date().getTime();
                $.get(url, function (data) {
                    tosearch();
                });
            }
        });
    }

    //导出excel
    function toExcel() {
        window.location.href = '<%=basePath%>system_config/excel.do';
    }

    //用于进行图片上传格式验证
    function setImg(obj) {
        var f = $(obj).val();
        var id = $(obj).attr('id');
        if (f == null || f == undefined || f == '') {
            return false;
        }
        if (!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f)) {
            layer.msg("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            $(obj).val('');
            return false;
        }
        var url = "system_config/addPic";
        //异步提交表单(先确保jquery.form.js已经引入了)
        var options = {
            url: url,
            success: function (data) {
                picture_path = (data + "").trim();
                var sta = picture_path;
                if (id == "pictureFile1") {
                    $("#IMG_PATH1").attr({src: sta});
                    $("#pictureFile1").val("")
                }
                if (id == "pictureFile2") {
                    $("#IMG_PATH2").attr({src: sta});
                    $("#pictureFile2").val("")
                }
                if (id == "pictureFile3") {
                    $("#IMG_PATH3").attr({src: sta});
                    $("#pictureFile3").val("")
                }
            }
        };
        $("#Form").ajaxSubmit(options);
    }



</script>


</body>
</html>