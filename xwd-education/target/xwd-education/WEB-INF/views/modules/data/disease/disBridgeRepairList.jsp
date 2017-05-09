
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>桥梁维修病害管理</title>
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
            $("#searchForm").attr("action", "${ctx}/data/disease/disbridgerepair?catalog=${disBridgeRepair.cat.id}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<input type="hidden"  value="${disBridgeRepair.cat.id}" />
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/disease/disbridgerepair?catalog=${catalog}">病害列表</a></li>
    <li  ><a href="${ctx}/data/disease/disbridgerepair/form?catalog=${catalog}">病害添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="disBridgeRepair"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />
   <input type="hidden" name="catalog" value="${catalog}" />
   
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>行别</th>
        <th>中心里程</th>
        <th>劣化内容</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.steam}</td>
            <td>${list.centerM}</td>
            <td>${list.content}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/data/disease/disbridgerepair/form?id=${list.id}&catalog=${list.cat.id}">修改</a> <a
                        href="${ctx}/data/disease/disbridgerepair/delete?id=${list.id}&catalog=${list.cat.id}"
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