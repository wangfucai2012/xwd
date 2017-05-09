<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>18号无交叉线岔检测检修记录_主表</title>
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
		<li><a href="${ctx}/inf/nk/nocrossbranch18main/list/">18号无交叉线岔检测检修记录_主表列表</a></li>
		<li class="active"><a href="#">18号无交叉线岔检测检修记录_主表信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncbPole}</td>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18Block}</td>
				</tr>
				<tr>
					<td class="span2" align="center">道岔号:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18TurnoutNo}</td>
					<td class="span2" align="center">侧线受电弓中心至正线接触线1050处抬高_标准值:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18PantographStandard}</td>
				</tr>
				<tr>
					<td class="span2" align="center">侧线受电弓中心至正线接触线1050处抬高_实测值:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18PantographReal}</td>
					<td class="span2" align="center">侧线受电弓中心至正线接触线1050处抬高_状态:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18PantographStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18CheckDate}</td>
					<td class="span2" align="center">检测人姓名:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18CheckerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RecorderJobTicket}</td>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RecorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷处理情况:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RepairedStatus}</td>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RepairerJobTicket}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18RepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18Note}</td>
					<td class="span2" align="center">上传状态:</td>
					<td class="span3" align="left">${noCrossBranch18Main.ncb18UploadStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">A柱:</td>
					<td class="span3" align="left">${noCrossBranch18Main.noCrossBranch18DetailA}</td>
					<td class="span2" align="center">B柱:</td>
					<td class="span3" align="left">${noCrossBranch18Main.noCrossBranch18DetailB}</td>
				</tr>
				<tr>
					<td class="span2" align="center">C柱:</td>
					<td class="span3" align="left">${noCrossBranch18Main.noCrossBranch18DetailC}</td>
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