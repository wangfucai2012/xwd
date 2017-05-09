<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>18号无交叉线岔检测检修记录_子表</title>
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
		<li><a href="${ctx}/inf/nk/nocrossbranch18detail/list/">18号无交叉线岔检测检修记录_子表列表</a></li>
		<li class="active"><a href="#">18号无交叉线岔检测检修记录_子表信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dPole}</td>
					<td class="span2" align="center">柱杆类型:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dPoleType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">正线拉出值_设计值:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dMpDesign}</td>
					<td class="span2" align="center">正线拉出值_实测值:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dMpReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">正线拉出值_状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dMpStatus}</td>
					<td class="span2" align="center">侧线拉出值_设计值:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dSpDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">侧线拉出值_实测值:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dSpReal}</td>
					<td class="span2" align="center">侧线拉出值_状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dSpStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">侧线相对于正线线路中心距离（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dSSidingDistance}</td>
					<td class="span2" align="center">侧线相对于正线的状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dSSidingStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导高_正线设计值（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHMainDesign}</td>
					<td class="span2" align="center">导高_正线实测值（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHMainReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导高_正线状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHMainStatus}</td>
					<td class="span2" align="center">导高_侧线设计值（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHSideDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导高_侧线实测值（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHSideReal}</td>
					<td class="span2" align="center">导高_侧线状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHSideStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">导高_实测抬高（mm）:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHRealLift}</td>
					<td class="span2" align="center">导高_实测抬高状态:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dHRealLiftStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dCheckDate}</td>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRecorderJobTicket}</td>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRecorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷处理情况:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRepairedStatus}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRepairerJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dRepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.ncb18dNote}</td>
					<td class="span2" align="center">记录状态是否:</td>
					<td class="span3" align="left">${noCrossBranch18Detail.checkFlag}</td>
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