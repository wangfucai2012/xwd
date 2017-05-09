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
    <li><a href="${ctx}/device/electricity/baseDevice/powerSupplySection/">供电区间</a></li>
    <li  class="active"><a href="${ctx}/device/electricity/baseDevice/powerSupplySection/form">区间添加</a></li>
</ul>

<form:form id="inputForm" modelAttribute="powerSupplySection" action="${ctx}/device/electricity/baseDevice/powerSupplySection/save" method="post" enctype="multipart/form-data" >
    <form:hidden path="id"/>
    <sys:message msgcontent="${message}"/>
    <div class="cs-detail">
        <table class="table table-striped table-bordered table-hover">
            <tbody>
            <tr>
                <td class="span2">名称:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="name" htmlEscape="false" maxlength="50" class="required userName"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属网电工区:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="nea.id" id="nea.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getNetElectricalAreaList()}" itemLabel="name" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">所属部门:</td>
                <td class="span3" style="text-align: left;">
                    <sys:treeselect id="officeName" name="officeName.id" value="${entity.officeName.id}" labelName="officeName.name" labelValue="${entity.officeName.name}"
                                    title="部门" url="/sys/office/treeData?type=2" cssClass="required"/>
                </td>
            </tr>
            <tr>
                <td class="span2">所属变电所:</td>
                <td class="span3" style="text-align: left;">
                    <form:select path="substation.id" id="substation.id" class="required">
                        <form:option value="" label="请选择"/>
                        <form:options items="${fns:getSubstationList()}" itemLabel="lineName" itemValue="id" htmlEscape="false"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td class="span2">起始里程:</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="startM" htmlEscape="false" maxlength="50" class="required number"/>
                </td>
            </tr>
            <tr>
                <td class="span2">结束里程：</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="endM" htmlEscape="false" maxlength="50" class="required number"/>
                </td>
            </tr>
            <tr>
                <td class="span2">运营里程</td>
                <td class="span3" style="text-align: left;">
                    <form:input path="length" htmlEscape="false" maxlength="50" class="required number"/>
                </td>
            </tr>
            <tr>
                <td class="span2">图片资料:</td>
                <td colspan="3" align="left">
                    <input type="hidden" name="delAttch" id="delAttch" />
                    <input class="multi" type="file" name="pierfile" size="60" /> <font color="red">上传附件小于10M</font><br />
                    <form:hidden path="imgAttachments" />
                    <c:choose>
                        <c:when test="${not empty imgAtts}">
                            <c:forEach items="${imgAtts}" var="attach">
										<span id="id_${attach.id}">
                                            <a href="#" onclick="return delAttach('${attach.id}',1);">删除</a>&nbsp;&nbsp;
                                            <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a><br />
										</span>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td class="span2">图纸资料:</td>
                <td colspan="3" align="left">
                    <input class="multi" type="file" name="pierfile2" size="60" typ /> <font color="red">上传附件小于10M</font><br />
                    <form:hidden path="attachments" />
                    <c:choose>
                        <c:when test="${not empty atts}">
                            <c:forEach items="${atts}" var="attach">
										<span id="id_${attach.id}">
                                            <a href="#" onclick="return delAttach('${attach.id}',2);">删除</a>&nbsp;&nbsp;
                                            <a href="${ctx}/sys/attachment/download?id=${attach.id}">${attach.fileName}</a><br />
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