<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>光缆接头盒位置管理</title>
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
		<li><a href="${ctx}/data/comm/cablespliceclosurelocation?catalog=${entity.cat.id}">接头盒位置列表</a></li>
		<li class="active"><a href="${ctx}/data/comm/cablespliceclosurelocation/form?catalog=${entity.cat.id}">接头盒位置添加</a></li>
	</ul>
	
	<form:form id="inputForm" modelAttribute="cableSpliceClosureLocation" action="${ctx}/data/comm/cablespliceclosurelocation/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="cat.id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd" class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
					    <td class="span2" align="center">名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					    <td class="span2" align="center">北纬:</td>
						<td class="span3" align="left"><form:input path="latitude" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
												
					</tr>
					<tr>
						<td class="span2" align="center">东经:</td>
						<td class="span3" align="left"><form:input path="longitude" htmlEscape="false" maxlength="50"/>&nbsp;</td>
					    <td class="span2" align="center">地点:</td>
						<td class="span3" align="left"><form:input path="place"  htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
						
					</tr>
					</tbody>
					<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center">
							<shiro:hasPermission name="sys:menu:edit">
									<input id="btnSubmit" class="btn btn-primary" type="submit"
										value="保 存" />&nbsp;</shiro:hasPermission>
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
						</td>
					</tr>
				</tfoot>		
			</table>
		</div>		
	</form:form>
</body>
</html>