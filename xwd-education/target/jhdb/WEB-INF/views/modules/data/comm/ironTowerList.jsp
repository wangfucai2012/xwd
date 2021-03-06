<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实际的业务名称，铁塔</title>
<meta name="decorator" content="default" />
<style type="text/css">.table td i {margin: 0 2px;}</style>
<%@include file="/WEB-INF/views/include/treetable.jsp"%>
<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
<script>
	//分页调用JS
	function page(n, s) {
	    $("#pageNo").val(n);
	    $("#pageSize").val(s);
	    $("#searchForm").attr("action", "${ctx}/data/comm/irontower");
	    $("#searchForm").submit();
	    return false;
	}
</script>
</head>
<body>
	<form:hidden path="entity.cat.id"/>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/comm/irontower?catalog=${entity.cat.id}">铁塔列表</a></li>
		<li><a href="${ctx}/data/comm/irontower/form?catalog=${entity.cat.id}">铁塔添加</a></li>
	</ul>
	
	<!--查询框start-->
	<form:form id="searchForm" modelAttribute="ironTower"
	           action="${ctx}/data/comm/irontower?catalog=${entity.cat.id}" method="post"
	           class="breadcrumb form-search">
	    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
	    <input id="pageSize" name="pageSize" type="hidden"
	           value="${page.pageSize}" />
	    <input id="orderBy" name="orderBy" type="hidden"
	           value="${page.orderBy}" />
	           
	    <input id="cat" type="hidden" name="cat.id" value="${ironTower.cat.id}"/>
		<label>名称 ：</label>
		<form:input path="itName" htmlEscape="false" maxlength="50" class="input-medium"/>
				&nbsp;&nbsp;	<input id="btnSubmit" class="btn btn-primary" type="submit"  value="查询" />
				&nbsp;&nbsp;	<input id="btnReset" class="btn" type="reset" value="重置"/> 
	</form:form>
	<!--查询框end-->

	<sys:message msgcontent="${message}" />
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>	
			<tr>
				<th style="text-align: center;"width="5%"><input type="checkbox" name="selectAll"
					id="selectAll" onclick="selcheck();" title="全选/清除" /></th>
				<th style="text-align: center;" width="5%">序号</th>
				<th style="text-align: center;">铁塔名称</th>
				<th style="text-align: center;">用途</th>
				<th style="text-align: center;">杆塔高度</th>
				<th style="text-align: center;">纬度（北纬）</th>
				<th style="text-align: center;">经度（东经）</th>
				<th style="text-align: center;">铁塔类型</th>
				
				<th style="text-align: center;">操作</th>
			</tr>
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
					<td style="text-align: center;">${entity.itName}</td>
					<td style="text-align: center;">${entity.itPurpose}</td>
					<td style="text-align: center;">${entity.itHeight}</td>
					<td style="text-align: center;">${entity.latitude}</td>
					<td style="text-align: center;">${entity.longitude}</td>
					<td style="text-align: center;">${entity.dic.label}</td>
					
					<td style="text-align: center;">
					<a href="${ctx}/data/comm/irontower/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
					&nbsp;<a href="${ctx}/data/comm/irontower/delete?id=${entity.id}&catalog=${entity.cat.id}"
	                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
	                </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>