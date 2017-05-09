<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>绝缘子清扫</title>
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
		<li><a href="${ctx}/inf/nk/insulatorclean/list/">绝缘子清扫列表</a></li>
		<li class="active"><a href="#">绝缘子清扫信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">杆号:</td>
					<td class="span3" align="left">${insulatorClean.pole}</td>
					<td class="span2" align="center">区间编码:</td>
					<td class="span3" align="left">${insulatorClean.blockCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">区间名称:</td>
					<td class="span3" align="left">${insulatorClean.block}</td>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${insulatorClean.trackNumber}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工作票号:</td>
					<td class="span3" align="left">${insulatorClean.recorderJobTicket}</td>
					<td class="span2" align="center">记录人姓名:</td>
					<td class="span3" align="left">${insulatorClean.recorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">操作日期:</td>
					<td class="span3" align="left">${insulatorClean.checkDate}</td>
					<td class="span2" align="center">操作人姓名:</td>
					<td class="span3" align="left">${insulatorClean.checkerName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">上传状态:</td>
					<td class="span3" align="left">${insulatorClean.uploadStatus}</td>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${insulatorClean.note}</td>
				</tr>
				<tr>
					<td class="span2" align="center">清扫方式:</td>
					<td class="span3" align="left">${insulatorClean.cleanType}</td>
					<td class="span2" align="center">棒式瓷质绝缘子:</td>
					<td class="span3" align="left">${insulatorClean.insulatorStick}</td>
				</tr>
				<tr>
					<td class="span2" align="center">悬式瓷质绝缘子:</td>
					<td class="span3" align="left">${insulatorClean.insulatorHang}</td>
					<td class="span2" align="center">悬式复合绝缘子:</td>
					<td class="span3" align="left">${insulatorClean.insulatorComplex}</td>
				</tr>
				<tr>
					<td class="span2" align="center">最后更新时间:</td>
					<td class="span3" align="left">${insulatorClean.modifyTime}</td>
					<td class="span2" align="center">棒式复合绝缘子:</td>
					<td class="span3" align="left">${insulatorClean.insulatorStickComplex}</td>
				</tr>
				<tr>
					<td class="span2" align="center">支持绝缘子:</td>
					<td class="span3" align="left">${insulatorClean.insulatorSupport}</td>
					<td class="span2" align="center">是否重污染区:</td>
					<td class="span3" align="left">${insulatorClean.isHeavyPollution}</td>
				</tr>
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