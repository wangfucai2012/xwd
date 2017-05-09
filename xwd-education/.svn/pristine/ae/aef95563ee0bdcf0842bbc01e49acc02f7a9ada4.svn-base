<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
			$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
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
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/ledger/form?id=${ledger.id}&parent.id=${ledger.parent.id}">目录<shiro:hasPermission name="sys:ledger:edit">${not empty ledger.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:ledger:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="ledger" action="${ctx}/sys/ledger/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td class="span2" align="center">上级分类:</td>
						<td class="span3" align="left"><tags:treeselect id="ledger" name="parent.id" value="${ledger.parent.id}" labelName="parent.name" labelValue="${ledger.parent.name}"
					title="机构" url="/sys/ledger/treeData" extId="${ledger.id}" cssClass="required"/></td>
						<td class="span2" align="center">分类名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50"
								class="required" />&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">分类编码:</td>
						<td class="span3" align="left"><form:input path="code" htmlEscape="false" maxlength="200" /></td>
						<td class="span2" align="center">分类类型:</td>
						<td class="span3"  align="left"><form:select path="type">
								<form:options items="${fns:getDictList('sys_ledger_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select></td>
					</tr>
					<tr>						
						<td class="span2" align="center">分类级别:</td>
						<td class="span3"  align="left"><form:select path="grade">
								<form:options items="${fns:getDictList('sys_ledger_grade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select></td>
						<td class="span2" align="center">连接地址:</td>
						<td class="span3" align="left"><form:input path="url" htmlEscape="false" maxlength="50"
								/>&nbsp;</td>
					</tr>
					<tr>						
						<td class="span2" align="center">排序:</td>
						<td  class="span3" align="left"><form:input path="sort" htmlEscape="false" maxlength="50"
								/>&nbsp;</td>						
						<td class="span2" align="center">分类对象:</td>
						<td class="span3" align="left"><form:input path="remark" htmlEscape="false" maxlength="50"
								/>&nbsp;</td>
					</tr>
				</tbody>
				<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center">
							<shiro:hasPermission name="sys:ledger:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
							<div class="btn">
								<a href="javascript:history.go(-1);">返回</a>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>		
	</form:form>
</body>
</html>