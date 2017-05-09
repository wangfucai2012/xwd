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
			$("#stationName").focus();
			/* $("#inputForm").validate({
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
			}); */
		});
	</script>
</head>
<body>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a
			href="${ctx}/sys/dic/linestation/list?lineId=${lineId}">所辖车站列表</a></li>
		<shiro:hasPermission name="sys:dic:linestation:edit">
			<li><a href="${ctx}/sys/dic/linestation/form">所辖车站添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="inputForm" modelAttribute="lineStation"
		action="${ctx}/sys/dic/linestation/save" method="post"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<sys:message msgcontent="${message}" />
		<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<input id="line.id" name="line.id" type="hidden" value="${lineId}" />
		<tr>
			<td class="span2">车&nbsp;&nbsp;&nbsp;&nbsp;站:</td>
			<td class="span3" style="text-align: left;">
				<sys:treeselect id="station" name="station.id"
					value="${lineStation.station.id}"
					labelName="station.name"
					labelValue="${lineStation.station.name}" title="车站"
					url="/sys/dic/station/treeData" allowClear="true" />
			</td>
		</tr>
		<tr>
			<td class="span2">优&nbsp;先&nbsp;级:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="sort" htmlEscape="false" maxlength="50"
					class="required number" />
			</td>
		</tr>
		<tr>
			<td class="span2">描&nbsp;&nbsp;&nbsp;&nbsp;述:</td>
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
