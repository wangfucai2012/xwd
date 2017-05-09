<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>接头台账信息管理</title>
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
    <li><a href="${ctx}/data/dynamicinfo/splice">接头列表</a></li>
    <li  class="active"><a href="${ctx}/data/dynamicinfo/splice/form">接头添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="splice" action="${ctx}/data/dynamicinfo/splice/save" method="post">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">所属工区:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="netarea.id" id="netarea.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getNetElectricalAreaList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">基站-基站:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="startB.id" id="startB.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getBaseStationList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>-
                    <form:select path="endB.id" id="endB.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getBaseStationList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>

            <tr>
                <td class="span2">上道口:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="upCrossing" htmlEscape="false"  class="required userName"/>
                </td>
            </tr>
             <tr>
                <td class="span2">备注:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="remark" htmlEscape="false" maxlength="50" />
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