<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>站点管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/site/">站点列表</a></li>
		<shiro:hasPermission name="sys:site:edit">
			<li><a href="${ctx}/sys/site/form">站点添加</a></li>
		</shiro:hasPermission>
	</ul>
	<div class="tableBar">
		<div class="searchBar">
			<form:form id="searchForm" modelAttribute="site"
				action="${ctx}/sys/site/" method="post" class="form-search">
				<input id="pageNo" name="pageNo" type="hidden"
					value="${page.pageNo}" />
				<input id="pageSize" name="pageSize" type="hidden"
					value="${page.pageSize}" />
				<label>名称：</label>
				<form:input path="name" htmlEscape="name" maxlength="50"
					class="input-medium" />
		&nbsp;&nbsp;<label>编号：</label>
				<form:input path="code" htmlEscape="false" maxlength="50"
					class="input-medium" />
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="查询" />&nbsp;&nbsp;&nbsp;&nbsp;<input id="btn" class="btn"
					type="reset" value="重置" />
			</form:form>
		</div>
		<sys:message msgcontent="${message}" />
		<table id="contentTable" class="table table-striped table-bordered table-hover ">
			<thead>
				<tr>
					<th>站点名称</th>
					<th>名称</th>
					<th>编码</th>
					<th>链接</th>
					<shiro:hasPermission name="sys:site:edit">
						<th>操作</th>
					</shiro:hasPermission>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="site">
					<tr>
						<td>${site.value}</td>
						<td><a href="${ctx}/sys/site/form?id=${site.id}">${site.name}</a></td>
						<td>${site.code}</td>
						<td>${site.url}</td>
						<shiro:hasPermission name="sys:site:edit">
							<td style="text-align: center;"><a
								href="${ctx}/sys/site/form?id=${site.id}">修改</a> |&nbsp;<a
								href="${ctx}/sys/site/delete?id=${site.id}"
								onclick="return confirmx('确认要删除该站点吗？', this.href)">删除</a></td>
						</shiro:hasPermission>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</div>
</body>
</html>