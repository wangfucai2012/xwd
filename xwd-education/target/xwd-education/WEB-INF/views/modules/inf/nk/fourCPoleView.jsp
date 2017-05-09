<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>4C曲线数据支柱和吊线</title>
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
		<li><a href="${ctx}/inf/nk/fourcpole/list/">4C曲线数据支柱和吊线计列表</a></li>
		<li class="active"><a href="#">4C曲线数据支柱和吊线信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${fourCPole.checkDate}</td>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${fourCPole.poleno}</td>
				</tr>
				<tr>
					<td class="span2" align="center">站/区间:</td>
					<td class="span3" align="left">${fourCPole.stationName}</td>
					<td class="span2" align="center">公里标数字形式:</td>
					<td class="span3" align="left">${fourCPole.mileageNum}</td>
				</tr>
				<tr>
					<td class="span2" align="center">即时速度:</td>
					<td class="span3" align="left">${fourCPole.speed}</td>
					<td class="span2" align="center">接触线高度:</td>
					<td class="span3" align="left">${fourCPole.height}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线拉出值:</td>
					<td class="span3" align="left">${fourCPole.stagger}</td>
					<td class="span2" align="center">录入时间:</td>
					<td class="span3" align="left">${fourCPole.insertTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">录入方式:</td>
					<td class="span3" align="left">${fourCPole.insertType}</td>
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