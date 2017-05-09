<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>接触网问题统计</title>
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
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${contactNetPro.blockName}</td>
					<td class="span2" align="center">工区名称:</td>
					<td class="span3" align="left">${contactNetPro.departmentName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${contactNetPro.trackNumber}</td>
					<td class="span2" align="center">支柱号:</td>
					<td class="span3" align="left">${contactNetPro.pole}</td>
				</tr>
				<tr>
					<td class="span2" align="center">问题类型:</td>
					<td class="span3" align="left">${contactNetPro.problemType}</td>
					<td class="span2" align="center">问题内容:</td>
					<td class="span3" align="left">${contactNetPro.problemContent}</td>
				</tr>
				<tr>
					<td class="span2" align="center">问题项:</td>
					<td class="span3" align="left">${contactNetPro.problemName}</td>
					<td class="span2" align="center">检修时间:</td>
					<td class="span3" align="left">${contactNetPro.checkTime}</td>
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