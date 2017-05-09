<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginName").focus();
			$("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}
				},
				messages: {
					loginName: {remote: "用户登录名已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
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
		<li><a href="${ctx}/sys/user/">用户列表</a></li>
		<li class="active"><a href="${ctx}/sys/user/form?id=${user.id}">用户<shiro:hasPermission name="sys:user:edit">${not empty user.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:user:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post">
		<form:hidden path="id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detail">
			<table class="table table-striped table-bordered table-hover">
			<tbody>
		<tr>
			<td class="span2">归属公司:</td>
			<td class="span3" style="text-align: left;">
                <sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
					title="公司" url="/sys/office/treeData?type=1" cssClass="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">归属部门:</td>
			<td class="span3" style="text-align: left;">
                <sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
					title="部门" url="/sys/office/treeData?type=2" cssClass="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">登录名:</td>
			<td class="span3" style="text-align: left;">
				<input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
				<form:input path="loginName" htmlEscape="false" maxlength="50" class="required userName"/>
			</td>
		</tr>
		<tr>
			<td class="span2">工号:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="no" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">姓名:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
			</td>
		</tr>
		<tr>
			<td class="span2">密码:</td>
			<td class="span3" style="text-align: left;">
				<input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="${empty user.id?'required':''}"/>
				<c:if test="${not empty user.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if>
			</td>
		</tr>
		<tr>
			<td class="span2">确认密码:</td>
			<td class="span3" style="text-align: left;">
				<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" equalTo="#newPassword"/>
			</td>
		</tr>
		<tr>
			<td class="span2">邮箱:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="email" htmlEscape="false" maxlength="100" class="email"/>
			</td>
		</tr>
		<tr>
			<td class="span2">电话:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="phone" htmlEscape="false" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="span2">手机:</td>
			<td class="span3" style="text-align: left;">
				<form:input path="mobile" htmlEscape="false" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td class="span2">备注:</td>
			<td class="span3" style="text-align: left;">
				<form:textarea path="remark" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</td>
		</tr>
		<tr>
			<td class="span2">用户类型:</td>
			<td class="span3" style="text-align: left;">
				<form:select path="userType">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('sys_user_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</td>
		</tr>
		<tr>
			<td class="span2">用户角色:</td>
			<td class="span3" style="text-align: left;">
				<select id="roleIdList" name="roleIdList">
					<option value="">请选择</option>
					<c:forEach items="${allRoles}" var="role"> <!--2016/07/08 Nemo 角色修改为单选 -->
						<option <c:if test="${user.roleList[0].id==role.id}"> selected </c:if> value="${role.id}">${role.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<c:if test="${not empty user.id}">
			<tr>
				<td class="span2">创建时间:</td>
				<td class="span3" style="text-align: left;">
					<fmt:formatDate value="${user.createDate}" type="both" dateStyle="full"/></td>
	
			</tr>
			<tr>
				<td class="span2">最后登陆:</td>
				<td class="span3" style="text-align: left;">
					IP: ${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.loginDate}" type="both" dateStyle="full"/>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2">
			<shiro:hasPermission name="sys:user:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</td>
		</tr>
		</tbody>
		</table>
		</div>
	</form:form>
</body>
</html>