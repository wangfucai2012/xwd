<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-12
  Time: 上午11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>目录分类</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
    <style type="text/css">.table td i{margin:0 2px;}</style>
    <link href="${ctx}/static/jquery-treetable/3.1.0/stylesheets/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/static/jquery-treetable/3.1.0/javascripts/src/jquery.treetable.js" type="text/javascript"></script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sys/catalog?level=${level}">目录列表</a></li>
    <shiro:hasPermission name="sys:office:edit"><li><a href="${ctx}/sys/catalog/form?level=${level}">目录添加</a></li></shiro:hasPermission>
</ul>
<sys:message msgcontent="${message}"/>
<form id="listForm" method="post">

    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>分类名称</th>
            <th>专业</th>
            <th>分类编码</th>
            <th>分类对象</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id='treeTableBody'>
        <c:forEach items="${list}" var="catalog">

            <tr id="${catalog.id}" pId="${((catalog.parents.id ne 1) and (catalog.parents.id ne 2))?catalog.parents.id:'0'}" >
                <td>
                    <a <c:if test="${catalog.orverwiteFlag!=0}">href="${ctx}/sys/catalog/form?id=${catalog.id}"  </c:if>>${catalog.names}</a>
                </td>
                <td>${fns:getDictLabel(catalog.levels, 'dictLevel', '无')}</td>
                <td>${catalog.code}</td>
                <td>${catalog.objects}</td>
                <td>
                    <c:if test="${catalog.orverwiteFlag!=0}">
                        <a href="${ctx}/sys/catalog/form?id=${catalog.id}">修改</a>
                        |&nbsp;<a href="${ctx}/sys/catalog/delete?id=${catalog.id}" onclick="return confirmx('要删除该项吗？', this.href)">删除</a>
                        |
                    </c:if>
                    &nbsp;<a href="${ctx}/sys/catalog/form?parentid=${catalog.id}&level=${level}">添加下级目录</a>
                </td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
</form>
<script type="text/javascript">
    $(document).ready(function() {
        // $("#treeTable").treetable();
        $("#treeTableBody").treeTable({expandLevel : 1});
    });
    function updateSort() {
        loading('正在提交，请稍等...');
        $("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
        $("#listForm").submit();
    }
</script>
</body>
</html>
