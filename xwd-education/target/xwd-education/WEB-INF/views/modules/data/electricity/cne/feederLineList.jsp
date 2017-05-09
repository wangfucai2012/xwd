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
            $("#searchForm").attr("action", "${ctx}/device/electricity/cne/feederLine");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/device/electricity/cne/feederLine?catalog=${catalog}">馈电线列表</a></li>
    <li><a href="${ctx}/device/electricity/cne/feederLine/form?catalog=${catalog}">馈电线添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="feederLine"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

    <input type="hidden" name="catalog" value="${catalog}" />
    <label>起始里程：</label>
    <form:input path="startMile" htmlEscape="false" maxlength="50"
                class="input-medium" />
    <label>终止里程：</label>
    <form:input path="endMile" htmlEscape="false" maxlength="50"
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
        <th>所属锚段</th>
        <th>长度</th>
        <th>起始里程</th>
        <th>终止里程</th>
        <th>所属区间</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.anchor.name}</td>
            <td>${list.length}</td>
            <td>
                <c:if test="${(list.startMile.indexOf('.')!=-1)}">
                    <c:set var="startM" value="${fn:split(list.startMile, '.')[0]}" />
                    <c:if test="${startM.length()>3}">
                        K ${fn:substring(startM, 0,startM.length()-3 )}
                        + ${fn:substring(startM, startM.length()-3, startM.length() )}
                    </c:if>
                    <c:if test="${startM.length()<=3}">
                        K 0
                        + ${startM}
                    </c:if>
                    .${fn:split(list.startMile,'.')[1]}
                </c:if>
                <c:if test="${(list.startMile.indexOf('.')==-1)}">
                    <c:set var="startM" value="${list.startMile}" />
                    <c:if test="${startM.length()>3}">
                        K ${fn:substring(startM, 0,startM.length()-3 )}
                        + ${fn:substring(startM, startM.length()-3, startM.length() )}
                    </c:if>
                    <c:if test="${startM.length()<=3}">
                        K 0
                        + ${startM}
                    </c:if>
                    .0
                </c:if>
            </td>
            <td>
                <c:if test="${(list.endMile.indexOf('.')!=-1)}">
                    <c:set var="endM" value="${fn:split(list.endMile, '.')[0]}" />
                    <c:if test="${endM.length()>3}">
                        K ${fn:substring(endM, 0,startM.length()-3 )}
                        + ${fn:substring(endM, endM.length()-3, endM.length() )}
                    </c:if>
                    <c:if test="${endM.length()<=3}">
                        K 0
                        + ${endM}
                    </c:if>
                    .${fn:split(list.endMile,'.')[1]}
                </c:if>
                <c:if test="${(list.endMile.indexOf('.')==-1)}">
                    <c:set var="endM" value="${list.endMile}" />
                    <c:if test="${endM.length()>3}">
                        K ${fn:substring(endM, 0,endM.length()-3 )}
                        + ${fn:substring(endM, endM.length()-3, endM.length() )}
                    </c:if>
                    <c:if test="${endM.length()<=3}">
                        K 0
                        + ${endM}
                    </c:if>
                    .00
                </c:if>
            </td>
            <td>${list.powerSupplySection.name}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/device/electricity/cne/feederLine/form?id=${list.id}&catalog=${catalog}">修改</a> <a
                        href="${ctx}/device/electricity/cne/feederLine/delete?id=${list.id}&catalog=${catalog}"
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