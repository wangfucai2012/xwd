<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>电力所亭</title>
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
		<li><a href="${ctx}/inf/nk/electricbox/list/">组织列表</a></li>
		<li class="active"><a href="#">组织信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">维管段名称:</td>
					<td class="span3" align="left">${electricBox.sectionName}</td>
					
					<td class="span2" align="center">所亭名称:</td>
					<td class="span3" align="left">${electricBox.elecStationName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所属工区名称:</td>
					<td class="span3" align="left">${electricBox.departmentName}</td>
					
					<td class="span2" align="center">所亭编码:</td>
					<td class="span3" align="left">${electricBox.elecStationCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所类型编码:</td>
					<td class="span3" align="left">${electricBox.elecStationTypeCode}</td>
					
					<td class="span2" align="center">所亭类型:</td>
					<td class="span3" align="left">${electricBox.elecStationType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">NFC编码:</td>
					<td class="span3" align="left">${electricBox.nfcCode}</td>
					
					<td class="span2" align="center">所类型编码:</td>
					<td class="span3" align="left">${electricBox.elecStationTypeCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">维管段编码:</td>
					<td class="span3" align="left">${electricBox.sectionCode}</td>
					
					<td class="span2" align="center">工区编码:</td>
					<td class="span3" align="left">${electricBox.departmentCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">创建时间:</td>
					<td class="span3" align="left">${electricBox.createTime}</td>
					
					<td class="span2" align="center">最后修改日期:</td>
					<td class="span3" align="left">${electricBox.uploadTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">最后修改人姓名:</td>
					<td class="span3" align="left">${electricBox.rewriterName}</td>
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