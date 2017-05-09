<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接触网工作票</title>
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
		<li><a href="${ctx}/inf/nk/contactnetticket/list/">接触网工作票列表</a></li>
		<li class="active"><a href="#">接触网工作票信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${contactNetTicket.recorderJobTicket}</td>
					
					<td class="span2" align="center">检测日期:</td>
					<td class="span3" align="left">${contactNetTicket.checkDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">组长:</td>
					<td class="span3" align="left">${contactNetTicket.teamLeader}</td>
					
					<td class="span2" align="center">组员:</td>
					<td class="span3" align="left">${contactNetTicket.teamWorker}</td>
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