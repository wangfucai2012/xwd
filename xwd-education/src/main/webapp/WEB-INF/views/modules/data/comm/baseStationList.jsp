
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>基站管理</title>
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
            $("#searchForm").attr("action", "${ctx}/data/comm/basestation??catalog=${catalog}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/comm/basestation?catalog=${catalog}">基站列表</a></li>
    <li  ><a href="${ctx}/data/comm/basestation/form?catalog=${catalog}">基站添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="baseStation"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />
    <input type="hidden" name="catalog" value="${catalog}" />
    <label>基站名称：</label>
    <form:input path="name" htmlEscape="false" maxlength="50" style="width:90px" />      
    &nbsp;
	<label style="margin-top:5px">里程范围：</label>
				K<form:input path="startK" id="startK" htmlEscape="false" maxlength="50"
					style="width:70px" class="required"  />+
				<form:input path="startM" id="startM" htmlEscape="false" maxlength="50"
					style="width:70px" class="required" />&nbsp;&nbsp;至&nbsp;&nbsp;
				K<form:input path="endK" id="endK" htmlEscape="false" maxlength="50"
					style="width:70px" class="required" />+
				<form:input path="endM" id="endM" htmlEscape="false" maxlength="50" 
					style="width:70px" class="required"  />&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;	<input id="btnSubmit" class="btn btn-primary" type="submit"  value="查询" />
				&nbsp;&nbsp;	<input id="btnReset" class="btn" type="reset" value="重置"/>
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th style="text-align: center;">序号</th>
        <th style="text-align: center;">基站名称</th>
        <th style="text-align: center;">中心里程</th>
        <shiro:hasPermission name="sys:user:edit">
            <th style="text-align: center;">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td style="text-align: center;">${list.name}</td>
            <td style="text-align: center;">
            	${fns:getFormatMile(list.centerM)}
            </td>
            <shiro:hasPermission name="sys:user:edit">
                <td style="text-align: center;"><a href="${ctx}/data/comm/basestation/form?id=${list.id}&catalog=${catalog}">修改</a> <a
                        href="${ctx}/data/comm/basestation/delete?id=${list.id}&catalog=${catalog}"
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