<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>42号无交叉线岔检测检修记录</title>
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
		<li><a href="${ctx}/inf/nk/nocrossbranch42/list/">42号无交叉线岔检测检修记录列表</a></li>
		<li class="active"><a href="#">42号无交叉线岔检测检修记录信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42Block}</td>
					<td class="span2" align="center">道岔号:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42TurnoutNo}</td>
				</tr>
				<tr>
					<td class="span2" align="center">工区:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42WorkArea}</td>
					<td class="span2" align="center">A柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleACode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">B柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleBCode}</td>
					<td class="span2" align="center">C柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleCCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">D1柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleD1Code}</td>
					<td class="span2" align="center">D2柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleD2Code}</td>
				</tr>
				<tr>
					<td class="span2" align="center">E1柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleE1Code}</td>
					<td class="span2" align="center">E2柱号:</td>
					<td class="span3" align="left">${nocrossbranch42.poleE2Code}</td>
				</tr>
				<tr>
					<td class="span2" align="center">测量人员:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42CheckerName}</td>
					<td class="span2" align="center">记录人:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42RecorderName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">测量日期:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42CheckDate}</td>
					<td class="span2" align="center">缺陷处理及修后状态:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42RepairedStatus}</td>
				</tr>
				<tr>
					<td class="span2" align="center">处理缺陷操作人:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42RepairerName}</td>
					<td class="span2" align="center">处理日期:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42RepairDate}</td>
				</tr>
				<tr>
					<td class="span2" align="center">备注:</td>
					<td class="span3" align="left">${nocrossbranch42.ncb42Note}</td>
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