<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机柜管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#loginName").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/comm/equipmentcabinet?catalog=${entity.cat.id}">机柜列表</a></li>
		<li class="active"><a href="${ctx}/data/comm/equipmentcabinet/form?catalog=${entity.cat.id}">机柜添加</a></li>
	</ul>
	
	<form:form id="inputForm" modelAttribute="equipmentCabinet" action="${ctx}/data/comm/equipmentcabinet/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="cat.id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd" class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
					    <td class="span2">名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2">所属基站:</td>
						<td class="span3" align="left" >
							<form:select path="bas.id" class="input-middle" style="width:158px">
								<form:option value="" label="请选择"/>
								<form:options items="${listBase}" itemLabel="name" itemValue="id" htmlEscape="false" />
							</form:select>
							<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    <td class="span2">简写:</td>
						<td class="span3" align="left"><form:input path="shortName"  htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					</tr>
					</tbody>
					<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4">
							<shiro:hasPermission name="sys:menu:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit"
									value="保 存" />&nbsp;
							</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
						</td>
					</tr>
				</tfoot>		
			</table>
		</div>		
	</form:form>
</body>
</html>