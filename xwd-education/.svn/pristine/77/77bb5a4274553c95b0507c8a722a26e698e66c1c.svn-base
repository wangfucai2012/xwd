<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织结构和区间关联表</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">.table td i{margin:0 2px;}</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
			$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
		});
	</script>
</head>

<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/inf/nk/reforginfsection/list/">组织结构和区间关联表列表</a></li>
		<li class="active"><a href="#">组织结构和区间关联表信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">部门ID:</td>
					<td class="span3" align="left">${refOrginfSection.idDepartment}</td>
					
					<td class="span2" align="center">区间ID:</td>
					<td class="span3" align="left">${refOrginfSection.idBlock}</td>
				</tr>
				<tr>
					<td class="span2" align="center">创建时间:</td>
					<td class="span3" align="left">${refOrginfSection.createTime}</td>
					
					<td class="span2" align="center">最后修改时间:</td>
					<td class="span3" align="left">${refOrginfSection.modifyTime}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr bgcolor="#ffffff">
					<td colspan="4" align="center">
						<div class="go-back">
							<a href="javascript:history.go(-1);">返回</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>