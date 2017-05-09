<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>电力缺陷统计</title>
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
		<li><a href="${ctx}/inf/nk/contactnetpro/list/">接触网问题统计列表</a></li>
		<li class="active"><a href="#">接触网问题统计信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">维管段名称:</td>
					<td class="span3" align="left">${powerDefect.sectionName}</td>
					<td class="span2" align="center">工区名称:</td>
					<td class="span3" align="left">${powerDefect.departmentName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所亭类型:</td>
					<td class="span3" align="left">${powerDefect.stationType}</td>
					<td class="span2" align="center">所亭编码:</td>
					<td class="span3" align="left">${powerDefect.stationCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">所亭名称:</td>
					<td class="span3" align="left">${powerDefect.stationName}</td>
					<td class="span2" align="center">设备类型:</td>
					<td class="span3" align="left">${powerDefect.equipType}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设备名:</td>
					<td class="span3" align="left">${powerDefect.equipName}</td>
					<td class="span2" align="center">运行编码:</td>
					<td class="span3" align="left">${powerDefect.runCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">问题类型:</td>
					<td class="span3" align="left">${powerDefect.bussinessType}</td>
					<td class="span2" align="center">问题标准:</td>
					<td class="span3" align="left">${powerDefect.problemStand}</td>
				</tr>
				<tr>
					<td class="span2" align="center">缺陷内容:</td>
					<td class="span3" align="left">${powerDefect.defectContent}</td>
					<td class="span2" align="center">修后措施:</td>
					<td class="span3" align="left">${powerDefect.repairMeasures}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理状态:</td>
					<td class="span3" align="left">${powerDefect.processStatus}</td>
					<td class="span2" align="center">指派状态:</td>
					<td class="span3" align="left">${powerDefect.assignStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">发现人:</td>
					<td class="span3" align="left">${powerDefect.checkName}</td>
					<td class="span2" align="center">发现时间:</td>
					<td class="span3" align="left">${powerDefect.checkTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理人:</td>
					<td class="span3" align="left">${powerDefect.repairer}</td>
					<td class="span2" align="center">处理时间:</td>
					<td class="span3" align="left">${powerDefect.repairTime}</td>
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