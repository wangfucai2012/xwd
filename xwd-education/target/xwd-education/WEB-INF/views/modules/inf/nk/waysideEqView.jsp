<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>地面磁感应装置检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/waysideeq/list/">地面磁感应装置检测检修记录列表</a></li>
		<li class="active"><a href="#">地面磁感应装置检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${waysideEq.miuPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${waysideEq.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">行别:</td>
					<td class="span3" align="left">${waysideEq.miuDirectionType}</td>
					<td class="span2" align="center">磁感应装置编号:</td>
					<td class="span3" align="left">${waysideEq.miuMagneticInductionNo}</td>
				</tr>
				<tr>
					<td class="span2" align="center">里程:</td>
					<td class="span3" align="left">${waysideEq.miuMileage}</td>
					<td class="span2" align="center">磁场强度_标准（GS):</td>
					<td class="span3" align="left">${waysideEq.miuIntensityStandard}</td>
				</tr>
				<tr>
					<td class="span2" align="center">磁场强度_实测（GS):</td>
					<td class="span3" align="left">${waysideEq.miuIntensityReal}</td>
					<td class="span2" align="center">磁场强度_状态(≥40):</td>
					<td class="span3" align="left">${waysideEq.miuIntensityStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">外观状态:</td>
					<td class="span3" align="left">${waysideEq.miuFacadeStatus}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${waysideEq.miuCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${waysideEq.miuCheckerName}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${waysideEq.miuRecorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${waysideEq.miuRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${waysideEq.miuRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${waysideEq.miuRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${waysideEq.miuRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${waysideEq.miuRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${waysideEq.miuNote}</td>
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