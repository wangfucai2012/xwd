<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>鸟巢</title>
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
		<li><a href="${ctx}/inf/nk/birdnest/list/">鸟巢列表</a></li>
		<li class="active"><a href="#">鸟巢信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${birdNest.pole}</td>
					<td class="span2" align="center">区间编码:</td>
					<td class="span3" align="left">${birdNest.blockCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${birdNest.block}</td>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${birdNest.trackNumber}</td>
				</tr>
				<tr>
					<td class="span2" align="center">鸟巢位置:</td>
					<td class="span3" align="left">${birdNest.nestPosition}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${birdNest.recorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${birdNest.recorderName}</td>
					<td class="span2" align="center">操作日期:</td>
					<td class="span3" align="left">${birdNest.checkDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">操作人姓名:</td>
					<td class="span3" align="left">${birdNest.checkerName}</td>
					<td class="span2" align="center">上传状态:</td>
					<td class="span3" align="left">${birdNest.uploadStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${birdNest.note}</td>
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