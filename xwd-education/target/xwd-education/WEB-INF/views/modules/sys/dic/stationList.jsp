<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>系统管理</title>
<meta name="decorator" content="default" />
<%@include file="/WEB-INF/views/include/treetable.jsp"%>
<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
<script type="text/javascript">
<!--
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
//-->
</script>
</head>
<body>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/dic/station/">车站列表</a></li>
		<shiro:hasPermission name="sys:dic:station:edit">
			<li><a href="${ctx}/sys/dic/station/form">车站添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="station"
		action="${ctx}/sys/dic/station/" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<label>车站名称：</label>
		<form:input path="name" htmlEscape="false" maxlength="50"
			class="input-small" />
&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
			value="查询" />
&nbsp;<input id="btnReset" class="btn" type="reset" value="重置" />
	</form:form>
	<sys:message msgcontent="${message}" />
	<div class="tableoptions">
		<shiro:hasPermission name="sys:dic:station:edit">
			<a href="#" class="btn btn-default"
				onclick="deleteMutliData('${ctx}/sys/dic/station/deleteMulti')"><i
				class="glyphicon glyphicon-minus"></i></a>
		</shiro:hasPermission>
	</div>
	<table id="contentTable"
		class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th width="5%"><input type="checkbox" name="selectAll"
				id="selectAll" onclick="selcheck();" title="全选/清除" /></th>
			<th>序号</th>
			<th>车站名称</th>
			<th>是否换乘站</th>
			<th>车站类型</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
		</thead>
		   <tbody align="center">
		<c:set value="0" var="i" scope="page" />
		<c:forEach items="${page.list}" var="station">
			<c:set value="${pageScope.i + 1}" var="i" scope="page" />
			<tr>
				<td><input type="checkbox" name="objectId"
					value="${station.id}" id="${station.id}" /></td>
				<td>${i}</td>
				<td>${station.name}</td>
				<td>${fns:getDictLabel(station.isHuancheng, 'yes_no', '')}</td>
				<td>${fns:getDictLabel(station.stationType, 'station_place_type', '')}</td>
				<td>${station.remark}</td>
				<td style="text-align: center;"><shiro:hasPermission
						name="sys:dic:station:view">
						<a href="${ctx}/sys/dic/station/view?id=${station.id}">查看</a>
					</shiro:hasPermission> <shiro:hasPermission name="sys:dic:station:edit">
						<a href="${ctx}/sys/dic/station/form?id=${station.id}">修改</a>
					</shiro:hasPermission></td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr bgcolor="#ffffff">
			 <td colspan="7" ><div class="pagination">${page}</div></td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
</html>
