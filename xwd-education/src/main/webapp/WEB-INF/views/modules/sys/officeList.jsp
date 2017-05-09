<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/office/">机构列表</a></li>
		<shiro:hasPermission name="sys:office:edit"><li><a href="${ctx}/sys/office/form">机构添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message msgcontent="${message}"/>
	<div class="tableBar">
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<tr><th>机构名称</th><th>机构编码</th><th>机构类型</th><th>专业</th><th>备注</th><shiro:hasPermission name="sys:office:edit"><th>操作</th></shiro:hasPermission></tr>
		<c:forEach items="${list}" var="office">
			<tr id="${office.id}" pId="${office.parent.id ne requestScope.office.id?office.parent.id:'0'}">
				<td><a href="${ctx}/sys/office/form?id=${office.id}">${office.name}</a></td>
				<td>${office.code}</td>
				<td>${fns:getDictLabel(office.type, 'sys_office_type', '无')}</td>
				<td><c:if test="${office.profession== 'ALL'}">所有专业</c:if> 
				    <c:if test="${office.profession== 'GD'}">供电</c:if> 
				    <c:if test="${office.profession== 'GW'}">工务</c:if> 
				    <c:if test="${office.profession== 'TX'}">通信</c:if> 
				    <c:if test="${office.profession== 'XH'}">信号</c:if> 
				    <c:if test="${office.profession== 'FJ'}">房建</c:if> 
				    <c:if test="${office.profession== 'GPS'}">给排水</c:if> 
				    <c:if test="${office.profession== 'LF'}">旅服</c:if> 
				    <c:if test="${office.profession== 'TD'}">土地</c:if> </td>
				<td>${fns:abbr(office.remark,40)}</td>
				<shiro:hasPermission name="sys:office:edit"><td>
					<a href="${ctx}/sys/office/form?id=${office.id}">修改</a>
					|&nbsp;<a href="${ctx}/sys/office/delete?id=${office.id}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)">删除</a>
					|&nbsp;<a href="${ctx}/sys/office/form?parent.id=${office.id}">添加下级机构</a> 
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>