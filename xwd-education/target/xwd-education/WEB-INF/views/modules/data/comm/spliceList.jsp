
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>接头预警管理</title>
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
            $("#searchForm").submit();
            return false;
        }
    </script>
    <script type="text/javascript">
    $(document).ready(function () {
        ajax("${ctx}/data/comm/splice/getNetarea","",function (msg) {
        	 $("#Netarea").html("<option value=''></option>");
            var rval=$("#Netarea").attr("rval");
            if(!!msg) {
                msg.forEach(function (a, b) {
                    var option="<option onclick='getBaseStation(" + a.startM + "," + a.endM + ")' value='" + a.id + "'";
                    if(rval==a.id){
                        option+="selected";
                    }
                    option+=">" + a.name + "</option>";
                    $("#Netarea").append(option);
                })
                $("#Netarea").change();
            }
        })
    });
    function getBaseStation(start, end) {
        loading('正在查询，请稍等...');
        $("#startB option").remove();
        $("#endB option").remove();
        var data={startM:start,endM:end};
        ajax("${ctx}/data/comm/splice/getBaseStation",data,function (msg) {
            closeTip();
            $("#startB").append("<option></option>")
            $("#endB").append("<option></option>")
            var srval=$("#startB").attr("rval");
            var erval=$("#endB").attr("rval");
            if(!!msg) {
                msg.forEach(function (a, b) {
                    var option="<option value='" + a.id + "'>" + a.name + "</option>";
                    var soption="<option value='" + a.id + "' selected>" + a.name + "</option>";;
                    $("#startB").append(srval==a.id?soption:option);
                    $("#endB").append(erval==a.id?soption:option);
                })
                $("#startB").change();
                $("#endB").change();
            }
            $("#startB").attr("rval","");
            $("#endB").attr("rval","");
        })
    }
    function ajax(url,data,callback) {
        $.ajax({
            type : 'POST',
            url:url,
            data : data,
            dataType : 'json',
            success : function(message) {
                callback(message)
            }
        })
    }
      </script>
</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/data/comm/splice">接头列表</a></li>
    <li  ><a href="${ctx}/data/comm/splice/form">接头添加</a></li>
</ul>

<!--查询框start-->
<form:form id="searchForm" modelAttribute="splice"
           method="post" action="${ctx}/data/comm/splice" 
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
    <input id="pageSize" name="pageSize" type="hidden"
           value="${page.pageSize}" />
    <input id="orderBy" name="orderBy" type="hidden"
           value="${page.orderBy}" />
           <label>工　　区：</label>
                        <select id="Netarea" name="netarea.id" rval="${netareaId}" onchange="$(this[selectedIndex]).click()" style="width: 160px;">
                        </select>
           <label>基       站：</label>
                        <select id="startB" rval="${startId}" name="startB.id" style="width: 130px;">
                        </select> - 
                        <select id="endB" rval="${endId}" name="endB.id" style="width: 130px;">
                        </select>

				&nbsp;&nbsp;	<input id="btnSubmit" class="btn btn-primary" type="submit"  value="查询" />
				&nbsp;&nbsp;	<a href="${ctx}/data/comm/splice" class="btn "
					><input id="btn" class="btn " type="button"  value="重置" /></a>
</form:form>
<!--查询框end-->

<sys:message msgcontent="${message}" />
<table id="contentTable" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>工区名称</th>
        <th>基站-基站</th>
        <th>上道口</th>
        <shiro:hasPermission name="sys:user:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="list" varStatus="i">
        <tr>
            <td>${(page.pageNo-1)*page.pageSize + (i.index+1)}</td>
            <td>${list.netarea.name}</td>
            <td>${list.startB.name}-${list.endB.name}</td>
            <td>${list.upCrossing}</td>
            <shiro:hasPermission name="sys:user:edit">
                <td><a href="${ctx}/data/comm/splice/form?id=${list.id}">修改</a> <a
                        href="${ctx}//data/comm/splice/delete?id=${list.id}"
                        onclick="return confirmx('确认要删除该数据吗？', this.href)">删除</a>
                        <a href="${ctx}/data/comm/splicedynamic?spliceId=${list.id}">详细信息</a>
                        <a href="${ctx}/data/comm/splicedynamic/form?spliceId=${list.id}&">添加详细</a></td>
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