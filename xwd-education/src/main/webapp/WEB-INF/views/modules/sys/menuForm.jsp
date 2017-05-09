\<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>菜单管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#name").focus();
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
<!-- easy-ui -->

<link href="${ctxStatic}/jquery-easyui/1.4.2/themes/gray/easyui.css"
	rel="stylesheet" />
<script src="${ctxStatic}/jquery-easyui/1.4.2/jquery.easyui.min.js"
	type="text/javascript"></script>

</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/menu/">菜单列表</a></li>
		<li class="active"><a
			href="${ctx}/sys/menu/form?id=${menu.id}&parent.id=${menu.parent.id}">菜单<shiro:hasPermission
					name="sys:menu:edit">${not empty menu.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="sys:menu:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="menu"
		action="${ctx}/sys/menu/save" method="post">
		<form:hidden path="id" />
		<sys:message msgcontent="${message}" />
		<table class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2">上级菜单:</td>
					<td class="span3" style="text-align: left;"><sys:treeselect
							id="menu" name="parent.id" value="${menu.parent.id}"
							labelName="parent.name" labelValue="${menu.parent.name}"
							title="菜单" url="/sys/menu/treeData" extId="${menu.id}"
							cssClass="required" /></td>
				</tr>
				<tr>
					<td class="span2">名称:</td>
					<td class="span3" style="text-align: left;"><form:input
							path="name" htmlEscape="false" maxlength="50"
							class="required input-xlarge" /> <span class="help-inline"><font
							color="red">*</font> </span></td>
				</tr>
				<tr>
					<td class="span2">链接:</td>
					<td class="span3" style="text-align: left;"><form:input
							path="href" htmlEscape="false" maxlength="2000"
							class="input-xxlarge" /> <span class="help-inline">点击菜单跳转的页面</span></td>
				</tr>
				<tr>
					<td class="span2">目标:</td>
					<td class="span3" style="text-align: left;"><form:input
							path="target" htmlEscape="false" maxlength="10"
							class="input-small" /> <span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span></td>
				</tr>
				<tr>
					<td class="span2">图标:</td>
					<td class="span3" style="text-align: left;"><sys:iconselect
							id="icon" name="icon" value="${menu.icon}" /></td>
				</tr>
				<tr>
					<td class="span2">排序:</td>
					<td class="span3" style="text-align: left;"><form:input
							path="sort" htmlEscape="false" maxlength="50"
							class="required number input-small" /> <span class="help-inline">排列顺序，升序。</span></td>
				</tr>
				<tr>
					<td class="span2">可见:</td>
					<td class="span3" style="text-align: left;"><form:radiobuttons
							path="isShow" items="${fns:getDictList('show_hide')}"
							itemLabel="label" itemValue="value" htmlEscape="false"
							class="required" /> <span class="help-inline">该菜单或操作是否显示到系统菜单中</span></td>
				</tr>
				<tr>
					<td class="span2">权限标识:</td>
					<td class="span3" style="text-align: left;"><form:input
							path="permission" htmlEscape="false" maxlength="100"
							class="input-xxlarge" /> <span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span></td>
				</tr>
				<tr>
					<td class="span2">备注:</td>
					<td class="span3" style="text-align: left;"><form:textarea
							path="remark" htmlEscape="false" rows="3" maxlength="200"
							class="input-xxlarge" /></td>
				</tr>
				<tr>
					<td class="span2">可见站点</td>
					<td class="span3" style="text-align: left;"><input id="site" name="site"
						class="easyui-combobox" name="language" url="${ctx}/sys/site/getAllSiteByAjax"
						valueField="code" textField="name" multiple="true" editable="false"
						panelHeight="auto" value="${menu.site }"><span class="help-inline">只针对一级菜单</span></td>
				</tr>

				<tr>
					<td colspan="2"><shiro:hasPermission name="sys:menu:edit">
							<input id="btnSubmit" class="btn btn-primary" type="submit"
								value="保 存" />&nbsp;</shiro:hasPermission> <input id="btnCancel" class="btn"
						type="button" value="返 回" onclick="history.go(-1)" /></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>