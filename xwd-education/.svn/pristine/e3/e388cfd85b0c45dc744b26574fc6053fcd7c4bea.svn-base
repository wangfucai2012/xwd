<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-24
  Time: 下午2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>管理系统</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#loginName").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li><a href="${ctx}/device/electricity/tem/diyaplat?catalog=${catalog}">低压盘柜</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/tem/diyaplat/form?catalog=${catalog}">记录添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="diyaplat" action="${ctx}/device/electricity/tem/diyaplat/save?catalog=${catalog}" method="post">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <input type="hidden" name="cata.id" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">单位名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="unitName" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">设备名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="deviceName" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">主要部件:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="mainUnit" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">生产厂家:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="manufacturer" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">出厂序号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="serialNumber" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">出厂日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="productionDate" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">投运日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="commissioningDate" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">备注:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="remarks" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <shiro:hasPermission name="sys:user:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form:form>
</body>
</html>