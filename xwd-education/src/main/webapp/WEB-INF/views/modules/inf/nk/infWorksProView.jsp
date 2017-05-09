<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工作量统计</title>
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
		<li><a href="${ctx}/inf/nk/infworks/list/">工作量统计列表</a></li>
		<li class="active"><a href="#">工作量统计信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">巡视(护栏内)（条公里）:</td>
					<td class="span3" align="left">${infWorks.patrolKiloMeter}</td>
					<td class="span2" align="center">动态检测（处）:</td>
					<td class="span3" align="left">${infWorks.dymDetectKm}</td>
				</tr>
				<tr>
					<td class="span2" align="center">接触线位置（条公里）:</td>
					<td class="span3" align="left">${infWorks.contactLineKm}</td>
					<td class="span2" align="center">锚段关节（处）:</td>
					<td class="span3" align="left">${infWorks.anchorKm}</td>
				</tr>
				</tr>
					<td class="span2" align="center">交叉线岔（组）:</td>
					<td class="span3" align="left">${infWorks.overlapCross}</td>
					<td class="span2" align="center">附加导线（条公里）:</td>
					<td class="span3" align="left">${infWorks.additionalLine}</td>
				<tr>
				<tr>
					<td class="span2" align="center">补偿装置（处）:</td>
					<td class="span3" align="left">${infWorks.compensateDevice}</td>
					<td class="span2" align="center">分段绝缘器，器件式分相（处）:</td>
					<td class="span3" align="left">${infWorks.sectionInsulator}</td>
				</tr>
				</tr>
					<td class="span2" align="center">接地电阻（处）:</td>
					<td class="span3" align="left">${infWorks.earthResistance}</td>
					<td class="span2" align="center">18号无交叉线岔（组）:</td>
					<td class="span3" align="left">${infWorks.noOverlapCross18}</td>
				<tr>
				<tr>
					<td class="span2" align="center">42号无交叉线岔（组）:</td>
					<td class="span3" align="left">${infWorks.noOverlapCross42}</td>
					<td class="span2" align="center">主导点回路（处）:</td>
					<td class="span3" align="left">${infWorks.dominantPoint}</td>
				</tr>
				<tr>
					<td class="span2" align="center">地面磁感应装置（处）:</td>
					<td class="span3" align="left">${infWorks.earthMagneticInduction}</td>
					<td class="span2" align="center">接触线磨耗（处）:</td>
					<td class="span3" align="left">${infWorks.contactLineAbrasion}</td>
				</tr>
				<tr>
					<td class="span2" align="center">集中检修（条公里）:</td>
					<td class="span3" align="left">${infWorks.collectOverhaul}</td>
					<td class="span2" align="center">专项检修（条公里）:</td>
					<td class="span3" align="left">${infWorks.specialOverhaul}</td>
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