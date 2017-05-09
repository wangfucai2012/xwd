<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>补偿装置检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/infcompensation/list/">补偿装置检测检修记录列表</a></li>
		<li class="active"><a href="#">补偿装置检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${infCompensation.cdPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${infCompensation.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">补偿形式:</td>
					<td class="span3" align="left">${infCompensation.cdCompensationForm}</td>
					<td class="span2" align="center">温度:</td>
					<td class="span3" align="left">${infCompensation.cdTemperature}</td>
				</tr>
				<tr>
					<td class="span2" align="center">承力索_标准值_b值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableStandardB}</td>
					<td class="span2" align="center">承力索_实测值_b值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableRealB}</td>
				</tr>
				<tr>
					<td class="span2" align="center">承力索_标准值（mm）_a（L）值:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableStandardAl}</td>
					<td class="span2" align="center">承力索_实测值（mm）a（L）值:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableRealAl}</td>
				</tr>
				<tr>
					<td class="span2" align="center">承力索_状态判定_b值状态:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableStatusB}</td>
					<td class="span2" align="center">承力索_状态判定_al值状态:</td>
					<td class="span3" align="left">${infCompensation.cdCarrierCableStatusAl}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线_标准值_b值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactStandardB}</td>
					<td class="span2" align="center">接触线_实测值_b值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactRealB}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线_标准值_a（L）值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactStandardAl}</td>
					<td class="span2" align="center">接触线_实测值_a（L）值（mm）:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactRealAl}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线_状态判定_b值状态:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactStatusB}</td>
					<td class="span2" align="center">接触线_状态判定_al值状态:</td>
					<td class="span3" align="left">${infCompensation.cdLineContactStatusAl}</td>
				</tr>
				<tr>
					<td class="span2" align="center">棘轮_棘轮与制动块距离:</td>
					<td class="span3" align="left">${infCompensation.cdRatchetBrakePadDis}</td>
					<td class="span2" align="center">棘轮_棘轮补偿状态:</td>
					<td class="span3" align="left">${infCompensation.cdRatchetCompensateStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">棘轮_平衡轮状态(与水平夹角不小20°):</td>
					<td class="span3" align="left">${infCompensation.cdRatchetBalanceStatus}</td>
					<td class="span2" align="center">滑轮_定滑轮有无偏磨:</td>
					<td class="span3" align="left">${infCompensation.cdPulleyStandingStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">滑轮_动滑轮状态（偏角不大于45°）:</td>
					<td class="span3" align="left">${infCompensation.cdPulleyMovableStatus}</td>
					<td class="span2" align="center">限制架状态:</td>
					<td class="span3" align="left">${infCompensation.cdRestrictStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">下锚拉线状态:</td>
					<td class="span3" align="left">${infCompensation.cdUnderAnchorWireStatus}</td>
					<td class="span2" align="center">坠砣状态:</td>
					<td class="span3" align="left">${infCompensation.cdWeightTensionerStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${infCompensation.cdCheckDate}</td>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${infCompensation.cdCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${infCompensation.cdRecorderJobTicket}</td>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${infCompensation.cdRecorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷处理情况-修后状态:</td>
					<td class="span3" align="left">${infCompensation.cdRepairedStatus}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${infCompensation.cdRepairerJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${infCompensation.cdRepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${infCompensation.cdRepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${infCompensation.cdNote}</td>
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