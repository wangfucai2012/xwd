<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-24
  Time: 上午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>管理系统</title>
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
            $("#searchForm").attr("action", "${ctx}/device/electricity/cne/arrester");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/device/electricity/cne/arrester?catalog=${catalog}">避雷器列表</a></li>
    <li><a href="${ctx}/device/electricity/cne/arrester/form?catalog=${catalog}">避雷器添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="arrester"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

    <input type="hidden" name="catalog" value="${catalog}" />
    <label>避雷器名称：</label>
    <form:input path="name" htmlEscape="false" maxlength="50"
                class="input-medium" />
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
    value="查询" onclick="return page();" />
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>线名</th>
        <th>避雷器名称</th>
        <th>所属支柱</th>
        <th>所属区间</th>
        <th>引线距接地体最小距离</th>
        <th>引线弛度</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.lineName}</td>
            <td>${list.name}</td>
            <td>${list.pillar.name}</td>
            <td>${list.powerSupplySection.name}</td>
            <td>${list.minimumRange}</td>
            <td>${list.lineChi}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/device/electricity/cne/arrester/form?id=${list.id}&catalog=${catalog}">修改</a> <a
                        href="${ctx}/device/electricity/cne/arrester/delete?id=${list.id}&catalog=${catalog}"
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