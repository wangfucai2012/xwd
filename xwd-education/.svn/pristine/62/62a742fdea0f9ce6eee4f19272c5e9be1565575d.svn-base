<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
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
		<li><a href="${ctx}/sys/dict/">字典列表</a></li>
		<li class="active"><a href="${ctx}/sys/dict/form?id=${dict.id}">字典<shiro:hasPermission name="sys:dict:edit">${not empty dict.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:dict:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="dict" action="${ctx}/sys/dict/save" method="post">
		<form:hidden path="id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td class="span2">键值:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="value" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">标签:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="label" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">类型:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="type" htmlEscape="false" maxlength="50" class="required abc"/>
			</td>
		</tr>
		<tr>
			<td class="span2">描述:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="remark" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">排序:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="sort" htmlEscape="false" maxlength="11" class="required number"/>
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<shiro:hasPermission name="sys:dict:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</td>
		</tr>
		</tbody>
		</table>
		</div>
	</form:form>
</body>
</html>