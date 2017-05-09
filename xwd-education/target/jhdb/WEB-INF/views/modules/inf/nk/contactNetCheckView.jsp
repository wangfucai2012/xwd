<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接触网巡视</title>
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
		<li><a href="${ctx}/inf/nk/contactnetcheck/list/">接触网巡视列表</a></li>
		<li class="active"><a href="#">接触网巡视信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">巡视区间（站场）:</td>
					<td class="span3" align="left">${contactNetCheck.patrolBlock}</td>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${contactNetCheck.patrolPoleNum}</td>
				</tr>
				<tr>
					<td class="span2" align="center">巡视设备名称:</td>
					<td class="span3" align="left">${contactNetCheck.patrolEquipName}</td>
					<td class="span2" align="center">缺陷内容:</td>
					<td class="span3" align="left">${contactNetCheck.patrolDefectContent}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷级别:</td>
					<td class="span3" align="left">${contactNetCheck.patrolDefectLevel}</td>
					<td class="span2" align="center">缺陷状态:</td>
					<td class="span3" align="left">${contactNetCheck.patrolDefectWhether}</td>
				</tr>
				<tr>
					<td class="span2" align="center">要求缺陷处理时间:</td>
					<td class="span3" align="left">${contactNetCheck.patrolRequireCompleteTime}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${contactNetCheck.patrolJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理结果:</td>
					<td class="span3" align="left">${contactNetCheck.patrolResult}</td>
					<td class="span2" align="center">处理人:</td>
					<td class="span3" align="left">${contactNetCheck.patrolProcessName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理工作票号:</td>
					<td class="span3" align="left">${contactNetCheck.patrolProcessJobTicket}</td>
					<td class="span2" align="center">处理时间:</td>
					<td class="span3" align="left">${contactNetCheck.patrolProcessTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${contactNetCheck.partolRecorder}</td>
					<td class="span2" align="center">巡视备注:</td>
					<td class="span3" align="left">${contactNetCheck.patrolNote}</td>
				</tr>
				<tr>
					<td class="span2" align="center">巡视检查人:</td>
					<td class="span3" align="left">${contactNetCheck.patrolCheckName}</td>
					<td class="span2" align="center">巡视检查时间:</td>
					<td class="span3" align="left">${contactNetCheck.patrolCheckTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">巡视上传状态:</td>
					<td class="span3" align="left">${contactNetCheck.patrolUploadStatus}</td>
					<td class="span2" align="center">区间（站场）:</td>
					<td class="span3" align="left">${contactNetCheck.block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${contactNetCheck.trackNumber}</td>
					<td class="span2" align="center">巡视缺陷图片:</td>
					<td class="span3" align="left">${contactNetCheck.pictureFormer}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷图片:</td>
					<td class="span3" align="left">${contactNetCheck.pictureLater}</td>
					<td class="span2" align="center">巡视类别:</td>
					<td class="span3" align="left">${contactNetCheck.patrolType}</td>
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