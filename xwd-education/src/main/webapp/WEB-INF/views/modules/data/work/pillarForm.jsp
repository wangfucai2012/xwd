<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>支柱管理</title>
<meta name="decorator" content="default"/>
	<script type="text/javascript">
	$(function(){ 
		$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
		$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
	}); 
	</script>
</head>
<body>
<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/work/pillar?catalog=${pillar.cat.id}">支柱列表</a></li>
		<li class="active"><a href="${ctx}/data/work/pillar/form?catalog=${pillar.cat.id}">支柱添加</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="pillar" action="${ctx}/data/work/pillar/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="cat.id"/>
		<tags:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd" class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td class="span2" align="center">线名:</td>
						<td class="span3" align="left"><form:input path="lineName" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>  
						<td class="span2" align="center">所属固资卡片:</td>
						<td class="span3" align="left">
						<form:select path="ass.id" class="input-middle">
						<form:option value="" label="请选择"/>
								<form:options items="${listorg}" itemLabel="name"  itemValue="id"
									htmlEscape="false" />
							</form:select>
						<font color="red">*</font></td>
					</tr>
					<tr>
					    <td class="span2" align="center">名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
						<td class="span2" align="center">所属区间:</td>
						<td class="span3" align="left"><form:select path="elecarea.id" class="input-middle">
						<form:option value="" label="请选择"/>
								<form:options items="${arealist}" itemLabel="name"  itemValue="id"
									htmlEscape="false" />
							</form:select>
						<font color="red">*</font></td>
					</tr>
					<tr>
					    <td class="span2" align="center">设备编码:</td>
						<td class="span3" align="left"><form:input path="code" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left"><form:input path="stream" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>  
					    
					</tr>
					<tr>
					     <td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left"><form:input path="centerMile" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					     <td class="span2" align="center">供电区段:</td>
					     <td class="span3" align="left"><form:input path="eleSection" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
					</tr>
				</tbody>
				<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center">
							
									<input id="btnSubmit" class="btn btn-primary" type="submit"
										value="保 存" />&nbsp;
							<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>		
	</form:form>
</body>
</html>