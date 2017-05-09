
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>土地设备通用类管理</title>
    <meta name="decorator" content="default" />
    <%@include file="/WEB-INF/views/include/dialog.jsp"%>
    <style type="text/css">
        .sort {
            color: #0663A2;
            cursor: pointer;
        }
    </style>
    <script>
        //分页调用JS
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").attr("action", "${ctx}/data/land/landeq?catalog=${landEq.cat.id}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<input type="hidden"  value="${landEq.cat.id}" />
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/land/landeq?catalog=${catalog}">设备列表</a></li>
    <li  ><a href="${ctx}/data/land/landeq/form?catalog=${catalog}">设备添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="landEq"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />
    <input type="hidden" name="catalog" value="${catalog}" />
	<input id="cat" type="hidden" name="cat.id" value="${landEq.cat.id}"/>
		<label>名称 ：</label>
		<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
				&nbsp;&nbsp;	<input id="btnSubmit" class="btn btn-primary" type="submit"  value="查询" />
				&nbsp;&nbsp;	<input id="btnReset" class="btn" type="reset" value="重置"/>
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>名称</th>
        <th>土地使用权人</th>
        <th>坐落</th>
        <th>地类（用途）</th>
        <th>使用权类型</th>
        <th>备注</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.name}</td>
            <td>${list.landUseRightPeoson}</td>
            <td>${list.locate}</td>
            <td>${list.landUse}</td>
            <td>${list.landUseRightType}</td>
            <td>${list.remark}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/data/land/landeq/form?id=${list.id}&catalog=${list.cat.id}">修改</a> <a
                        href="${ctx}/data/land/landeq/delete?id=${list.id}&catalog=${list.cat.id}"
                        onclick="return confirmx('确认要删除该数据吗？', this.href)">删除</a></td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td colspan="8">
            <div class="pagination">${page}</div>
        </td>
    </tr>
    </tfoot>
</table>
</body>
</html>