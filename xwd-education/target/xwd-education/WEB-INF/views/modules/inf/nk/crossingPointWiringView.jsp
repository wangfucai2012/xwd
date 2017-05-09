<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>交叉线岔检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/crossingpointwiring/list/">交叉线岔检测检修记录列表</a></li>
		<li class="active"><a href="#">交叉线岔检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${crossingPointWiring.clbPole}</td>
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${crossingPointWiring.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${crossingPointWiring.trackNumber}</td>
					<td class="span2" align="center">道岔号:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTurnoutNo}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线拉出值直股设计值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpStraightDesign}</td>
					<td class="span2" align="center">接触线拉出值直股实测值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpStraightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线拉出值直股状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpStraightStatus}</td>
					<td class="span2" align="center">接触线拉出值曲股设计值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpBendDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线拉出值曲股实测值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpBendReal}</td>
					<td class="span2" align="center">接触线拉出值曲股状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlpBendStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线高度直股设计值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhStraightDesign}</td>
					<td class="span2" align="center">接触线高度直股实测值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhStraightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线高度直股状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhStraightStatus}</td>
					<td class="span2" align="center">接触线高度曲股设计值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhBendDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线高度曲股实测值:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhBendReal}</td>
					<td class="span2" align="center">接触线高度曲股状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbTlhBendStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">交叉点位置内轨距:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCppInsideDis}</td>
					<td class="span2" align="center">交叉点位置横向位置:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCppHorizonPos}</td>
				</tr>
				<tr>
					<td class="span2" align="center">交叉点位置横向偏差:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCppHorizonOff}</td>
					<td class="span2" align="center">交叉点位置状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCppStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">500mm处抬高岔尖侧:</td>
					<td class="span3" align="left">${crossingPointWiring.clb500mmHead}</td>
					<td class="span2" align="center">500mm处抬高岔尾侧:</td>
					<td class="span3" align="left">${crossingPointWiring.clb500mmTail}</td>
				</tr>
				<tr>
					<td class="span2" align="center">500mm处抬高岔尖侧状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clb500mmHeadStatus}</td>
					<td class="span2" align="center">500mm处抬高岔尾侧状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clb500mmTailStauts}</td>
				</tr>
				<tr>
					<td class="span2" align="center">限制管等零件的状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbPartStatus}</td>
					<td class="span2" align="center">电联接状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbElecConnStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">测量日期:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCheckDate}</td>
					<td class="span2" align="center">测量人:</td>
					<td class="span3" align="left">${crossingPointWiring.clbCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${crossingPointWiring.clbRecorderName}</td>
					<td class="span2" align="center">处理情况及修后状态:</td>
					<td class="span3" align="left">${crossingPointWiring.clbRepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${crossingPointWiring.clbRepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${crossingPointWiring.clbRepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${crossingPointWiring.clbNote}</td>
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