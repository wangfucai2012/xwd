<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title></title>

<style type="text/css">
.table td i {
	margin: 0 2px;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".cs-detial1 tbody").find("tr:odd")
				.css("background-color", "#eff8ff");
		$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
	});
</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/work/hangingfence?catalog=${hangingFence.cat.id}">吊围栏列表</a></li>
		<li class="active"><a href="#">吊围栏信息</a></li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="hangingFence"
		action="${ctx}/data/work/hangingFence/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="#dddddd">
				<tbody>
				    <tr>
						<td colspan="4" class="span3" align="center">
							固定资产卡片信息
						</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产名称:</td>
						<td class="span3" align="left">${hangingFence.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${hangingFence.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${hangingFence.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${hangingFence.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${hangingFence.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${hangingFence.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${hangingFence.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${hangingFence.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${hangingFence.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${hangingFence.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${hangingFence.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${hangingFence.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${hangingFence.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${hangingFence.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${hangingFence.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${hangingFence.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${hangingFence.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${hangingFence.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${hangingFence.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${hangingFence.ass.startDate}</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td colspan="4" class="span3" align="center">
							<li>设备基本信息</li>
						</td>
					</tr>
					<tr>
						<td class="span2" align="center">线名:</td>
						<td class="span3" align="left">${hangingFence.lineName }</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${hangingFence.stream }</td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏起始里程 :</td>
						<td class="span3" align="left">${hangingFence.startM }</td>
						<td class="span2" align="center">栅栏结束里程 :</td>
						<td class="span3" align="left">${hangingFence.endM }</td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏长度(m) :</td>
						<td class="span3" align="left">${hangingFence.length }</td>
						<td class="span2" align="center">网片样式 :</td>
						<td class="span3" align="left">${hangingFence.netstyle }</td>
					</tr>
					<tr>
						<td class="span2" align="center">立柱样式 :</td>
						<td class="span3" align="left">${hangingFence.lzstyle }</td>
						<td class="span2" align="center">距外轨距离（米） :</td>
						<td class="span3" align="left">${hangingFence.range }</td>
					</tr>
					<tr>
						<td class="span2" align="center">埋设位置:</td>
						<td class="span3" align="left">${hangingFence.inbuilt }</td>
						<td class="span2" align="center">栅栏起讫桥墩 :</td>
						<td class="span3" align="left">${hangingFence.startPier }</td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏安设年度 :</td>
						<td class="span3" align="left">${hangingFence.pierYear }</td>
						<td class="span2" align="center">栅栏门数量 :</td>
						<td class="span3" align="left">${hangingFence.doorNum }</td>
					</tr>
					<tr>
						<td class="span2" align="center">是否安设刺丝滚笼 :</td>
						<td class="span3" align="left">${hangingFence.flag }</td>
						<td class="span2" align="center">侧别:</td>
						<td class="span3" align="left">${hangingFence.side }</td>
					</tr>
					<tr>
						<td class="span2" align="center">速度区段：</td>
						<td class="span3" align="left">${hangingFence.speedArea }</td>
						<td class="span2" align="center">附注:</td>
						<td class="span3" align="left">${hangingFence.remark }</td>
					</tr>

				</tbody>
				<tfoot>
					<tr bgcolor="#ffffff">
						<td colspan="4" align="center"><input
							id="btnCancel" class="btn" type="button" value="返 回"
							onclick="history.go(-1)" /></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form:form>
</body>
</html>