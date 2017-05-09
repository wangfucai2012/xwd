<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>铁跨公立交桥限高防护架</title>
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
		<li><a href="${ctx}/data/work/bridgehelimitproframe?catalog=${bridgeHeLimitProFrame.cat.id}">防护架列表</a></li>
		<li class="active"><a href="${ctx}/data/work/bridgehelimitproframe/form?catalog=${bridgeHeLimitProFrame.cat.id}">防护架添加</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="bridgeHeLimitProFrame" action="${ctx}/data/work/bridgehelimitproframe/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="cat.id"/>
		<sys:message msgcontent="${message}"/>
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd"  class="table table-striped table-bordered table-hover"> 
				<tbody>
				<tr>
						<td class="span2" align="center">所属固资卡片:</td>
						<td class="span3" align="left">
						<form:select path="ass.id" class="input-middle" style="width:158px">
						<form:option value="" label="请选择"/>
								<form:options items="${listorg}" itemLabel="name"  itemValue="id"
									htmlEscape="false" />
							</form:select>
						<font color="red">*</font></td>
						<td class="span2" align="center">设备编码:</td>
						<td class="span3" align="left"><form:input path="ecode" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">线名:</td>
						<td class="span3" align="left"><form:input path="lineName" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left"><form:input path="stream" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left"><form:input path="centerM" htmlEscape="false" maxlength="50" class="required abc"/>&nbsp;<font color="red">*</font></td>
						<td class="span2" align="center">桥涵式样:</td>
						<td class="span3"  align="left"><form:input path="bridgeType" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">限制高度:</td>
						<td class="span3"  align="left"><form:input path="limitHeight" htmlEscape="false" maxlength="50" class="required"/>&nbsp;<font color="red">*</font></td>
					 	<td class="span2" align="center">尺寸:</td>
						<td class="span3" align="left"><form:input path="bhlpfSize" htmlEscape="false" maxlength="50" class="required abc"/>&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
					    <td class="span2" align="center">道路等级:</td>
						<td class="span3"  align="left"><form:input path="roadLevel" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
						 <td class="span2" align="center">型式:</td>
						<td class="span3" align="left"><form:input path="ptype" htmlEscape="false" maxlength="50" class="required abc"/>&nbsp;<font color="red">*</font></td>
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