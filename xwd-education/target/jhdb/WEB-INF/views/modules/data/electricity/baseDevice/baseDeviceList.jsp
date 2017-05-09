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
    <title>实际的业务名称，变电所</title>
    <meta name="decorator" content="default" />
    <style type="text/css">.table td i {margin: 0 2px;}</style>
    <script type="text/javascript">

        <!--
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
        //-->

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/datamgr/fdt/substation?ledgerid=${substation.led.id}">变电所列表</a></li>
    <li><a href="${ctx}/datamgr/fdt/substation/form?ledgerid=${substation.led.id}">变电所添加</a></li>
</ul>
<div class="tableBar">
    <div class="searchBar">
        <form:form id="searchForm" modelAttribute="substation"
                   action="${ctx}/datamgr/fdt/substation/" method="post"
                   class="breadcrumb form-search">
            <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
            <input id="pageSize" name="pageSize" type="hidden"
                   value="${page.pageSize}" />
            <div>
                &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
                &nbsp;<input id="btnReset" class="btn" type="reset" value="重置"/>
            </div>

        </form:form>
    </div>

    <div class="tableoptions">
        <a href="#" class="btn"
           onclick="deleteMutliData('${ctx}/datamgr/fdt/tractionsub/deleteMulti')"><i
                class="icon-minus"></i></a>
    </div>

    <tags:message msgcontent="${message}" />
    <table id="contentTable"
           class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th style="text-align: center;"width="5%"><input type="checkbox" name="selectAll"
                                                             id="selectAll" onclick="selcheck();" title="全选/清除" /></th>
            <th style="text-align: center;"width="5%">序号</th>
            <th style="text-align: center;">名称</th>
            <th style="text-align: center;">运营里程</th>
            <th style="text-align: center;">所属部门</th>
            <th style="text-align: center;">操作</th>
        </thead>
        <tbody>

        <c:set value="0" var="i" scope="page" />
        <c:forEach items="${page.list}" var="entity">
            <c:set value="${pageScope.i + 1}" var="i" scope="page" />
            <tr>
                <td style="text-align: center;"><input type="checkbox" name="objectId" value="${entity.id}"
                                                       id="${entity.id}" /></td>
                <td style="text-align: center;"><c:out
                        value="${(page.pageNo-1)* page.pageSize + pageScope.i }" /></td>
                <td style="text-align: center;">${entity.name}</td>
                <td style="text-align: center;">${entity.length}</td>
                <td style="text-align: center;">${entity.officeName.name}</td>

                <td style="text-align: center;">
                    <a	href="${ctx}/datamgr/fdt/substation/view?id=${entity.id}">查看</a>
                    |&nbsp;<a  href="${ctx}/datamgr/fdt/substation/form?id=${entity.id}&ledgerid=${entity.led.id}">修改</a>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">${page}</div>
</body>
</html>