
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
            $("#searchForm").attr("action", "${ctx}/device/electricity/tem/loadswitch");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/device/electricity/tem/loadswitch?catalog=${catalog}">开关设备</a></li>
    <li><a href="${ctx}/device/electricity/tem/loadswitch/form?catalog=${catalog}">开关添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="loadSwitch"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

    <input type="hidden" name="catalog" value="${catalog}" />
    <label>型号：</label>
    <form:input path="type" htmlEscape="false" maxlength="50"
                class="input-medium" />
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
    value="查询" onclick="return page();" />
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th style="text-align: center; width:5%;">序号</th>
        <th style="text-align: center;">型号</th>
        <th style="text-align: center;">生产厂家</th>
        <th style="text-align: center;">所属变电所</th>
        <th style="text-align: center;">运行编号</th>
        <shiro:hasPermission name="sys:user:edit">
            <th style="text-align: center;">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td style="text-align: center;">${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td style="text-align: center;">${list.type}</td>
            <td style="text-align: center;">${list.manufacturer}</td>
            <td style="text-align: center;">${list.substation.name}</td>
            <td style="text-align: center;">${list.runNum}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td style="text-align: center;"><a href="${ctx}/device/electricity/tem/loadswitch/form?id=${list.id}&catalog=${catalog}">修改</a> <a
                        href="${ctx}/device/electricity/tem/loadswitch/delete?id=${list.id}&catalog=${catalog}"
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