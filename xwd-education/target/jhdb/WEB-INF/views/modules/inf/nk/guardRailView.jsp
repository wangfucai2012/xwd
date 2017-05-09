<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>护栏外巡视</title>
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
		<li><a href="${ctx}/inf/nk/guardrail/list/">护栏外巡视列表</a></li>
		<li class="active"><a href="#">护栏外巡视信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${guardRail.patrolPoleNum}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${guardRail.patrolBlock}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设备名称:</td>
					<td class="span3" align="left">${guardRail.patrolEquipName}</td>
					<td class="span2" align="center">缺陷内容:</td>
					<td class="span3" align="left">${guardRail.patrolDefectContent}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷原因:</td>
					<td class="span3" align="left">${guardRail.patrolDefectReason}</td>
					<td class="span2" align="center">缺陷级别 A B C:</td>
					<td class="span3" align="left">${guardRail.patrolDefectLevel}</td>
				</tr>
				<tr>
					<td class="span2" align="center">是否合格:</td>
					<td class="span3" align="left">${guardRail.patrolDefectWhether}</td>
					<td class="span2" align="center">要求完成时间:</td>
					<td class="span3" align="left">${guardRail.patrolRequireCompleteTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${guardRail.patrolJobTicket}</td>
					<td class="span2" align="center">处理措施:</td>
					<td class="span3" align="left">${guardRail.patrolMeasure}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理结果:</td>
					<td class="span3" align="left">${guardRail.patrolResult}</td>
					<td class="span2" align="center">处理人姓名:</td>
					<td class="span3" align="left">${guardRail.patrolProcessName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理人工作票:</td>
					<td class="span3" align="left">${guardRail.patrolProcessJobTicket}</td>
					<td class="span2" align="center">处理时间:</td>
					<td class="span3" align="left">${guardRail.patrolProcessTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${guardRail.partolRecorder}</td>
					<td class="span2" align="center">检查人姓名:</td>
					<td class="span3" align="left">${guardRail.patrolCheckName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检查时间:</td>
					<td class="span3" align="left">${guardRail.patrolCheckTime}</td>
					<td class="span2" align="center">上传状态:</td>
					<td class="span3" align="left">${guardRail.patrolUploadStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">巡视处理前照片:</td>
					<td class="span3" align="left">${guardRail.pictureFormer}</td>
					<td class="span2" align="center">巡视处理后照片:</td>
					<td class="span3" align="left">${guardRail.pictureLater}</td>
				</tr>
				<tr>
					<td class="span2" align="center">巡视类型:</td>
					<td class="span3" align="left">${guardRail.patrolType}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${guardRail.patrolNote}</td>
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