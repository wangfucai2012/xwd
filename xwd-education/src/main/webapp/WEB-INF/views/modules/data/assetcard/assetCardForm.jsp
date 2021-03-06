<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>固资卡片管理</title>
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
		<li><a href="${ctx}/data/assetCard/list?catalog=${assetCard.cat.id}">固资列表</a></li>
		<li class="active"><a href="${ctx}/data/assetCard/form?catalog=${assetCard.cat.id}">固资添加</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="assetCard" action="${ctx}/data/assetCard/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="cat.id"/>
		<tags:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd" class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td class="span3" align="center">名称:</td>
						<td class="span3" align="left"><form:input path="name" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left"><form:input path="assetCode" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left"><form:input path="cardCode" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left"><form:input path="unit" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;</td>						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left"><form:input path="assetNum" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left"><form:input path="specification" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left"><form:input path="certificateNo" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left"><form:input path="orgAssetValue" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>						
						<td class="span3" align="center">初试安装费:</td>
						<td class="span3" align="left"><form:input path="orgFabricateValue" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left"><form:input path="reValue" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>						
						<td class="span3" align="center">重估安装费:</td>
						<td class="span3" align="left"><form:input path="reFabricate" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">重估建设单位:</td>
						<td class="span3" align="left"><form:input path="constructCompany" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;</td>						
						<td class="span3" align="center">建造日期</td>
						<td class="span3" align="left"><input
					type="text" id="constructDate" name="constructDate" size="30"
					value="${assetCard.constructDate}" class="Wdate" onClick="WdatePicker();" />&nbsp;&nbsp;</td>					
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left"><form:input path="constructNo" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;</td>
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left"><input
					type="text" id="deliveryDate" name="deliveryDate" size="30"
					value="${assetCard.deliveryDate}" class="Wdate" onClick="WdatePicker();" />&nbsp;&nbsp;</td>
					<!--  
						<form:input path="deliveryDate" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>-->
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left"><form:input path="expectUsingTime" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left"><form:input path="expectsalvage" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left"><form:input path="usingState" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left"><form:input path="depreciation" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left"><input
					type="text" id="startDate" name="startDate" size="30"
					value="${assetCard.startDate}" class="Wdate" onClick="WdatePicker();" />&nbsp;&nbsp;<font
					color="red">*</font></td>
					</tr>
					<tr>
						<td class="span3" align="center">材质:</td>
						<td class="span3" align="left"><form:input path="material" htmlEscape="false" maxlength="50" class="required"/>
						&nbsp;<font color="red">*</font></td>
						<td class="span3" align="center">备注:</td>
						<td class="span3" align="left" ><form:textarea path="introduction" cols="20"  row="10" 
						        htmlEscape="false" maxlength="50" class="required"/></td>
						
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