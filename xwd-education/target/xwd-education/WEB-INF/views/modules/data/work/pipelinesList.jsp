<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>管线</title>
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
		<li class="active"><a href="${ctx}/data/work/pipelines?catalog=${pipelines.cat.id}">管线列表</a></li>
		<li><a href="${ctx}/data/work/pipelines/form?catalog=${pipelines.cat.id}">管线添加</a></li>
	</ul>
	<div class="searchBar">	
		<form:form id="searchForm" modelAttribute="pipelines"
			action="${ctx}/data/work/pipelines?catalog=${pipelines.cat.id}" method="post"
			class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
			<input id="pageSize" name="pageSize" type="hidden"
				value="${page.pageSize}" />
			<div>
				<label>管线名称：</label>
				<form:input path="pipelineName" htmlEscape="false" maxlength="50" class="input-small"/>
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
			<th style="text-align: center;">中心里程</th>
			<th style="text-align: center;">行别</th>
			<th style="text-align: center;">管线名称</th>
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
				<td>&nbsp;${entity.centerM}</td>
				--%>
								<td style="text-align: center;">
                <c:if test="${(entity.centerM.indexOf('.')!=-1)}">
                    <c:set var="centerM" value="${fn:split(entity.centerM, '.')[0]}" />
                    <c:if test="${centerM.length()>3}">
                        K ${fn:substring(centerM, 0,centerM.length()-3 )}
                        + ${fn:substring(centerM, centerM.length()-3, centerM.length() )}
                    </c:if>
                    <c:if test="${centerM.length()<=3}">
                        K 0
                        + ${centerM}
                    </c:if>
                    .${fn:split(entity.centerM,'.')[1]}
                </c:if>
                <c:if test="${(entity.centerM.indexOf('.')==-1)}">
                    <c:set var="centerM" value="${entity.centerM}" />
                    <c:if test="${centerM.length()>3}">
                        K ${fn:substring(centerM, 0,centerM.length()-3 )}
                        + ${fn:substring(centerM, centerM.length()-3, centerM.length() )}
                    </c:if>
                    <c:if test="${centerM.length()<=3}">
                        K 0
                        + ${centerM}
                    </c:if>
                    .00
                </c:if>
            	</td>
				<td style="text-align: center;">&nbsp;${entity.stream}</td>
				<td style="text-align: center;">&nbsp;${entity.pipelineName}</td>
				<td style="text-align: center;">
				<a href="${ctx}/data/work/pipelines/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
				&nbsp;<a href="${ctx}/data/work/pipelines/delete?id=${entity.id}&catalog=${entity.cat.id}"
                onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a>
                </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>