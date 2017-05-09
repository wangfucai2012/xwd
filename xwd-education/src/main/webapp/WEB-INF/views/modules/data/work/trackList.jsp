<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实际的业务名称，股道</title>
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
<form:hidden path="track.cat.id"/>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/work/track?catalog=${track.cat.id}">股道列表</a></li>
		<li><a href="${ctx}/data/work/track/form?catalog=${track.cat.id}">股道添加</a></li>
	</ul>
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="track"
		action="${ctx}/data/work/track/" method="post"
		class="breadcrumb form-search">
		<input id="cat" name="cat.id" value="${track.cat.id}" type="hidden"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<div>
				<label>股道编号：</label><form:input path="trackNo" htmlEscape="false" maxlength="50" class="input-small"/>
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
			<th>所在线路</th>
			<th>行别</th>
			<th>车站名</th>
			<th>线别</th>
			<th>股道编号</th>
			<th>全长</th>
			<th>轨道类型</th>
			<th>操作</th>
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
				<td>&nbsp;${entity.lineName}</td>
				<td>&nbsp;${entity.stream}</td>
				<td>&nbsp;${entity.station}</td>
				<td>&nbsp;${entity.lineType}</td>
				<td>&nbsp;${entity.trackNo}</td>
				<td>&nbsp;${entity.length}</td>
				<td style="text-align: center;">&nbsp;${entity.dic.label}</td>
				
				<td style="text-align: left;">
					<a href="${ctx}/data/work/track/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
					&nbsp;<a href="${ctx}/data/work/track/delete?id=${entity.id}&catalog=${entity.cat.id}"
	                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
	            </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>