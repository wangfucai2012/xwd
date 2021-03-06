<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default"/>
<title></title>

<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
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
		<li><a href="${ctx}/data/work/hangingfence?catalog=${hangingFence.cat.id}">吊围栏列表</a></li>
		<li class="active"><a href="${ctx}/data/work/hangingfence/form?catalog=${hangingFence.cat.id}">吊围栏添加</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="hangingFence"
		action="${ctx}/data/work/hangingfence/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<form:hidden path="cat.id"/>
		<sys:message msgcontent="${message}" />
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="#dddddd" class="table table-striped table-bordered table-hover">
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
						<td class="span3" align="left"><form:input path="lineName"
								htmlEscape="false" maxlength="50" class="required" /></td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left"><form:input path="stream"
								htmlEscape="false" maxlength="50" class="required" /><font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏起始里程 :</td>
						<td class="span3" align="left"><form:input path="startM"
								htmlEscape="false" maxlength="20" class="required abc" /><font color="red">*</font></td>
						<td class="span2" align="center">栅栏结束里程 :</td>
						<td class="span3" align="left"><form:input path="endM"
								htmlEscape="false" maxlength="20" class="required abc" /><font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏长度(m) :</td>
						<td class="span3" align="left"><form:input path="length"
								htmlEscape="false" maxlength="50" class="required abc" /><font color="red">*</font></td>
						<td class="span2" align="center">网片样式 :</td>
						<td class="span3" align="left"><form:input path="netstyle"
								htmlEscape="false" maxlength="50" class="required abc" /></td>
					</tr>
					<tr>
						<td class="span2" align="center">立柱样式 :</td>
						<td class="span3" align="left"><form:input path="lzstyle"
								htmlEscape="false" maxlength="50" class="required abc" /></td>
						<td class="span2" align="center">距外轨距离（米） :</td>
						<td class="span3" align="left"><form:input path="range"
								htmlEscape="false" maxlength="50" class="required" /><font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">埋设位置:</td>
						<td class="span3" align="left"><form:input path="inbuilt"
								htmlEscape="false" maxlength="50" class="required" /></td>
						<td class="span2" align="center">栅栏起讫桥墩 :</td>
						<td class="span3" align="left"><form:input path="startPier"
								htmlEscape="false" maxlength="50" class="required" /><font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏安设年度 :</td>
						<td class="span3" align="left"><form:input path="pierYear"
								htmlEscape="false" maxlength="50" class="required abc" /><font color="red">*</font></td>
						<td class="span2" align="center">栅栏门数量 :</td>
						<td class="span3" align="left"><form:input path="doorNum"
								htmlEscape="false" maxlength="50" class="required" /></td>
					</tr>
					<tr>
						<td class="span2" align="center">是否安设刺丝滚笼 :</td>
						<td class="span3" align="left"><form:input path="flag"
								htmlEscape="false" maxlength="50" class="required" /><font color="red">*</font></td>
						<td class="span2" align="center">侧别:</td>
						<td class="span3" align="left"><form:input path="side"
								htmlEscape="false" maxlength="50" class="required abc" /><font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">速度区段：</td>
						<td class="span3" align="left"><form:input path="speedArea"
								htmlEscape="false" maxlength="50" class="required" /></td>
						<td class="span2" align="center">附注:</td>
						<td class="span3" align="left"><form:input path="remark"
								htmlEscape="false" maxlength="50" class="required abc" /></td>
					</tr>

				</tbody>
				<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center"><input id="btnSubmit"
							class="btn btn-primary" type="submit" value="保 存" />&nbsp; <input
							id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" /></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form:form>
</body>
</html>