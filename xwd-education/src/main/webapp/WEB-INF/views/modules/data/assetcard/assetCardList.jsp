<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<title>实际的业务名称，固资卡片</title>
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
    <form:hidden path="assetCard.cat.id"/>
	<ul class="nav nav-tabs">
	    <li class="active"><a href="${ctx}/data/assetCard?catalog=${assetCard.cat.id}">固资卡片</a></li>
		<li><a href="${ctx}/data/assetCard/form?catalog=${assetCard.cat.id}">固资添加</a></li>
	</ul>
	
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="assetCard"
		action="${ctx}/data/assetCard/list?catalog=${assetCard.cat.id}" method="post"
		class="breadcrumb form-search">
		<input id="cat" name="cat.id" value="${assetCard.cat.id}" type="hidden"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div>
				<label>编号：</label><form:input path="assetCode" htmlEscape="false" maxlength="50" class="input-big"/>
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
			<th style="text-align: center;">名称</th>	
			<th style="text-align: center;">固定资产入账价值（元）</th>	
			<th style="text-align: center;">数量</th>	
			<th style="text-align: center;">计量单位</th>	
			<th style="text-align: center;">编号</th>
			<th style="text-align: center;">建造单位</th>
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
				<td style="text-align: center;">${entity.name}</td>
				<td style="text-align: center;">
				<c:set var="string1" value="${entity.orgAssetValue}"/>
				<c:if test="${fn:indexOf(string1,'*')==-1}">
				<fmt:formatNumber value="${entity.orgAssetValue}" pattern="#,##0.##"/>
				</c:if>
				<c:if test="${fn:indexOf(string1,'*')!=-1}">
				<c:out value="${entity.orgAssetValue}" />
	            </c:if>
				</td>
				<td style="text-align: center;">${entity.assetNum}</td>
				<td style="text-align: center;">${entity.unit}</td>
				<td style="text-align: center;">${entity.assetCode}</td>
				<td style="text-align: center;">${entity.constructCompany}</td>
				<td style="text-align: center;">
				<a  href="${ctx}/data/assetCard/form?id=${entity.id}">修改</a>
				&nbsp;<a href="${ctx}/data/assetCard/delete?id=${entity.id}&catalogid=${entity.cat.id}"
                        onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>