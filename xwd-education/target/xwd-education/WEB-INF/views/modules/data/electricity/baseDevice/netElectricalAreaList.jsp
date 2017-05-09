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
    <title>变电所管理</title>
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
            $("#searchForm").attr("action", "${ctx}/device/electricity/baseDevice/netElectricalArea");
            $("#searchForm").submit();
            return false;
        }
    </script>

</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/device/electricity/baseDevice/netElectricalArea/">工区列表</a></li>
    <li><a href="${ctx}/device/electricity/baseDevice/netElectricalArea/form">工区添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="entity"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

    <label>起始里程：</label>
    <form:input path="startM" htmlEscape="false" maxlength="50"
                class="input-medium" />
    <label>结束里程：</label>
    <form:input path="endM" htmlEscape="false" maxlength="50"
                class="input-medium" />
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
    value="查询" onclick="return page();" />
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th style="text-align: center;">名称</th>
        <th style="text-align: center;">所属部门</th>
        <th style="text-align: center;">起始里程</th>
        <th style="text-align: center;">终止里程</th>
        <shiro:hasPermission name="sys:user:edit">
            <th style="text-align: center;">操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list">
        <tr>
            <td style="text-align: center;">${list.name}</td>
            <td style="text-align: center;">${list.officeName.name}</td>
            <td style="text-align: center;">
                ${fns:getFormatMile(list.startM)}
            </td>
            <td style="text-align: center;">
                ${fns:getFormatMile(list.endM)}
            </td>
            <shiro:hasPermission name="sys:user:edit">
                <td style="text-align: center;"><a href="${ctx}/device/electricity/baseDevice/netElectricalArea/form?id=${list.id}">修改</a> <a
                        href="${ctx}/device/electricity/baseDevice/netElectricalArea/delete?id=${list.id}"
                        onclick="return confirmx('确认要删除数据吗？', this.href)">删除</a></td>
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