<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>油气管线</title>
<meta name="decorator" content="default" />
<style type="text/css">.table td i {margin: 0 2px;}</style>
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/work/oilpipelines?catalog=${oilPipelines.cat.id}">油管线列表</a></li>
		<li><a href="${ctx}/data/work/oilpipelines/form?catalog=${oilPipelines.cat.id}">油管线添加</a></li>
	</ul>
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="oilPipelines"
		action="${ctx}/data/work/oilpipelines?catalog=${oilPipelines.cat.id}" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div>
				<label>中心里程：</label><form:input path="centerM" htmlEscape="false" maxlength="50" class="input-small"/>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				&nbsp;<input id="btnReset" class="btn" type="reset" value="重置"/>
			</div>
	</form:form>
</div>

	<sys:message msgcontent="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		 <thead>
		<tr>
			<th style="text-align: center;"width="5%"><input type="checkbox" name="selectAll"
				id="selectAll" onclick="selcheck();" title="全选/清除" /></th>
			<th style="text-align: center;"width="5%">序号</th>
			<th style="text-align: center;">线别</th>
			<th style="text-align: center;">行别</th>
			<th style="text-align: center;">墩号</th>
			<th style="text-align: center;">管线中心里程</th>
			<th style="text-align: center;">输送介质</th>
			<th style="text-align: center;">通过方式</th>
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
				<td>&nbsp;${entity.lineType}</td>
				<td>&nbsp;${entity.stream}</td>
				<td>&nbsp;${entity.pNumber}</td>
				<%-- 
				<td>&nbsp;${entity.centerM}</td>
				--%>
				<td style="text-align: center;">
					${fns:getFormatMile(entity.centerM)}
            	</td>
				<td style="text-align: center;">&nbsp;${entity.medium}</td>
				<td style="text-align: center;">&nbsp;${entity.throughWay}</td>
				<td style="text-align: center;">
				<a href="${ctx}/data/work/oilpipelines/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
				&nbsp;<a href="${ctx}/data/work/oilpipelines/delete?id=${entity.id}&catalog=${entity.cat.id}"
                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>