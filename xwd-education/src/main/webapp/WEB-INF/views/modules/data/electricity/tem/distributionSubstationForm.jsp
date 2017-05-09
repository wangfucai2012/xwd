
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
    <li><a href="${ctx}/device/electricity/tem/distributionsubstation?catalog=${catalog}">配电所列表</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/tem/distributionsubstation/form?catalog=${catalog}">配电所添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="distributionSubstation" action="${ctx}/device/electricity/tem/distributionsubstation/save?catalog=${catalog}" method="post">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <input type="hidden" name="cata.id" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">配电所名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">中心里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="centerM" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属部门:</td>
                <td class="span3" style="text-align: left;">
                    <sys:treeselect id="officeName" name="officeName.id" value="${entity.officeName.id}" labelName="officeName.name" labelValue="${entity.officeName.name}"
                                    title="部门" url="/sys/office/treeData?type=2" cssClass="required"/>
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