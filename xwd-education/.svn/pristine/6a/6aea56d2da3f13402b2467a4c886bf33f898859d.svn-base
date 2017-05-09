<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>系统管理</title>
<meta name="decorator" content="default" />
<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
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
<div class="container">
	<ul class="nav nav-tabs">
		<shiro:hasPermission name="sys:dic:station:view">
			<li><a href="${ctx}/sys/dic/station/">车站列表</a></li>
		</shiro:hasPermission>
		<li class="active"><a href="${ctx}/sys/dic/station/form">车站添加</a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="station"
		action="${ctx}/sys/dic/station/save" method="post"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<sys:message msgcontent="${message}" />
<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td class="span2">车站名称:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="name" htmlEscape="false" maxlength="50"
					class="required" />
			</td>
		</tr>
		<tr>
			<td class="span2">是否换乘站:</td>
			<td class="span3" style="text-align: left;">
				<form:radiobuttons path="isHuancheng"
					items="${fns:getDictList('yes_no')}" itemLabel="label"
					itemValue="value" htmlEscape="false" class="required" />
			</td>
		</tr>
		<tr>
			<td class="span2">车站类型:</td>
			<td class="span3" style="text-align: left;">
				<form:select path="stationType">
					<form:options items="${fns:getDictList('station_place_type')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</td>
		</tr>
		<tr>
			<td class="span2">优先级:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="sort" htmlEscape="false" maxlength="50"
					class="required number" />
			</td>
		</tr>
		<tr>
			<td class="span2">车站描述:</td>
			<td class="span3" style="text-align: left;">
				<form:textarea path="remark" rows="5" htmlEscape="false"
					maxlength="200" class="required" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<shiro:hasPermission name="sys:dic:station:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
				</td>
		</tr>
	</tbody>
		</table>
		</div>	
	</form:form>
</div>
</body>
</html>
