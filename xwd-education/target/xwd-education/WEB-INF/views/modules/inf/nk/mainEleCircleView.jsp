<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>主导电回路测温记录</title>
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
		<li><a href="${ctx}/inf/nk/mainelecircle/list/">主导电回路测温记录列表</a></li>
		<li class="active"><a href="#">主导电回路测温记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${mainEleCircle.mectPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${mainEleCircle.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">线夹类型:</td>
					<td class="span3" align="left">${mainEleCircle.mectClampType}</td>
					<td class="span2" align="center">测量时天气情况:</td>
					<td class="span3" align="left">${mainEleCircle.mectWeatherSituation}</td>
				</tr>
				<tr>
					<td class="span2" align="center">测量时环境温度（℃）:</td>
					<td class="span3" align="left">${mainEleCircle.mectEnvironmentTemp}</td>
					<td class="span2" align="center">测量时网上电流（A）:</td>
					<td class="span3" align="left">${mainEleCircle.mectCurrentOnline}</td>
				</tr>
				<tr>
					<td class="span2" align="center">线夹测量温度（℃）:</td>
					<td class="span3" align="left">${mainEleCircle.mectWireClipTemp}</td>
					<td class="span2" align="center">设备缺陷判定_相对温度（℃）:</td>
					<td class="span3" align="left">${mainEleCircle.mectDefectRelativeTemp}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设备缺陷判定_绝对温度（℃）:</td>
					<td class="span3" align="left">${mainEleCircle.mectDefectAbsoluteTemp}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${mainEleCircle.mectCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${mainEleCircle.mectCheckerName}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${mainEleCircle.mectRecorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${mainEleCircle.mectRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${mainEleCircle.mectRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${mainEleCircle.mectRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${mainEleCircle.mectRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${mainEleCircle.mectRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${mainEleCircle.mectNote}</td>
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