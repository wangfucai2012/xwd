<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>4C批次号</title>
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
		<li><a href="${ctx}/inf/nk/fourcbatvalue/list/">4C批次号列表</a></li>
		<li class="active"><a href="#">4C批次号信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${fourCbatValue.checkDate}</td>
					<td class="span2" align="center">线路编码:</td>
					<td class="span3" align="left">${fourCbatValue.lineCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">线路名称:</td>
					<td class="span3" align="left">${fourCbatValue.lineName}</td>
					<td class="span2" align="center">行别:</td>
					<td class="span3" align="left">${fourCbatValue.direction}</td>
				</tr>
				<tr>
					<td class="span2" align="center">起始站编码:</td>
					<td class="span3" align="left">${fourCbatValue.startStationCode}</td>
					<td class="span2" align="center">起始站:</td>
					<td class="span3" align="left">${fourCbatValue.startStationName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">结束站编码:</td>
					<td class="span3" align="left">${fourCbatValue.endStationCode}</td>
					<td class="span2" align="center">结束站:</td>
					<td class="span3" align="left">${fourCbatValue.endStationName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">开始公里标:</td>
					<td class="span3" align="left">${fourCbatValue.startKm}</td>
					<td class="span2" align="center">结束公里标:</td>
					<td class="span3" align="left">${fourCbatValue.endKm}</td>
				</tr>
				<tr>
					<td class="span2" align="center">开始杆号:</td>
					<td class="span3" align="left">${fourCbatValue.startPoleno}</td>
					<td class="span2" align="center">结束杆号:</td>
					<td class="span3" align="left">${fourCbatValue.endPoleno}</td>
				</tr>
				<tr>
					<td class="span2" align="center">录入时间:</td>
					<td class="span3" align="left">${fourCbatValue.insertTime}</td>
					<td class="span2" align="center">录入方式:</td>
					<td class="span3" align="left">${fourCbatValue.insertType}</td>
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