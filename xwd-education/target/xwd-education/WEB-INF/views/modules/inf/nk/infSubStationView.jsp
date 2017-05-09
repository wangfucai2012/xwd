<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>变电所</title>
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
		<li><a href="${ctx}/inf/nk/infsubstation/list/">变电所列表</a></li>
		<li class="active"><a href="#">变电所信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">所亭名:</td>
					<td class="span3" align="left">${infSubStation.stationName}</td>
					<td class="span2" align="center">所亭编码:</td>
					<td class="span3" align="left">${infSubStation.stationCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">NFC编码:</td>
					<td class="span3" align="left">${infSubStation.nfcCode}</td>
					<td class="span2" align="center">所亭类型:</td>
					<td class="span3" align="left">${infSubStation.stationType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所属工区名称:</td>
					<td class="span3" align="left">${infSubStation.departmentName}</td>
					<td class="span2" align="center">维管段名称:</td>
					<td class="span3" align="left">${infSubStation.sectionName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">创建时间:</td>
					<td class="span3" align="left">${infSubStation.createTime}</td>
					<td class="span2" align="center">最后修改人姓名:</td>
					<td class="span3" align="left">${infSubStation.rewriterName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">最后修改日期:</td>
					<td class="span3" align="left">${infSubStation.uploadTime}</td>
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