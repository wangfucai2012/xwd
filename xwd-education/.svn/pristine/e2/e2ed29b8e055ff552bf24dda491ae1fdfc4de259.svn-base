<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>1C批次号及超限值</title>
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
		<li><a href="${ctx}/inf/nk/cbatvalue/list/">1C批次号及超限值列表</a></li>
		<li class="active"><a href="#">1C批次号及超限值信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">里程:</td>
					<td class="span3" align="left">${cbatValue.kilometer}</td>
					<td class="span2" align="center">速度:</td>
					<td class="span3" align="left">${cbatValue.speed}</td>
				</tr>
				<tr>
					<td class="span2" align="center">超限类型:</td>
					<td class="span3" align="left">${cbatValue.overrunType}</td>
					<td class="span2" align="center">缺陷值:</td>
					<td class="span3" align="left">${cbatValue.defect}</td>
				</tr>
				<tr>
					<td class="span2" align="center">是否重复出现:</td>
					<td class="span3" align="left">${cbatValue.repeat}</td>
					<td class="span2" align="center">开始检测时间:</td>
					<td class="span3" align="left">${cbatValue.startCheckDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">结束检测时间:</td>
					<td class="span3" align="left">${cbatValue.endCheckDate}</td>
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