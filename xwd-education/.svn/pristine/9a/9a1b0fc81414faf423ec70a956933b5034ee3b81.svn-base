<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>电力设备</title>
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
		<li><a href="${ctx}/inf/nk/electriceq/list/">组织列表</a></li>
		<li class="active"><a href="#">组织信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">所类型:</td>
					<td class="span3" align="left">${electricEq.elecStationType}</td>
					<td class="span2" align="center">所类型编码:</td>
					<td class="span3" align="left">${electricEq.elecStationTypeCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所名称:</td>
					<td class="span3" align="left">${electricEq.elecStationName}</td>
					<td class="span2" align="center">所编码:</td>
					<td class="span3" align="left">${electricEq.elecStationCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设备编码:</td>
					<td class="span3" align="left">${electricEq.equipCode}</td>
					<td class="span2" align="center">设备类型编码:</td>
					<td class="span3" align="left">${electricEq.equipType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设备类型名称:</td>
					<td class="span3" align="left">${electricEq.equipName}</td>
					<td class="span2" align="center">NFC编码:</td>
					<td class="span3" align="left">${electricEq.nfcCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">运行编号:</td>
					<td class="span3" align="left">${electricEq.runCode}</td>
					<td class="span2" align="center">设备序号:</td>
					<td class="span3" align="left">${electricEq.orderNumber}</td>
				</tr>
				<tr>
					<td class="span2" align="center">运行类型:</td>
					<td class="span3" align="left">${electricEq.runType}</td>
					<td class="span2" align="center">里程:</td>
					<td class="span3" align="left">${electricEq.mileage}</td>
				</tr>
				<tr>
					<td class="span2" align="center">运行类型编码:</td>
					<td class="span3" align="left">${electricEq.runTypeCode}</td>
					<td class="span2" align="center">创建时间:</td>
					<td class="span3" align="left">${electricEq.createTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">最后修改人姓名:</td>
					<td class="span3" align="left">${electricEq.rewriterName}</td>
					<td class="span2" align="center">最后修改日期:</td>
					<td class="span3" align="left">${electricEq.uploadTime}</td>
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