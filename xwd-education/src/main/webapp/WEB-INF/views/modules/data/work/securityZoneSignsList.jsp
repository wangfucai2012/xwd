<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>安保区标桩</title>
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
<form:hidden path="securityZoneSigns.cat.id"/>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/work/securityzonesigns?catalog=${securityZoneSigns.cat.id}">标桩列表</a></li>
		<li><a href="${ctx}/data/work/securityzonesigns/form?catalog=${securityZoneSigns.cat.id}">标桩添加</a></li>
	</ul>
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="securityZoneSigns"
		action="${ctx}/data/work/securityzonesigns?catalog=${securityZoneSigns.cat.id}" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div>
				<label>里程：</label><form:input path="centerM" htmlEscape="false" maxlength="50" class="input-small"/>
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
			<th style="text-align: center;">车间</th>
			<th style="text-align: center;">行别</th>
			<th style="text-align: center;">线别</th>
			<th style="text-align: center;">侧别</th>
			<th style="text-align: center;">里程</th>
			<th style="text-align: center;">标桩类型</th>
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
				<td style="text-align: center;">&nbsp;${entity.workShop}</td>
				<td style="text-align: center;">&nbsp;${entity.stream}</td>
				<td style="text-align: center;">&nbsp;${entity.lineType}</td>
				<td style="text-align: center;">&nbsp;${entity.outStream}</td>
				<%-- 
				<td>&nbsp;${entity.mile}</td>
				--%>
				<td style="text-align: center;">
					${fns:getFormatMile(entity.centerM)}
            	</td>
				<td style="text-align: center;">&nbsp;${entity.signType}</td>
				<td style="text-align: center;">
				<a href="${ctx}/data/work/securityzonesigns/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
				&nbsp;<a href="${ctx}/data/work/securityzonesigns/delete?id=${entity.id}&catalog=${entity.cat.id}"
                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>