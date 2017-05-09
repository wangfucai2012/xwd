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
    <li><a href="${ctx}/device/electricity/cne/quarantine?catalog=${catalog}">开关列表</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/cne/quarantine/form?catalog=${catalog}">开关添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="quarantine" action="${ctx}/device/electricity/cne/quarantine/save?catalog=${catalog}" method="post">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">线名:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">隔离开关编号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="quarantineNo" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属支柱:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="pillar.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getPillarList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属区间:</td>
                <td class="span3" style="text-align: left;">
                   <form:select path="powerSupplySection.id" class="required">
                       <form:option value="" label="请选择" />
                       <form:options items="${fns:getPowerSupplySectionList()}" itemLabel="name" itemValue="id" htmlEscape="false"  />
                   </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">开关类型:</td>
                <td class="span3">
                    <form:input path="type" htmlEscape="false" maxlength="50" class="required"/>
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