<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>工作量统计</title>
<meta name="decorator" content="default" />
<style type="text/css">.table td i {margin: 0 2px;}</style>
<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
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
	<div class="searchBar">	
		<form:form id="searchForm" modelAttribute="infWorks"
			action="${ctx}/inf/nk/infworks/" method="post"
			class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
		</form:form>
	</div>
	
		<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
	 <thead>	
		<tr>
			<th style="text-align: center;"width="5%"><input type="checkbox" name="selectAll"
				id="selectAll" onclick="selcheck();" title="全选/清除" /></th>
			<th style="text-align: center;" width="5%">序号</th>
			<th style="text-align: center;">巡视(护栏内)（条公里）</th>
			<th style="text-align: center;">动态检测（处）</th>
			<th style="text-align: center;">接触线位置（条公里）</th>
			<th style="text-align: center;">锚段关节（处）</th>
			
			<th style="text-align: center;">操作</th>
		</thead>
		<tbody>
		<c:set value="0" var="i" scope="page" />
		<c:forEach items="${page.list}" var="entity">
			<c:set value="${pageScope.i + 1}" var="i" scope="page" />
			<tr>
				<td style="text-align: center;"><input type="checkbox" name="objectId" value="${entity.id}"
					id="${entity.id}" /></td>
				<td style="text-align: center;"><c:out
						value="${(page.pageNo-1)* page.pageSize + pageScope.i }" /></td>
				<%--
				<td style="text-align: center;">
				<c:set var="string1" value="${entity.centerM}"/>
                <c:set var="string2" value="${fn:substring(string1, 0, 3)}"/>
                <c:set var="string3" value="${fn:substring(string1, 3,6)}"/>K${string2}+${string3}
                </td>
                 --%> 
				<td style="text-align: center;">${entity.patrolKiloMeter}</td>
				<td style="text-align: center;">${entity.dymDetectKm}</td>
				<td style="text-align: center;">${entity.contactLineKm}</td>
				<td style="text-align: center;">${entity.anchorKm}</td>
				
				<td style="text-align: center;">
				<a href="${ctx}/inf/nk/infworks/view?id=${entity.id}">查看</a>
                </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>