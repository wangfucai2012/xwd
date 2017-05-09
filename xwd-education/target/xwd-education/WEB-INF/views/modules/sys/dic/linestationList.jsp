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
//-->
</script>
</head>
<body>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a
			href="${ctx}/sys/dic/linestation/list?lineId=${lineId}">所辖车站列表</a></li>
		<shiro:hasPermission name="sys:dic:linestation:edit">
			<li><a href="${ctx}/sys/dic/linestation/form?lineId=${lineId}">所辖车站添加</a></li>
		</shiro:hasPermission>
	</ul>
	<sys:message msgcontent="${message}" />
	<div class="tableoptions">

		<shiro:hasPermission name="sys:dic:linestation:edit">
			<a href="#" class="btn btn-default"
				onclick="deleteMutliData('${ctx}/sys/dic/linestation/deleteMulti')"><i
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
		</tr>
		</thead>
		  <tbody align="center">
		<c:set value="0" var="i" scope="page" />
		<c:forEach items="${lss}" var="ls">
			<c:set value="${i + 1}" var="i" scope="page" />
			<tr>
				<td><input type="checkbox" name="objectId"
					value="${ls.id}" id="${ls.id}" /></td>
				<td>${i}</td>
				<td>${ls.station.name}</td>
				<td>${fns:getDictLabel(ls.station.isHuancheng, 'yes_no', '')}</td>
				<td>${fns:getDictLabel(ls.station.stationType, 'station_place_type', '')}</td>
				<td>${ls.station.remark}</td>
			</tr>
		</c:forEach>
		</tbody>
		<tfoot>
			<tr bgcolor="#ffffff">
			 <td colspan="6" >	<input id="btnCancel" class="btn" type="button" value="返 回"
			onclick="window.location.href='${ctx}/sys/dic/line';" /></td>
			</tr>
		</tfoot>
	</table>
</div>
</body>
</html>
