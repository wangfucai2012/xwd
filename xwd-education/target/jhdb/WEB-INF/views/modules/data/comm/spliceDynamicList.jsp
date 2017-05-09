
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>接头动态信息管理</title>
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
            $("#searchForm").attr("action", "${ctx}/data/comm/splicedynamic?&spliceId=${spliceDynamic.splice.id}");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<form:hidden path="spliceDynamic.splice.id"/>
<ul class="nav nav-tabs">
    <li ><a href="${ctx}/data/comm/splice">基础信息列表</a></li>
    <li  class="active"><a href="${ctx}/data/comm/splicedynamic?spliceId=${spliceDynamic.splice.id}">接头详细信息</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="spliceDynamic"
           method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />

          <label>日期：</label>
				<input type="text" readonly="readonly" style="width: 100px"
					name="startDate" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value='${spliceDynamic.checkDate}' pattern="yyyy-MM-dd" type='date'/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />&nbsp;至&nbsp;
				<input type="text" readonly="readonly" style="width: 100px"
					name="endDate" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value='${spliceDynamic.checkDate}' pattern="yyyy-MM-dd" type='date'/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />

				&nbsp;&nbsp;	<input id="btnSubmit" class="btn btn-primary" type="submit"  value="查询" />
				&nbsp;&nbsp;	<a href="${ctx}/data/comm/splicedynamic?&spliceId=${spliceDynamic.splice.id}" class="btn "
					><input id="btn" class="btn " type="button"  value="重置" /></a>
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>所属工区</th>
        <th>基站-基站</th>
        <th>接头个数</th>
        <th>接头位置</th>
        <th>排查日期</th>
        <th>排查人</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.splice.netarea.name}</td>
            <td>${list.splice.startB.name}-${list.splice.endB.name}</td>
            <td>${list.spliceNum}</td>
            <td>${list.splicePosition}</td>
            <td><fmt:formatDate value='${list.checkDate}' pattern="yyyy-MM-dd" type='date'/></td>
            <td>${list.checkPerson}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/data/comm/splicedynamic/form?id=${list.id}&spliceId=${spliceDynamic.splice.id}">修改</a> <a
                        href="${ctx}//data/comm/splicedynamic/delete?id=${list.id}"
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