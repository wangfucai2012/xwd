
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
    <li><a href="${ctx}/device/electricity/tem/volttransformer?catalog=${catalog}">互感器装备</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/tem/volttransformer/form?catalog=${catalog}">互感器添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="voltTransformer" action="${ctx}/device/electricity/tem/volttransformer/save?catalog=${catalog}" method="post">
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
                <td class="span2">设备名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
                <td class="span2">规格型号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="type" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
           <tr>
                <td class="span2">运行编号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="runNum" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">额定电压:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="standardV" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属部门:</td>
                <td class="span3" style="text-align: left;">
                    <sys:treeselect id="officeName" name="officeName.id" value="${entity.officeName.id}" labelName="officeName.name" labelValue="${entity.officeName.name}"
                                    title="部门" url="/sys/office/treeData?type=2" cssClass="required"/>
                </td>
                <td class="span2">电压比(kV/kV):</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="voltageRatio" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
             <tr>
                <td class="span2">0.5级容量(VA):</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="levelCapacity0_5" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">1级容量(VA):</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="levelCapacity1" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
             <tr>
                <td class="span2">3级容量(VA):</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="levelCapacity3" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">最大容量(VA):</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="maxCapacity" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">相数:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="phaseNumber" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">绝缘油号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="insulatingOilNumber" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">总重:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="countWeight" htmlEscape="false" maxlength="50" class="required"/>
                </td>
                <td class="span2">状态:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="state" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">年度:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="year" htmlEscape="false" maxlength="50" class="required"/>
                </td>
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
                <td class="span2">出厂日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="dateOfProduction" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>  
                <td class="span2">投运日期:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="commissioningDate" htmlEscape="false" maxlength="50" class="required"/>
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