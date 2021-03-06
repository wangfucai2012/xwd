<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
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
	<li><a href="${ctx}/sys/catalog?level=${level}">目录列表</a></li>
	<shiro:hasPermission name="sys:office:edit">
		<li  class="active">
			<a>
				<c:if test="${catalog.id!=null}">目录更新</c:if>
				<c:if test="${catalog.id==null}">目录添加</c:if>
			</a>
		</li>
	</shiro:hasPermission>
</ul>
<form:form id="inputForm" modelAttribute="catalog" action="${ctx}/sys/catalog/save" method="POST">
	<form:hidden name="id" path="id"/>
	<sys:message msgcontent="${message}"/>
	<div class="cs-detail">
		<table class="table table-striped table-bordered table-hover">
			<tbody>
			<tr>
				<td class="span2">上级分类:</td>
				<td class="span3" style="text-align: left;">
					<sys:treeselect id="parentsid" name="parents.id" value="${catalog.parents.id}" labelName="parents.id" labelValue="${catalog.parents.names}"
									title="公司" url="/sys/catalog/treeData?level=${level}" cssClass="required"/>
				</td>
			</tr>
			<tr>
				<td class="span2">分类名称:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="names" htmlEscape="false" maxlength="50" class="required userName"/>
				</td>
			</tr>
			<tr>
				<td class="span2">分类编码:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="code" htmlEscape="false" maxlength="50" class="required"/>
				</td>
			</tr>
			<tr>
				<td class="span2">分类类型:</td>
				<td class="span3" style="text-align: left;">
					<form:select path="types" class="required">
						<form:option value="" label="请选择"/>
						<form:options items="${fns:getDictList('dictType')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</td>
			</tr>
			<c:if test="${level!=null}">
				<input type="hidden" name="levels" value="${level}"  />
			</c:if>
			<c:if test="${level==null}">
				<tr>
					<td class="span2">分类级别:</td>
					<td class="span3" style="text-align: left;">
						<form:select path="levels" class="required">
							<form:option value="" label="请选择"/>
							<form:options items="${fns:getDictList('dictLevel')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
				</tr>
			</c:if>
			<tr>
				<td class="span2">连接地址:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="hrefs" htmlEscape="false" maxlength="50" class="required"/>
				</td>
			</tr>
			<tr>
				<td class="span2">排序:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="sort" htmlEscape="false" maxlength="50" class="required"/>
				</td>
			</tr>
			<tr>
				<td class="span2">分类对象:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="objects" htmlEscape="false" maxlength="50" class=""/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input id="subBtn" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</form:form>
</body>
</html>