<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统管理</title>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
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
	<meta name="decorator" content="default"/>
	<style type="text/css">.table td i{margin:0 2px;}</style>
</head>
<body>
<div class="container">
<ul class="nav nav-tabs">
		<shiro:hasPermission name="sys:dic:line:view">
			<li><a href="${ctx}/sys/dic/line/">线路列表</a></li>
		</shiro:hasPermission>
		<li class="active"><a href="${ctx}/sys/dic/line/form">线路添加</a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="line" action="${ctx}/sys/dic/line/save" method="post"
	enctype="multipart/form-data">
	<form:hidden path="id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td class="span2">线路名称:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">线路长度:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="linelength" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">优先级:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="sort" htmlEscape="false" maxlength="50" class="required number"/>
				</td>
		</tr>
		<tr>
			<td class="span2">线路描述:</td>
			<td class="span3" style="text-align: left;">
				<form:textarea path="scribe" rows="5" htmlEscape="false" maxlength="200" class="required"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<shiro:hasPermission name="sys:dic:line:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</td>
		</tr>	
		</tbody>
		</table>
		</div>	
	</form:form>
</div>
</body>
</html>
