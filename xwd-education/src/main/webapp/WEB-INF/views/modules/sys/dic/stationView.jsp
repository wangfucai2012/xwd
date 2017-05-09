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
</head>
<body>
<div class="container">
	<ul class="nav nav-tabs">
		<shiro:hasPermission name="sys:dic:line:view">
			<li><a href="${ctx}/sys/dic/station/">车站列表</a></li>
		</shiro:hasPermission>
		<li class="active"><a href="${ctx}/sys/dic/station/form">车站添加</a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="station"
		action="${ctx}/sys/dic/station/save" method="post"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<tags:message msgcontent="${message}" />
<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td>车站名称:</td>
			<td>${station.name}</td>
		</tr>
		<tr>
			<td>是否换乘站:</td>
			<td>${fns:getDictLabel(station.isHuancheng, 'yes_no', '')}</td>
		</tr>
		<tr>
			<td>车站类型:</td>
			<td>${fns:getDictLabel(station.stationType, 'station_place_type', '')}</td>
		</tr>
		<tr>
			<td>优先级:</td>
				<td>${station.sort}</td>
		</tr>
		<tr>
			<td>车站描述:</td>
			<td>${station.remark}</td>
		</tr>
			<tr>
			<td colspan="2">
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
