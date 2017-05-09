<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>站点管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#value").focus();
				$("#inputForm")
						.validate(
								{
									submitHandler : function(form) {
										loading('正在提交，请稍等...');
										form.submit();
									},
									errorContainer : "#messageBox",
									errorPlacement : function(error, element) {
										$("#messageBox").text("输入有误，请先更正。");
										if (element.is(":checkbox")
												|| element.is(":radio")
												|| element.parent().is(
														".input-append")) {
											error.appendTo(element.parent()
													.parent());
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
		<li><a href="${ctx}/sys/site/">站点列表</a></li>
		<shiro:hasPermission name="sys:site:edit">
			<li class="active"><a href="${ctx}/sys/site/form">站点添加</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="inputForm" modelAttribute="site"
		action="${ctx}/sys/site/save" method="post">
		<form:hidden path="id" />
		<sys:message msgcontent="${message}" />
		<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td class="span2">站点名称:</td>
						<td class="span3" style="text-align: left;"><form:input
								path="value" htmlEscape="false" maxlength="50" class="required" />
						</td>
					</tr>
					<tr>
						<td class="span2">站点名字（中文）:</td>
						<td class="span3" style="text-align: left;"><form:input
								path="name" htmlEscape="false" maxlength="50" class="required" />
						</td>
					</tr>
					<tr>
						<td class="span2">编码:</td>
						<td class="span3" style="text-align: left;"><form:input
								path="code" htmlEscape="false" maxlength="50" class="required" />
						</td>
					</tr>
					<tr>
						<td class="span2">链接:</td>
						<td class="span3" style="text-align: left;"><form:input
								path="url" htmlEscape="false" maxlength="200"
								class="required abc" /></td>
					</tr>
					<tr>
						<td class="span2">描述:</td>
						<td class="span3" style="text-align: left;"><form:textarea
								path="remark" htmlEscape="false" rows="3" maxlength="50" class="required" />
						</td>
					</tr>
					<tr>
						<td class="span2">排序:</td>
						<td class="span3" style="text-align: left;"><form:input
								path="sort" htmlEscape="false" maxlength="11"
								class="required number" /></td>
					</tr>
					<tr>
						<td colspan="2"><shiro:hasPermission name="sys:site:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit"
									value="保 存" />&nbsp;</shiro:hasPermission> <input id="btnCancel" class="btn"
							type="button" value="返 回" onclick="history.go(-1)" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form:form>
</body>
</html>