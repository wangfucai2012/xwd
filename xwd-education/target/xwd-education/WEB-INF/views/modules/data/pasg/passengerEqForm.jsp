<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>旅服设备通用类管理</title>
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
    <li ><a href="${ctx}/data/pasg/passengereq?catalog=${catalog}">设备列表</a></li>
    <li  class="active"><a href="${ctx}/data/pasg/passengereq/form?catalog=${catalog}">设备添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="passengerEq" action="${ctx}/data/pasg/passengereq/save?catalog=${catalog}" method="post">
    <form:hidden path="id"/>
    <form:hidden path="cat.id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">设备名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
             <tr>
                <td class="span2">中心里程:</td>
                <td class="span3" style="text-align: left;">
                     <form:input path="centerM" htmlEscape="false" maxlength="50"  class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">备注:</td>
                <td class="span3" style="text-align: left;">
                     <form:input path="remark" htmlEscape="false" maxlength="50"  />
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