
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>桥涵积水病害管理</title>
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
            $("#searchForm").attr("action", "${ctx}/data/disease/disbridgeponding?catalog=${disBridgePonding.cat.id}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<input type="hidden"  value="${disBridgePonding.cat.id}" />
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/disease/disbridgeponding?catalog=${catalog}">病害列表</a></li>
    <li  ><a href="${ctx}/data/disease/disbridgeponding/form?catalog=${catalog}">病害添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="disBridgePonding"
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
        <th>桥涵名称</th>
        <th>中心里程</th>
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
            <td>${list.centerM}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/data/disease/disbridgeponding/form?id=${list.id}&catalog=${list.cat.id}">修改</a> <a
                        href="${ctx}/data/disease/disbridgeponding/delete?id=${list.id}&catalog=${list.cat.id}"
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