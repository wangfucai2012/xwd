<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实际的业务名称，轨道</title>
<meta name="decorator" content="default" />
<style type="text/css">.table td i {margin: 0 2px;}</style>
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
<form:hidden path="sleeper.cat.id"/>
<input  type="hidden" value="${flag}" />
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/work/sleeper?catalog=${sleeper.cat.id}">轨枕列表</a></li>
		<li><a href="${ctx}/data/work/sleeper/form?catalog=${sleeper.cat.id}">轨枕添加</a></li>
	</ul>
	<div class="tableBar">
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="sleeper"
		action="${ctx}/data/work/sleeper?catalog=${sleeper.cat.id}" method="post"
		class="breadcrumb form-search">
		<input id="cat" name="cat.id" value="${sleeper.cat.id}" type="hidden"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
			<div>
				<label>起始里程：</label><form:input path="startM" htmlEscape="false" maxlength="50" class="input-small"/>
				<label>终止里程：</label><form:input path="endM" htmlEscape="false" maxlength="50" class="input-small"/>
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
			<th style="text-align: center;">起始里程</th>
			<th style="text-align: center;">终止里程</th>
			<th style="text-align: center;">轨道类型</th>
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
				<%-- 
				<td style="text-align: center;">
				<c:set var="string1" value="${entity.startMile}"/>
                <c:set var="string2" value="${fn:substring(string1, 0, 3)}"/>
                <c:set var="string3" value="${fn:substring(string1, 3,11)}"/>K${string2}+${string3}
				</td>
				<td style="text-align: center;">
				<c:set var="string1" value="${entity.endMile}"/>
                <c:set var="string2" value="${fn:substring(string1, 0, 3)}"/>
                <c:set var="string3" value="${fn:substring(string1, 3,11)}"/>K${string2}+${string3}
				</td>
				--%>
				<td style="text-align: center;">
					${fns:getFormatMile(entity.startM)}
            	</td>
            	<td style="text-align: center;">
					${fns:getFormatMile(entity.endM)}
            	</td>
				<td style="text-align: center;">&nbsp;${entity.dic.label}</td>
				
				<td style="text-align: center;">
					<a href="${ctx}/data/work/sleeper/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
					&nbsp;<a href="${ctx}/data/work/sleeper/delete?id=${entity.id}&catalog=${entity.cat.id}"
	                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
	            </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
	</div>
</body>
</html>