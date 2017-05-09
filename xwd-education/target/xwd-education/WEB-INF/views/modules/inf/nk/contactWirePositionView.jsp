<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接触线位置检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/contactwireposition/list/">接触线位置检测检修记录列表</a></li>
		<li class="active"><a href="#">接触线位置检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${contactWirePosition.tlpPole}</td>
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${contactWirePosition.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${contactWirePosition.trackNumber}</td>
					<td class="span2" align="center">标准跨距:</td>
					<td class="span3" align="left">${contactWirePosition.tlpStandardSpan}</td>
				</tr>
				<tr>
					<td class="span2" align="center">标准拉出值:</td>
					<td class="span3" align="left">${contactWirePosition.tlpStandardPullout}</td>
					<td class="span2" align="center">标准接触线高度:</td>
					<td class="span3" align="left">${contactWirePosition.tlpStandardHeight}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测拉出值:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealPullout}</td>
					<td class="span2" align="center">实测跨中偏移值:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealDeviation}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测定位点:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealFixedPoint}</td>
					<td class="span2" align="center">实测吊弦点1:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect1}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测吊弦点2:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect2}</td>
					<td class="span2" align="center">实测吊弦点3:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect3}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测吊弦点4:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect4}</td>
					<td class="span2" align="center">实测吊弦点5:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect5}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测吊弦点6:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect6}</td>
					<td class="span2" align="center">实测吊弦点7:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect7}</td>
				</tr>
				<tr>
					<td class="span2" align="center">实测吊弦点8:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSuspect8}</td>
					<td class="span2" align="center">接触线坡度:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSlope}</td>
				</tr>
				<tr>
					<td class="span2" align="center">坡度变化率:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRealSlopeRate}</td>
					<td class="span2" align="center">状态拉出值:</td>
					<td class="span3" align="left">${contactWirePosition.tlpStatusPullout}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${contactWirePosition.tlpCheckDate}</td>
					<td class="span2" align="center">检测人:</td>
					<td class="span3" align="left">${contactWirePosition.tlpCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRecorderName}</td>
					<td class="span2" align="center">定位点高度:</td>
					<td class="span3" align="left">${contactWirePosition.tlpStautsHeight}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理情况:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRepairedStatus}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${contactWirePosition.tlpRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${contactWirePosition.tlpNote}</td>
				</tr>
				<tr>
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