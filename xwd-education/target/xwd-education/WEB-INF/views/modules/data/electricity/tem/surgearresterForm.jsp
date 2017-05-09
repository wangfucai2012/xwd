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
    <li><a href="${ctx}/device/electricity/tem/surgearrester?catalog=${catalog}">设备列表</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/tem/surgearrester/form?catalog=${catalog}">设备添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="surgearrester" action="${ctx}/device/electricity/tem/surgearrester/save?catalog=${catalog}" method="post">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <input type="hidden" name="cata.id" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">所属固资卡片:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="assetCard.id" class="required" style="width: 158px;">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getAssetCardList(catalog)}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
                <td class="span2">所属变电所:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="substation.id" class="required" style="width: 158px;">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getSubstationList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">线名:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="lineName" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
                <td class="span2">名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
           <tr>
                <td class="span2">所属部门:</td>
                <td class="span3" style="text-align: left;">
                    <sys:treeselect id="officeName" name="officeName.id" value="${entity.officeName.id}" labelName="officeName.name" labelValue="${entity.officeName.name}"
                                    title="部门" url="/sys/office/treeData?type=2" cssClass="required"/>
                </td>
                <td class="span2">装置结构:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="cstu" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">单位:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="institution" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">运行编号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="runNum" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">规格型号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="type" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">套管材质:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="casingMaterial" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">额定电压:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="casingMaterial" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">类别:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="category" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">生产厂家:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="manufacturer" htmlEscape="false" maxlength="50" class="required"/>
                </td>           
             	<td class="span2">出厂序号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="serialNumber" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">出厂日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="dateOfProduction" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">投运日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="commissioningDate" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">高度:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="height" htmlEscape="false" maxlength="50"/>
                </td>
                <td class="span2">备注:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="note" htmlEscape="false" maxlength="50" class="required"/>
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