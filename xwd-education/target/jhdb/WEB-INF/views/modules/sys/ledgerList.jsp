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
		<li class="active"><a href="#">台账分类</a></li>
	<!--  <shiro:hasPermission name="sys:ledger:edit"><li><a href="${ctx}/sys/ledger/form">分类添加</a></li></shiro:hasPermission>-->	
	</ul>
	<tags:message msgcontent="${message}"/>
	<div class="tableBar">
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<tr><th>分类名称</th><th>专业</th><th>分类编码</th><th>分类对象</th><shiro:hasPermission name="sys:ledger:edit"><th>操作</th></shiro:hasPermission></tr>
		<c:forEach items="${list}" var="ledger">
			<tr id="${ledger.id}" pId="${ledger.parent.id ne requestScope.ledger.id?ledger.parent.id:'0'}">
				<td width="20%"><a href="${ctx}/sys/ledger/form?id=${ledger.id}">${ledger.name}</a></td>
				
				<td width="20%"  style="text-align: center;">${fns:getDictLabel(ledger.type, 'sys_ledger_type', '无')}</td>
				<td width="15%">${ledger.code}</td>
				<td width="25%">${ledger.remark}</td>
				<shiro:hasPermission name="sys:ledger:edit"><td width="20%">
					<a href="${ctx}/sys/ledger/form?id=${ledger.id}">修改</a>
					|&nbsp;<a href="${ctx}/sys/ledger/delete?id=${ledger.id}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)">删除</a>
					|&nbsp;<a href="${ctx}/sys/ledger/form?parent.id=${ledger.id}">添加下级分类</a> 
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
	</table>
</div>	
</body>
</html>