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
			<li><a href="${ctx}/sys/dic/line/">线路列表</a></li>
		</shiro:hasPermission>
		<li class="active"><a href="${ctx}/sys/dic/line/form">线路添加</a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="line"
		action="${ctx}/sys/dic/line/save" method="post"
		enctype="multipart/form-data">
		<form:hidden path="id" />
		<tags:message msgcontent="${message}" />
<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td>线路名称:</td>
			
				<td>${line.name}</td>
				
		</tr>
		<tr>
			<td>线路长度:</td>
			
				<td>${line.linelength}</td>
				
		</tr>
		<tr>
			<td>优先级:</td>
			
				<td>${line.sort}</td>
				
		</tr>
		<tr>
			<td>线路描述:</td>
			<td colspan="2">
			${line.scribe}
			</td>
		</tr>
		<tr>
		<td colspan="3">
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
