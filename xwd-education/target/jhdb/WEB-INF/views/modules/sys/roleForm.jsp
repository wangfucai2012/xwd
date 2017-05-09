<%@ page import="com.ict.web.commons.utils.JsonUtil" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#name").focus();
			$("#inputForm").validate({
				rules: {
					name: {remote: "${ctx}/sys/role/checkName?oldName=" + encodeURIComponent("${role.name}")}
				},
				messages: {
					name: {remote: "角色名已存在"}
				},
				submitHandler: function(form){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);
					var ids2 = [], nodes2 = tree2.getCheckedNodes(true);
					for(var i=0; i<nodes2.length; i++) {
						ids2.push(nodes2[i].id);
					}
					$("#officeIds").val(ids2);
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

			var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
				data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
					tree.checkNode(node, !node.checked, true, true);
					return false;
				}}};

			// 用户-菜单
			var zNodes=[
					<c:forEach items="${menuList}" var="menu">{id:${menu.id}, pId:${not empty menu.parent.id?menu.parent.id:0}, name:"${not empty menu.parent.id?menu.name:'权限列表'}"},
				</c:forEach>];
			// 初始化树结构
			var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			// 默认选择节点
			var ids = "${role.menuIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点 //否
			tree.expandAll(false);

			//Change by Nemo on 2016/07/11 , 联动机构
			var mVal = $('#profession').val();
			loadOffice(mVal);

			$("#dataScope").change(function(){
				refreshOfficeTree();
			});
		});
		function refreshOfficeTree(){
			if($("#dataScope").val()==9){
				$("#officeTree").show();
			}else{
				$("#officeTree").hide();
			}
		}
		/**
		 * Add by Nemo on 2016/07/11
		 * 改变专业
		 */
		function changeProfession(obj){
			var selectedVal = $(obj).val();

			//联动机构
			loadOffice(selectedVal);

			$('#catalogLs input').each(function (index,item){
				if(selectedVal=='ALL'){
					$(item).attr('checked',true);
					$(item).attr('readOnly',true);
				}else{
					$(item).attr('checked',false);
					$(item).attr('readOnly',false);
				}
			});

			$('#'+selectedVal).attr('checked',true);
			$('#'+selectedVal).attr('readOnly',true);
		}

		// Add by Nemo on 2016/07/11
		//初始化参数参数
		var officeList = [
			<c:forEach items="${officeList}" var="office">
			{
				id:${office.id},
				pId:${not empty office.parent?office.parent.id:0},
				name:"${office.name}",
				profession:"${office.profession}"
			},
			</c:forEach>
		];

		/**
		 * Add by Nemo on 2016/07/11
		 * 加载机构数据
		 * @param mVal
		 */
		function loadOffice(mVal){

			//默认加载全部，如果为空
			if(mVal == null || mVal == ''){
				mVal = 'ALL';
			}

			var mTree = [];
			if(mVal=='ALL'){//全部
				mTree = officeList;
			}else {//加载需要加载的部分
				for (var i = 0; i < officeList.length; i++) {
					var item = officeList[i];
					if (item.profession == mVal) { //判断节点
						mTree.push(item);
					}
				}
			}

			//清空原有数据
			if(mTree.length==0){
				$('#officeTree').html('没有找到任何的机构数据哦。');
				return false;
			}else{
				$('#officeTree').html('');
			}

			//添加设置
			var setting = {
				check:{enable:true,nocheckInherit:true},
				view:{selectedMulti:false},
				data:{simpleData:{enable:true}},
				callback:{beforeClick:function(id, node){
					tree.checkNode(node, !node.checked, true, true);
					return false;
				}
				}
			};

			// 初始化树结构
			var tree2 = $.fn.zTree.init($("#officeTree"), setting, mTree);

			// 不选择父节点
			tree2.setting.check.chkboxType = { "Y" : "s", "N" : "s" };
			// 默认选择节点
			var ids2 = "${role.officeIds}".split(",");
			for(var i=0; i<ids2.length; i++) {
				var node = tree2.getNodeByParam("id", ids2[i]);
				try{tree2.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点 //否
			tree2.expandAll(false);
			// 刷新（显示/隐藏）机构
			refreshOfficeTree();
		}

	</script>
</head>
<body>
<ul class="nav nav-tabs">
	<li><a href="${ctx}/sys/role/">角色列表</a></li>
	<li class="active"><a href="${ctx}/sys/role/form?id=${role.id}">角色<shiro:hasPermission name="sys:role:edit">${not empty role.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:role:edit">查看</shiro:lacksPermission></a></li>
</ul>
<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/role/save" method="post">
	<form:hidden path="id"/>
	<sys:message msgcontent="${message}"/>
	<div class="cs-detail">
		<table class="table table-striped table-bordered table-hover">
			<tbody>
			<tr>
				<td class="span2">角色名称:</td>
				<td class="span3" style="text-align: left;">
					<input id="oldName" name="oldName" type="hidden" value="${role.name}">
					<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
				</td>
			</tr>
			<tr>
				<td class="span2">英文名称:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="enname" htmlEscape="false" maxlength="50" class="required"/>
					<span class="help-inline">工作流用户组ID</span>
				</td>
			</tr>
			<tr>
				<td class="span2">角色类型:</td>
				<td class="span3" style="text-align: left;">
					<form:input path="roleType" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline" title="activiti有3种预定义的组类型：security-role、assignment、user 如果使用Activiti Explorer，需要security-role才能看到manage页签，需要assignment才能claim任务">
					工作流组用户组类型（security-role：管理员、assignment：可进行任务分配、user：普通用户）</span>
				</td>
			</tr>

			<!--Add by nemo on 2016/07/06-->
			<tr>
				<td class="span2">所属专业:</td>
				<td class="span3" style="text-align: left;">
					<form:select path="profession" onchange="changeProfession(this)" >
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
			</tr>

			<tr class="hide"><!--Hide by Nemo on 2016/07/11-->
				<td class="span2">数据范围:</td>
				<td class="span3" style="text-align: left;">
					<form:select path="dataScope" disabled="true">
						<form:options items="${fns:getDictList('sys_data_scope')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
					<span class="help-inline">特殊情况下，设置为“按明细设置”，可进行跨机构授权</span>
				</td>
			</tr>

			<tr>
				<td class="span2">角色授权:</td>
				<td class="span3" style="text-align: left;">

					<div id="catalogLs" style="border-bottom: 1px solid #cccccc;padding-bottom: 3px;">
						地图权限：
						<input id="GD" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:gongdian')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:gongdian" />供电&nbsp;&nbsp;
						<input id="GW" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:gongwu')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:gongwu" />工务&nbsp;&nbsp;
						<input id="TX" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:tongxin')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:tongxin" />通信&nbsp;&nbsp;
						<input id="XH" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:xinhao')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:xinhao" />信号&nbsp;&nbsp;
						<input id="FJ" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:fangjian')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:fangjian" />房建&nbsp;&nbsp;
						<input id="GPS" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:jipaishui')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:jipaishui" />给排水&nbsp;&nbsp;
						<input id="LF" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:lvfu')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:lvfu" />旅服&nbsp;&nbsp;
						<input id="TD" <c:if test="${role!=null && role.catalogList!=null && role.catalogList.indexOf('catalog:tudi')!=-1}"> checked </c:if> type="checkbox" name="catalogLs" value="catalog:tudi" />土地&nbsp;&nbsp;
					</div>

					<div style="margin-top:3px;float:left;">
						菜单权限：
						<div  id="menuTree" class="ztree" ></div>
						<form:hidden path="menuIds"/>
					</div>
					<div style="margin-left:100px;margin-top:3px;float:left;border-left: 1px solid #cccccc;">
						机构权限：
						<div id="officeTree" class="ztree" ></div>
						<form:hidden path="officeIds"/>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<shiro:hasPermission name="sys:role:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</form:form>
</body>
</html>