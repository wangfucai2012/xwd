<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>实际的业务名称，墩身</title>
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
<form:hidden path="pier.cat.id"/>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/data/work/pier?catalog=${pier.cat.id}">墩身列表</a></li>
		<li><a href="${ctx}/data/work/pier/form?catalog=${pier.cat.id}">墩身添加</a></li>
	</ul>
	<div class="tableBar">
	<div class="searchBar">	
	<form:form id="searchForm" modelAttribute="pier"
		action="${ctx}/data/work/pier?catalog=${pier.cat.id}" method="post"
		class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
			<div>
				<label>起始里程：</label><form:input path="startM" htmlEscape="false" maxlength="50" class="input-small"/>
				<label>终止里程：</label><form:input path="endM" htmlEscape="false" maxlength="50" class="input-small"/>
				<form:input path="cat.id" value="${requestScope.pier.cat.id}" htmlEscape="false" maxlength="50" class="input-small" type="hidden"/>
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
			<th style="text-align: center;">墩台号</th>
			<th style="text-align: center;">所属桥梁</th>
			<th style="text-align: center;">墩身类型</th>
			<th style="text-align: center;">桥梁类型</th>
			
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
				<c:set var="string1" value="${entity.centerM}"/>
				<c:set var="string2" value="${fn:substring(string1, 0, 3)}"/>
                <c:set var="string3" value="${fn:substring(string1, 3,11)}"/>K${string2}+${string3}
				</td>
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
				<td style="text-align: center;">&nbsp;${entity.pnumber}</td>
				<td style="text-align: center;">&nbsp;${entity.bridge.bridgeName}</td>
				
				<td style="text-align: center;">&nbsp;${entity.type}</td>
				<td style="text-align: center;">&nbsp;${entity.bridge.dic.label}</td>
				<td style="text-align: center;">
					<a href="${ctx}/data/work/pier/form?id=${entity.id}&catalog=${entity.cat.id}">修改</a>
					&nbsp;<a href="${ctx}/data/work/pier/delete?id=${entity.id}&catalog=${entity.cat.id}"
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