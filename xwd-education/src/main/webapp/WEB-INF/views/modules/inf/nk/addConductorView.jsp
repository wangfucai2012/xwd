<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>附加导线驰度检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/addconductor/list/">附加导线驰度检测检修记录列表</a></li>
		<li class="active"><a href="#">附加导线驰度检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${addConductor.awcdPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${addConductor.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${addConductor.trackNumber}</td>
					<td class="span2" align="center">附加线类型:</td>
					<td class="span3" align="left">${addConductor.awcdType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">温度（℃）:</td>
					<td class="span3" align="left">${addConductor.awcdTemperature}</td>
					<td class="span2" align="center">驰度_标准值(mm):</td>
					<td class="span3" align="left">${addConductor.awcdSagStandard}</td>
				</tr>
				<tr>
					<td class="span2" align="center">驰度_实测值(mm):</td>
					<td class="span3" align="left">${addConductor.awcdSagReal}</td>
					<td class="span2" align="center">驰度_实测值(mm)_第一定位点:</td>
					<td class="span3" align="left">${addConductor.awcdSagRealFirst}</td>
				</tr>
				<tr>
					<td class="span2" align="center">驰度_实测值(mm)_第二定位点:</td>
					<td class="span3" align="left">${addConductor.awcdSagRealSecond}</td>
					<td class="span2" align="center">驰度_实测值(mm)_最低点:</td>
					<td class="span3" align="left">${addConductor.awcdSagRealMin}</td>
				</tr>
				<tr>
					<td class="span2" align="center">驰度_状态(mm):</td>
					<td class="span3" align="left">${addConductor.awcdSagStatus}</td>
					<td class="span2" align="center">绝缘距离是否符合要求:</td>
					<td class="span3" align="left">${addConductor.awcdInsulationDistance}</td>
				</tr>
				<tr>
					<td class="span2" align="center">外观情况:</td>
					<td class="span3" align="left">${addConductor.awcdFacadeSituation}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${addConductor.awcdCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${addConductor.awcdCheckerName}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${addConductor.awcdRecorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${addConductor.awcdRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${addConductor.awcdRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${addConductor.awcdRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${addConductor.awcdRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${addConductor.awcdRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${addConductor.awcdNote}</td>
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