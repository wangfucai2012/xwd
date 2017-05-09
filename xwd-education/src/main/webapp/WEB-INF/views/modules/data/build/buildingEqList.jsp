
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>房建设备通用类管理</title>
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
            $("#searchForm").attr("action", "${ctx}/data/build/buildingeq?catalog=${buildingEq.cat.id}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<input type="hidden"  value="${buildingEq.cat.id}" />
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/build/buildingeq?catalog=${catalog}">设备件列表</a></li>
    <li  ><a href="${ctx}/data/build/buildingeq/form?catalog=${catalog}">设备件添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="buildingEq"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />
    <input type="hidden" name="catalog" value="${catalog}" />
	<input id="cat" type="hidden" name="cat.id" value="${buildingEq.cat.id}"/>
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
        <th style="text-align: center;">序号</th>
        <th style="text-align: center;">件名</th>
        <th style="text-align: center;">台号</th>
        <th style="text-align: center;">建筑面积（㎡）</th>
        <th style="text-align: center;">设备类别</th>
        <th style="text-align: center;">技术等级</th>
        <shiro:hasPermission name="sys:user:edit">
            <th style="text-align: center;">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td style="text-align: center;">${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td style="text-align: center;">${list.name}</td>
            <td style="text-align: center;">${list.tNo}</td>
            <td style="text-align: center;">${list.area}</td>
            <td style="text-align: center;">${list.eqType}</td>
            <td style="text-align: center;">${list.teLevel}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td style="text-align: center;"><a href="${ctx}/data/build/buildingeq/form?id=${list.id}&catalog=${list.cat.id}">修改</a> <a
                        href="${ctx}/data/build/buildingeq/delete?id=${list.id}&catalog=${list.cat.id}"
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