<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>锚段关节（关节式分相）检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/anchorgj/list/">锚段关节（关节式分相）检测检修记录列表</a></li>
		<li class="active"><a href="#">锚段关节（关节式分相）检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${anchorGj.jpPole}</td>
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${anchorGj.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${anchorGj.trackNumber}</td>
					<td class="span2" align="center">北京侧设计拉出值:</td>
					<td class="span3" align="left">${anchorGj.lineBjPulloutDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧实测拉出值:</td>
					<td class="span3" align="left">${anchorGj.lineBjPulloutReal}</td>
					<td class="span2" align="center">北京侧拉出值状态:</td>
					<td class="span3" align="left">${anchorGj.lineBjPulloutStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧设计导高:</td>
					<td class="span3" align="left">${anchorGj.lineBjHeightDesign}</td>
					<td class="span2" align="center">北京侧实测导高:</td>
					<td class="span3" align="left">${anchorGj.lineBjHeightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧导高状态:</td>
					<td class="span3" align="left">${anchorGj.lineBjHeightStatus}</td>
					<td class="span2" align="center">上海侧设计拉出值:</td>
					<td class="span3" align="left">${anchorGj.lineShPulloutDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧实测拉出值:</td>
					<td class="span3" align="left">${anchorGj.lineShPulloutReal}</td>
					<td class="span2" align="center">上海侧拉出值状态:</td>
					<td class="span3" align="left">${anchorGj.lineShPulloutStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧设计导高:</td>
					<td class="span3" align="left">${anchorGj.lineShHeightDesign}</td>
					<td class="span2" align="center">上海侧实测导高:</td>
					<td class="span3" align="left">${anchorGj.lineShHeightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧导高状态:</td>
					<td class="span3" align="left">${anchorGj.lineShHeightStatus}</td>
					<td class="span2" align="center">北京侧设计偏移值:</td>
					<td class="span3" align="left">${anchorGj.cableBjSkewingDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧实际偏移值:</td>
					<td class="span3" align="left">${anchorGj.cableBjSkewingReal}</td>
					<td class="span2" align="center">北京侧偏移状态:</td>
					<td class="span3" align="left">${anchorGj.cableBjSkewingStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧设计高度:</td>
					<td class="span3" align="left">${anchorGj.cableBjHeightDesign}</td>
					<td class="span2" align="center">北京侧实测高度:</td>
					<td class="span3" align="left">${anchorGj.cableBjHeightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">北京侧高度状态:</td>
					<td class="span3" align="left">${anchorGj.cableBjHeightStatus}</td>
					<td class="span2" align="center">上海侧设计偏移值:</td>
					<td class="span3" align="left">${anchorGj.cableShSkewingDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧实测偏移值:</td>
					<td class="span3" align="left">${anchorGj.cableShSkewingReal}</td>
					<td class="span2" align="center">上海侧偏移状态:</td>
					<td class="span3" align="left">${anchorGj.cableShSkewingStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧设计高度:</td>
					<td class="span3" align="left">${anchorGj.cableShHeightDesign}</td>
					<td class="span2" align="center">上海侧实测高度:</td>
					<td class="span3" align="left">${anchorGj.cableShHeightReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上海侧高度状态:</td>
					<td class="span3" align="left">${anchorGj.cableShHeightStatus}</td>
					<td class="span2" align="center">水平接触线标准值:</td>
					<td class="span3" align="left">${anchorGj.jpLevelLineDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">水平接触线实测值:</td>
					<td class="span3" align="left">${anchorGj.jpLevelLineReal}</td>
					<td class="span2" align="center">水平接触线状态:</td>
					<td class="span3" align="left">${anchorGj.jpLevelLineStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">水平承力索标准值:</td>
					<td class="span3" align="left">${anchorGj.jpLevelCableDesign}</td>
					<td class="span2" align="center">水平承力索实测值:</td>
					<td class="span3" align="left">${anchorGj.jpLevelCableReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">水平承力索状态:</td>
					<td class="span3" align="left">${anchorGj.jpLevelCableStatus}</td>
					<td class="span2" align="center">垂直接触线标准值:</td>
					<td class="span3" align="left">${anchorGj.jpVerticalLineDesign}</td>
				</tr>
				<tr>
					<td class="span2" align="center">垂直接触线实测值:</td>
					<td class="span3" align="left">${anchorGj.jpVerticalLineReal}</td>
					<td class="span2" align="center">垂直接触线状态:</td>
					<td class="span3" align="left">${anchorGj.jpVerticalLineStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">垂直承力索标准值:</td>
					<td class="span3" align="left">${anchorGj.jpVerticalCableDesign}</td>
					<td class="span2" align="center">垂直承力索实测值:</td>
					<td class="span3" align="left">${anchorGj.jpVerticallCableReal}</td>
				</tr>
				<tr>
					<td class="span2" align="center">垂直承力索状态:</td>
					<td class="span3" align="left">${anchorGj.jpVerticalCableStatus}</td>
					<td class="span2" align="center">检测人:</td>
					<td class="span3" align="left">${anchorGj.jpCheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测时间:</td>
					<td class="span3" align="left">${anchorGj.jpCheckDate}</td>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${anchorGj.jpRecorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理情况及修后状态:</td>
					<td class="span3" align="left">${anchorGj.jpRepairedStatus}</td>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${anchorGj.jpRepairerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${anchorGj.jpRepairDate}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${anchorGj.jpNote}</td>
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