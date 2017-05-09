<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分段绝缘器、器件式分相检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/infphasebreaker/list/">分段绝缘器、器件式分相检测检修记录列表</a></li>
		<li class="active"><a href="#">分段绝缘器、器件式分相检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${infPhaseBreaker.siPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${infPhaseBreaker.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">承力索绝缘件状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siCarrierCableStatus}</td>
					<td class="span2" align="center">主绝缘状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siMajorInsulationStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导流板状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siGuidePlateStatus}</td>
					<td class="span2" align="center">对线路中心偏移（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siOffsetLineCenter}</td>
				</tr>
				<tr>
					<td class="span2" align="center">弛度（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siSag}</td>
					<td class="span2" align="center">消弧角间隙（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.extanglegGap}</td>
				</tr>
				<tr>
					<td class="span2" align="center">消弧角间隙状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.extanglegGapStatus}</td>
					<td class="span2" align="center">顺线路两端导高_北京侧（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siHorizontalLineBj}</td>
				</tr>
				<tr>
					<td class="span2" align="center">顺线路两端导高_上海侧（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siHorizontalLineSh}</td>
					<td class="span2" align="center">顺线路两端导高_状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siHorizontalLineStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">垂直线路两侧高度_线路侧（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siVerticalLineSideLine}</td>
					<td class="span2" align="center">垂直线路两侧高度_田野侧（mm）:</td>
					<td class="span3" align="left">${infPhaseBreaker.siVerticalLineSideField}</td>
				</tr>
				<tr>
					<td class="span2" align="center">垂直线路两侧高度_状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siVerticalLineStatus}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${infPhaseBreaker.siCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${infPhaseBreaker.siCheckerName}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRecorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${infPhaseBreaker.siRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${infPhaseBreaker.siNote}</td>
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