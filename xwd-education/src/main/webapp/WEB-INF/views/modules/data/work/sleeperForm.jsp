<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>轨枕管理</title>
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
	<script type="text/javascript">
        //删除附件
        function delAttach(id,type) {
            if (window.confirm("您确定要删除附件吗?")) {
                if (type == 1) {
                    var it = ',' + $('#imgAttachments').val();
                    it = subIds(it,id);
                    $('#imgAttachments').val(it);
                } else if (type == 2) {
                    var it = ',' + $('#attachments').val();
                    it = subIds(it,id);
                    $('#attachments').val(it);
                } else if (type == 3) {
					var it = ',' + $('#docAttchments').val();
					it = subIds(it,id);
					$('#docAttchments').val(it);
				} else if (type == 3) {
					var it = ',' + $('#technologyAttchments').val();
					it = subIds(it,id);
					$('#technologyAttchments').val(it);
				}
                //需要删除的附件ID
                $('#delAttch').val($('#delAttch').val() + id + ',');
                $("#id_" + id).remove();
            }
            return false;
        }
        //截取字符串
        function subIds(it,id){
            it = it.replace(',' + id + ',', '');
            if (it.lastIndexOf(',') != it.length - 1) {
                it += ',';
            }
            if (it.indexOf(',') == 0) {
                it = it.substr(1);
            }
            return it;
        }
    </script>    
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/work/sleeper?catalog=${sleeper.cat.id}">轨枕列表</a></li>
		<li class="active"><a href="${ctx}/data/work/sleeper/form?catalog=${sleeper.cat.id}">轨枕添加</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="sleeper"
		action="${ctx}/data/work/sleeper/save" method="post"
		enctype="multipart/form-data" class="form-horizontal">
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
			                 <form:select path="ass.id" class="required" style="width:150px" >
		                        <form:option value="" label="请选择"/>
		                        <form:options items="${fns:getAssetCardList(sleeper.cat.id)}" itemLabel="name" itemValue="id" htmlEscape="false"/>
		                    </form:select>
							<font color="red">*</font>
						</td>
						<td class="span2" align="center">设备编码:</td>
						<td class="span3" align="left"><form:input path="ecode" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left"><form:input path="stream"
								htmlEscape="false" maxlength="50" class="required" />&nbsp;</td>
						<td class="span2" align="center">线路类型:</td>
						<td class="span3" align="left"><form:input path="lineType"
								htmlEscape="false" maxlength="50" class="required" />&nbsp;<font color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">轨枕类型:</td>
						<td class="span3" align="left"><form:input path="gaugeType"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;<font
							color="red">*</font></td>
						<td class="span2" align="center">运营状态:</td>
						<td class="span3" align="left"><form:input path="runState"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left"><form:input path="startM"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;<font
							color="red">*</font></td>
						<td class="span2" align="center">终止里程:</td>
						<td class="span3" align="left"><form:input path="endM"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">长链标记:</td>
						<td class="span3" align="left"><form:input path="chainMarker"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;<font
							color="red">*</font></td>
						<td class="span2" align="center">轨枕编号:</td>
						<td class="span3" align="left"><form:input path="railType"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;<font
							color="red">*</font></td>
					</tr>
					<tr>
						<td class="span2" align="center">生产厂商:</td>
						<td class="span3" align="left"><form:input path="maker"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
						<td class="span2" align="center">制造年度:</td>
						<td class="span3" align="left"><form:input path="makerYear"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
					</tr>
					<tr>
						
						<td class="span2" align="center">铺设根数:</td>
						<td class="span3" align="left"><form:input path="plateNum"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
						<td class="span2" align="center">铺设长度:</td>
						<td class="span3" align="left"><form:input path="slopeL"
								htmlEscape="false" maxlength="50" class="required abc" />&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">所属机构:</td>
						<td class="span3" align="left">
						<sys:treeselect id="office" name="offc.id" value="${offc.id}" labelName="offc.name" labelValue="${sleeper.offc.name}"
							title="机构" url="/sys/office/treeData" extId="${office.id}" cssClass="required"/>
						</td>
					</tr>
					<tr>
                        <td class="span2">图片资料:</td>
                        <td colspan="3" align="left">
                            <input type="hidden" name="delAttch" id="delAttch" />
                            <input class="multi" type="file" name="pierfile" size="60" />
                            <font color="red">上传附件小于10M</font>
                            <br />
                            <textarea name="imgAttsRemark"></textarea>
                            <br />
                            <form:hidden path="imgAttachments" />
                            <c:choose>
                                <c:when test="${not empty imgAtts}">
                                    <c:forEach items="${imgAtts}" var="attach">
                                                <span id="id_${attach.id}">
                                                    <a href="#" onclick="return delAttach('${attach.id}',1);">删除</a>&nbsp;&nbsp;
                                                    <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a>
                                                    <span>${attach.remark}</span>
                                                    <br />
                                                </span>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="span2">图纸资料:</td>
                        <td colspan="3" align="left">
                            <input class="multi" type="file" name="pierfile2" size="60" />
                            <font color="red">上传附件小于10M</font>
                            <br />
                            <textarea name="attsRemark"></textarea>
                            <br />
                            <form:hidden path="attachments" />
                            <c:choose>
                                <c:when test="${not empty atts}">
                                    <c:forEach items="${atts}" var="attach">
                                                <span id="id_${attach.id}">
                                                    <a href="#" onclick="return delAttach('${attach.id}',2);">删除</a>&nbsp;&nbsp;
                                                    <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a>
                                                    <span>${attach.remark}</span>
                                                    <br />
                                                </span>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="span2">说明文档:</td>
                        <td colspan="3" align="left">
                            <input class="multi" type="file" name="pierfile3" size="60" />
                            <font color="red">上传附件小于10M</font>
                            <br />
                            <textarea name="docAttsRemark"></textarea>
                            <br />
                            <form:hidden path="docAttchments" />
                            <c:choose>
                                <c:when test="${not empty docAtts}">
                                    <c:forEach items="${docAtts}" var="attach">
                                                <span id="id_${attach.id}">
                                                    <a href="#" onclick="return delAttach('${attach.id}',3);">删除</a>&nbsp;&nbsp;
                                                    <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a>
                                                    <span>${attach.remark}</span>
                                                    <br />
                                                </span>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td class="span2">技术规范:</td>
                        <td colspan="3" align="left">
                            <input class="multi" type="file" name="pierfile4" size="60" />
                            <font color="red">上传附件小于10M</font>
                            <br />
                            <textarea name="technologyRemark"></textarea>
                            <br />
                            <form:hidden path="technologyAttchments" />
                            <c:choose>
                                <c:when test="${not empty technologyAtts}">
                                    <c:forEach items="${technologyAtts}" var="attach">
                                                <span id="id_${attach.id}">
                                                    <a href="#" onclick="return delAttach('${attach.id}',4);">删除</a>&nbsp;&nbsp;
                                                    <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a>
                                                    <span>${attach.remark}</span>
                                                    <br />
                                                </span>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </td>
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