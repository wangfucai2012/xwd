<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-24
  Time: 下午2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>管理系统</title>
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
    <li><a href="${ctx}/device/electricity/cne/contactWire?catalog=${catalog}">接触导线</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/cne/contactWire/form?catalog=${catalog}">导线添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="contactWire" action="${ctx}/device/electricity/cne/contactWire/save?catalog=${catalog}" method="post" enctype="multipart/form-data">
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <input type="hidden" name="catalog" value="${catalog}">
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">线名:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属固资卡片:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="assetCard.id" class="required" style="width:158px">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getAssetCardList(catalog)}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属区间:</td>
                <td class="span3" style="text-align: left;">
                   <form:select path="powerSupplySection.id" class="required" style="width:158px">
                       <form:option value="" label="请选择" />
                       <form:options items="${fns:getPowerSupplySectionList()}" itemLabel="name" itemValue="id" htmlEscape="false"  />
                   </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属锚段:</td>
                <td class="span3">
                    <form:select path="anchor.id" class="required" style="width:158px">
                        <form:option value="" label="请选择" />
                        <form:options items="${fns:getAnchorList()}" itemLabel="name" itemValue="id" htmlEscape="false"  />
                    </form:select>
                </td>
            </tr>
            <tr>
          		<td class="span2">所属机构:</td>
				<td class="span3">
				<sys:treeselect id="office" name="offc.id" value="${offc.id}" labelName="offc.name" labelValue="${portalStructure.offc.name}"
					title="机构" url="/sys/office/treeData" extId="${office.id}" cssClass="required"/>
				</td>
            </tr>
            <tr>
                <td class="span2">长度:</td>
                <td class="span3">
                    <form:input path="length" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">直径:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="diameter" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">起始里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="startMile" htmlEscape="false" maxlength="50" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">终止里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="endMile" htmlEscape="false" maxlength="100" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">接触悬挂编号:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="contactNo" htmlEscape="false" maxlength="100" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">接触线L值:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="contactL" htmlEscape="false" maxlength="100" class="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">基础网杆:</td>
                <td class="span3">
	                <form:select path="basicnetbarList" multiple="true" class="required" style="width:158px">
	                    <form:options items="${barList}" itemLabel="ecode" itemValue="id" />
	                </form:select>       
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