<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接触线磨耗检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/contactwirewear/list/">接触线磨耗检测检修记录列表</a></li>
		<li class="active"><a href="#">接触线磨耗检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${contactWireWear.tlaPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${contactWireWear.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导线规格（mm2）:</td>
					<td class="span3" align="left">${contactWireWear.tlaLeadSize}</td>
					<td class="span2" align="center">标称直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaNominalDiameter}</td>
				</tr>
				<tr>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_变坡升坡点实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorSlope}</td>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_锚段关节转换点实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorAnchorPoint}</td>
				</tr>
				<tr>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_中锚线夹实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorAnchorWire}</td>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_电连接线夹实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorElecWire}</td>
				</tr>
				<tr>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_线岔交叉点实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorCrossLine}</td>
					<td class="span2" align="center">全面磨耗测量_重点磨耗测量_其他:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMajorOther}</td>
				</tr>
				<tr>
					<td class="span2" align="center">全面磨耗测量_定位点实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllLocatePoint}</td>
					<td class="span2" align="center">全面磨耗测量_跨中实测直径（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllMidspan}</td>
				</tr>
				<tr>
					<td class="span2" align="center">全面磨耗测量_其他:</td>
					<td class="span3" align="left">${contactWireWear.tlaAllOther}</td>
					<td class="span2" align="center">安全值（mm）:</td>
					<td class="span3" align="left">${contactWireWear.tlaSafeValue}</td>
				</tr>
				<tr>
					<td class="span2" align="center">状态:</td>
					<td class="span3" align="left">${contactWireWear.tlaStatus}</td>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${contactWireWear.tlaCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${contactWireWear.tlaCheckerName}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${contactWireWear.tlaRecorderJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${contactWireWear.tlaRecorderName}</td>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${contactWireWear.tlaRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${contactWireWear.tlaRepairerJobTicket}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${contactWireWear.tlaRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${contactWireWear.tlaRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${contactWireWear.tlaNote}</td>
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