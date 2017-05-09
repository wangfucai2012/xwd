<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接地电阻检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/earthresistance/list/">接地电阻检测检修记录列表</a></li>
		<li class="active"><a href="#">接地电阻检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">主键id:</td>
					<td class="span3" align="left">${earthResistance.grId}</td>
					<td class="span2" align="center">基础杆号id:</td>
					<td class="span3" align="left">${earthResistance.baseId}</td>
				</tr>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${earthResistance.grPole}</td>
					<td class="span2" align="center">区间(站场)的id:</td>
					<td class="span3" align="left">${earthResistance.blockId}</td>
				</tr>
				<tr>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${earthResistance.block}</td>
					<td class="span2" align="center">接地设备类型:</td>
					<td class="span3" align="left">${earthResistance.grGroundDevice}</td>
				</tr>
				<tr>
					<td class="span2" align="center">电阻值（Ω）_标准值:</td>
					<td class="span3" align="left">${earthResistance.grResistanceStandard}</td>
					<td class="span2" align="center">电阻值（Ω）_实测值:</td>
					<td class="span3" align="left">${earthResistance.grResistanceReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">电阻值（Ω）_状态:</td>
					<td class="span3" align="left">${earthResistance.grResistanceStatus}</td>
					<td class="span2" align="center">与综合接地相连情况:</td>
					<td class="span3" align="left">${earthResistance.grCompositeGroundCon}</td>
				</tr>
				<tr>
					<td class="span2" align="center">天气情况:</td>
					<td class="span3" align="left">${earthResistance.grWeather}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${earthResistance.grCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人id:</td>
					<td class="span3" align="left">${earthResistance.grCheckerId}</td>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${earthResistance.grCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${earthResistance.grRecorderJobTicket}</td>
					<td class="span2" align="center">记录人id:</td>
					<td class="span3" align="left">${earthResistance.grRecorderId}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${earthResistance.grRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${earthResistance.grRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${earthResistance.grRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人id:</td>
					<td class="span3" align="left">${earthResistance.grRepairerId}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${earthResistance.grRepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${earthResistance.grRepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${earthResistance.grNote}</td>
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