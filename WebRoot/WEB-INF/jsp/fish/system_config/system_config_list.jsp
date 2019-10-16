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
    <style>
        .upload_pic {
            height: 100px;
            width: 100px;
        }

        .preimg {
            position: absolute;
            top: 50%;
            right: 214px;
            width: 95px;
            height: 99px;
            opacity: 0;
            margin-top: -52px;
        }
    </style>
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
                                                <a class="btn btn-mini btn-success" onclick="edit();">更改</a>
                                                <a class="btn btn-mini " onclick="formReset()">取消</a>
                                                <a class="btn btn-mini btn-danger" onclick="wipeData();">清空数据</a>
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


    //清空数据
    function wipeData(){
        bootbox.confirm("确定要清空数据吗?", function(result) {
            if(result) {
                top.jzts();
                var url = "fish/resetSystem.do";
                $.get(url,function(data){
                    if(data === "success") {
                        alert("清空数据成功！")
                        location.reload(); //刷新页面
                    }
                });
            }
        });
    }

    //复位
    function formReset() {
        document.getElementById("Form").reset();
    }

    //判断不能为空
    function check() {  //Form是表单的ID
        for (var i = 0; i < document.Form.elements.length - 1; i++) {
            if (document.Form.elements[i].value === "") {
                alert("当前表单不能有空项");
                document.Form.elements[i].focus();
                return false;
            }
        }
        return true;
    }

    //获取from表单数据并传到后台
    function edit() {
        //取表单值
        finalRes = $("#Form").serializeArray().reduce(function (result, item) {
            result[item.name] = item.value;
            return result;
        }, {})
        //打印控制台查看数据是否符合
        console.log(finalRes)
        //验证是否为空
        if (check()) {
            var lock = true;
        } else {
            lock = false;
        }
        //通过ajax传到后台
        if (lock) {
            $.ajax({
                url: "system_config/edit",
                type: "post",
                data: finalRes,
                timeout: 10000, //超时时间设置为10秒
                success: function (data) { //回调函数
                    if (data === "success") {
                        alert("参数更改成功~");
                        location.reload(); //刷新页面
                    } else {
                        alert("参数更改失败~");
                        location.reload(); //刷新页面
                    }
                },
            });
        }
    }

    //导出excel
    function toExcel() {
        window.location.href = '<%=basePath%>system_config/excel.do';
    }


</script>


</body>
</html>