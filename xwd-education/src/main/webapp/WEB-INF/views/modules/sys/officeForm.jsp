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
		<li><a href="${ctx}/sys/office/">机构列表</a></li>
		<li class="active"><a href="${ctx}/sys/office/form?id=${office.id}&parent.id=${office.parent.id}">机构<shiro:hasPermission name="sys:office:edit">${not empty office.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:office:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="office" action="${ctx}/sys/office/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td class="span2" align="center">上级机构:</td>
						<td class="span3" align="left"><sys:treeselect id="office" name="parent.id" value="${office.parent.id}" labelName="parent.name" labelValue="${office.parent.name}"
					title="机构" url="/sys/office/treeData" extId="${office.id}" cssClass="required"/></td>
						<td class="span2" align="center">机构名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50"
								class="required" />&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">机构编码:</td>
						<td class="span3" align="left"><form:input path="code" htmlEscape="false" maxlength="200" /></td>
						<td class="span2" align="center">机构类型:</td>
						<td class="span3"  align="left"><form:select path="type">
								<form:options items="${fns:getDictList('sys_office_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select></td>
					</tr>
					<tr>						
						<td class="span2" align="center">机构级别:</td>
						<td class="span3"  align="left"><form:select path="grade">
								<form:options items="${fns:getDictList('sys_office_grade')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select></td>
						<td class="span2" align="center">联系地址:</td>
						<td class="span3" align="left"><form:input path="address" htmlEscape="false" maxlength="50"
					class="" /></td>
					</tr>
					<tr>	
						<td class="span2" align="center">邮政编码:</td>
						<td class="span3" align="left"><form:input path="zipCode" htmlEscape="false" maxlength="50"/></td>
						<td class="span2" align="center">负&nbsp;&nbsp;责&nbsp;&nbsp;人:</td>
						<td class="span3" align="left"><form:input path="master" htmlEscape="false" maxlength="100" /></td>
					</tr>
					<tr>	
						<td class="span2" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
						<td class="span3" align="left"><form:input path="phone" htmlEscape="false" maxlength="50"/></td>
						<td class="span2" align="center">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真:</td>
						<td class="span3" align="left"><form:input path="fax" htmlEscape="false" maxlength="100" /></td>
					</tr>
					<tr>	
						<td class="span2" align="center">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
						<td class="span3" align="left"><form:input path="email" htmlEscape="false" maxlength="50" class="email"/></td>
						<td class="span2" align="center">优&nbsp;&nbsp;先&nbsp;&nbsp;级:</td>
						<td class="span3" align="left"><form:input path="sort" htmlEscape="false" maxlength="100" /></td>
					</tr>

					<!-- Add by Nemo on 2016/06/14  -->
					<tr>
						<td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left"><form:input path="startM" htmlEscape="false" maxlength="200" /></td>
						<td class="span2" align="center">结束里程:</td>
						<td class="span3" align="left"><form:input path="endM" htmlEscape="false" maxlength="200" /></td>
					</tr>
                   <tr>
			            <td class="span2" align="center">所属专业:</td>
			            <td class="span3" style="text-align: left;">
				           <form:select path="profession">
					        <form:option value="ALL">所有专业</form:option>
					        <form:option value="GD" >供电</form:option>
					        <form:option value="GW" >工务</form:option>
				        	<form:option value="TX" >通信</form:option>
					        <form:option value="XH" >信号</form:option>
					        <form:option value="FJ" >房建</form:option>
					        <form:option value="GPS" >给排水</form:option>
					        <form:option value="LF" >旅服</form:option>
					        <form:option value="TD" >土地</form:option>
				          </form:select>
				         <span class="help-inline"></span>
			           </td>
			           <td class="span2" align="center"></td>
						<td class="span3" align="left"></td>
		</tr>
				</tbody>
				<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center">
							<shiro:hasPermission name="sys:office:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
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