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
<form:hidden path="spliceDynamic.splice.id"/>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/data/comm/splice">基础信息列表</a></li>
    <li><a href="${ctx}/data/comm/splice/form">基础信息添加</a></li>
    <li><a href="${ctx}/data/comm/splicedynamic?spliceId=${spliceDynamic.splice.id}">接头信息列表</a></li>
    <li  class="active"><a href="${ctx}/data/comm/splicedynamic/form?spliceId=${spliceDynamic.splice.id}">接头信息添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="spliceDynamic" action="${ctx}/data/comm/splicedynamic/save" method="post">
    <form:hidden path="id"/>
    <form:hidden path="splice.id"/>
    <sys:message msgcontent="${message}"/>
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">接头个数:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="spliceNum" htmlEscape="false"  class="required userName"/>
                </td>
            </tr>
             <tr>
                <td class="span2">接头位置:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="splicePosition" htmlEscape="false"  class="required userName"/>
                </td>
            </tr>
             <tr>
                <td class="span2">排查日期:</td>
                <td class="span3" align="left">
					<input type="text" id="checkDate" name="checkDate" size="30"
					value="<fmt:formatDate value='${spliceDynamic.checkDate}' pattern="yyyy-MM-dd" type='date'/>" class="Wdate" onClick="WdatePicker();" />&nbsp;&nbsp;
					</td>
            </tr>
             <tr>
                <td class="span2">排查人:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="checkPerson" htmlEscape="false"  class="required userName"/>
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