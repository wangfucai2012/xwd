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
            $("#searchForm").attr("action", "${ctx}/device/electricity/cne/pillar");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/device/electricity/cne/pillar?catalog=${catalog}">支柱列表</a></li>
    <li><a href="${ctx}/device/electricity/cne/pillar/form?catalog=${catalog}">支柱添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="pillar"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

    <%--<input type="hidden" name="catalog" value="${catalog}" />--%>
    <%--<label>起始里程：</label>--%>
    <%--<form:input path="startMile" htmlEscape="false" maxlength="50"--%>
                <%--class="input-medium" />--%>
    <%--<label>终止里程：</label>--%>
    <%--<form:input path="endMile" htmlEscape="false" maxlength="50"--%>
                <%--class="input-medium" />--%>
    <%--&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"--%>
    <%--value="查询" onclick="return page();" />--%>
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>线名</th>
        <th>所属固资卡片</th>
        <th>名称</th>
        <th>所属区间</th>
        <th>行别</th>
        <th>中心里程</th>
        <th>供电区段</th>
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
            <td>${list.assetCard.name}</td>
            <td>${list.name}</td>
            <td>${list.powerSupplySection.name}</td>
            <td>${list.stream}</td>
            <td>${list.centerMile}</td>
            <td>${list.eleSection}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/device/electricity/cne/pillar/form?id=${list.id}&catalog=${catalog}">修改</a> <a
                        href="${ctx}/device/electricity/cne/pillar/delete?id=${list.id}&catalog=${catalog}"
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