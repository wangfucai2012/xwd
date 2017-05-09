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
    <li><a href="${ctx}/device/electricity/cne/pwline?catalog=${catalog}">PW线列表</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/cne/pwline/form?catalog=${catalog}">PW线添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="pwLine" action="${ctx}/device/electricity/cne/pwline/save?catalog=${catalog}" method="post">
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
                <td class="span2">所属固资卡片:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="assetCard.id" class="required" style="width:158px">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getAssetCardList(catalog)}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属区间:</td>
                <td class="span3" style="text-align: left;">
                   <form:select path="powerSupplySection.id" class="required" style="width:158px">
                       <form:option value="" label="请选择" />
                       <form:options items="${fns:getPowerSupplySectionList()}" itemLabel="name" itemValue="id" htmlEscape="false"  />
                   </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属锚段:</td>
                <td class="span3">
                    <form:select path="anchor.id" class="required" style="width:158px">
                        <form:option value="" label="请选择" />
                        <form:options items="${fns:getAnchorList()}" itemLabel="name" itemValue="id" htmlEscape="false"  />
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">起始里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="startMile" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">终止里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="endMile" htmlEscape="false" maxlength="100" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">中心里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="centerM" htmlEscape="false" maxlength="100" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">基础网杆:</td>
                <td class="span3">
	                <form:select path="basicnetbarList" multiple="true" class="required" style="width:158px">
	                    <form:options items="${barList}" itemLabel="ecode" itemValue="id" />
	                </form:select>       
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