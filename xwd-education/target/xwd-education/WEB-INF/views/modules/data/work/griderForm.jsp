<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>梁面管理</title>
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
		$(function() {
			$(".cs-detial1 tbody").find("tr:odd")
					.css("background-color", "#eff8ff");
			$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
			$("#bridgelabel").autocomplete({
				    source: function( request, response ) {
				        $.ajax({
				        	contentType:'application/x-www-form-urlencoded;charset=UTF-8',
				        	type:'post',
				            url: "${ctx}/data/work/bridge/getBridgeByAjax",
				            dataType: "json",
				            data:{
				                content: request.term
				            },
				            success: function( data ) {
				                response( $.map( data, function( item ) {
				                    return {
				                        label:item.bridgeName,
				                        bridgeId:item.id,		                        
				                    }
				                }));
				            }
				        });
				    },
				    minLength: 1,
				    select: function( event, ui ) {
				        $("#bridgeId").val(ui.item.bridgeId);
				        $("#bridgelabel").val(ui.item.label);
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
	    <li ><a href="${ctx}/data/work/grider?catalog=${grider.cat.id}">梁面列表</a></li>
		<li class="active"><a href="${ctx}/data/work/grider/form?catalog=${grider.cat.id}">梁面添加</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="grider"
		action="${ctx}/data/work/grider/save" method="post" enctype="multipart/form-data">
		<form:hidden path="id" />
		<form:hidden path="cat.id"/>
		<sys:message msgcontent="${message}" />
		<div class="cs-detial">
			<table class="table table-striped table-bordered table-hover">
				<tbody>
                    <tr>
                        <td class="span2" align="center">所属桥梁:</td>
						<td class="span3" align="left">
						
						<form:select path="bridge.id" class="input-middle" style="width:158px">
							<form:option value="" label="请选择"/>
							<form:options items="${listbri}" itemLabel="bridgeName" itemValue="id" htmlEscape="false" />
						</form:select>
						<font color="red">*</font>
						</td>
						<td class="span2" align="center">所属墩身:</td>
						<td class="span3" align="left" >
							<form:select path="pier.id" class="input-middle" style="width:158px">
								<form:option value="" label="请选择"/>
								<form:options items="${listPier}" itemLabel="pnumber" itemValue="id" htmlEscape="false" />
							</form:select>
						<font color="red">*</font></td>
					</tr>
					<tr>
					<!-- 
						<td class="span2" align="center">所属桥梁:</td>
						<td class="span3" align="left" >
						<form:input id="bridgeId" path="bridge.id" type="hidden"/>
						<input id="bridgelabel" type="text" value="${bridgename}"/>
						<font color="red">*</font></td>
					-->
					</tr>
					<tr>
						<td class="span2" align="center">梁面分类:</td>
						<td class="span3" align="left">
							<form:select path="dictype.id" style="width:158px">
								<form:options items="${fns:getDictList('biz_grider_type')}"
									itemLabel="label" itemValue="id" htmlEscape="false" />
							</form:select>
						</td>
						<td class="span2" align="center">设备编码:</td>
						<td class="span3" align="left"><form:input path="ecode" htmlEscape="false" maxlength="50" class="required"/>&nbsp;</td>
					</tr>
					<tr>
						<td class="span2" align="center">梁长:</td>
						<td class="span3" align="left">
							<form:input path="length" htmlEscape="false" maxlength="50" class="required" />
							&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">梁宽:</td>
						<td class="span3" align="left"><form:input path="width"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">缝宽:</td>
						<td class="span3" align="left"><form:input path="sildwidth"
								htmlEscape="false" maxlength="50" class="required" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">孔别:</td>
						<td class="span3" align="left"><form:input path="hole"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">梁标高:</td>
						<td class="span3" align="left"><form:input path="height"
								htmlEscape="false" maxlength="50" class="required" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">梁圬工方:</td>
						<td class="span3" align="left"><form:input path="loss"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left"><form:input path="startM"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">终点里程:</td>
						<td class="span3" align="left"><form:input path="endM"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>					    
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left"><form:input path="centerM"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">所属机构:</td>
						<td class="span3" align="left">
						<sys:treeselect id="office" name="offc.id" value="${offc.id}" labelName="offc.name" labelValue="${grider.offc.name}"
							title="机构" url="/sys/office/treeData" extId="${office.id}" cssClass="required"/>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">跨度:</td>
						<td class="span3" align="left"><form:input path="spans"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						  <td class="span2" align="center">换梁年代:</td>
						<td class="span3" align="left"><form:input path="changeYear"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">梁式样:</td>
						<td class="span3" align="left"><form:input path="pattern"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">梁式样代码:</td>
						<td class="span3" align="left"><form:input path="patternCode"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">梁底高:</td>
						<td class="span3" align="left"><form:input path="baseHeight"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">枕铺设年度:</td>
						<td class="span3" align="left"><form:input path="layYear"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						
						<td class="span2" align="center">定型图号:</td>
						<td class="span3" align="left"><form:input path="drawNo"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">设计限界:</td>
						<td class="span3" align="left"><form:input path="designLimits"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">梁种类:</td>
						<td class="span3" align="left"><form:input path="kinds"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">净孔:</td>
						<td class="span3" align="left"><form:input path="clearHole"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">梁重:</td>
						<td class="span3" align="left"><form:input path="weight"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">梁体积:</td>
						<td class="span3" align="left"><form:input path="volume"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">主梁中心距:</td>
						<td class="span3" align="left"><form:input path="maincenterSpace"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">纵梁中心距:</td>
						<td class="span3" align="left"><form:input path="ordinatecenterSpace"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
                       <td class="span2" align="center">设计活载:</td>
						<td class="span3" align="left"><form:input path="desliveload"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">纵梁高:</td>
						<td class="span3" align="left"><form:input path="ordinateHeight"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						
					</tr>
					<tr>
					    <td class="span2" align="center">控制部位:</td>
						<td class="span3" align="left"><form:input path="controlPostion"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">承载系数:</td>
						<td class="span3" align="left"><form:input path="carryCoefficient"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						
					</tr>
					<tr>
						<td class="span2" align="center">钢梁涂装年:</td>
						<td class="span3" align="left"><form:input path="paintingYear"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">挠度:</td>
						<td class="span3" align="left"><form:input path="bend"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">扣件类型:</td>
						<td class="span3" align="left"><form:input path="fastenerType"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">扣件数量:</td>
						<td class="span3" align="left"><form:input path="fastenerNum"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						
						<td class="span2" align="center">轨枕类型:</td>
						<td class="span3" align="left"><form:input path="plateType"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">轨枕数量:</td>
						<td class="span3" align="left"><form:input path="plateNum"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">钢轨类型:</td>
						<td class="span3" align="left"><form:input path="steelrailType"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">钢梁振幅超限加固:</td>
						<td class="span3" align="left"><form:input path="glzfcxjg"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">混凝土梁横隔板数:</td>
						<td class="span3" align="left"><form:input path="rcbulkNum"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">混凝土梁横隔板连接:</td>
						<td class="span3" align="left"><form:input path="rcbulkJoin"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">梁端限位装置:</td>
						<td class="span3" align="left"><form:input path="limitEq"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">混凝土并置梁加固:</td>
						<td class="span3" align="left"><form:input path="rcbzljg"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">道碴槽宽度:</td>
						<td class="span3" align="left"><form:input path="dzcwidth"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">圬工梁跨中道碴厚度:</td>
						<td class="span3" align="left"><form:input path="thickness"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
						
						<td class="span2" align="center">人行道材质:</td>
						<td class="span3" align="left"><form:input path="footwalkMaterial"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">人行道宽:</td>
						<td class="span3" align="left"><form:input path="footwalkWidth"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
					</tr>
					<tr>
					    
						<td class="span2" align="center">固定检查设备:</td>
						<td class="span3" align="left"><form:input path="fixcheckEq"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
						</td>
						<td class="span2" align="center">公铁两用:</td>
						<td class="span3" align="left" ><form:input path="gtly"
								htmlEscape="false" maxlength="50" class="required abc" />
								&nbsp;<font color="red">*</font>
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