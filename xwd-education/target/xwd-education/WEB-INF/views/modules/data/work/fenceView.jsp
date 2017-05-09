<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>栅栏管理</title>
<meta name="decorator" content="default"/>
	<style type="text/css">.table td i{margin:0 2px;}</style>
	<script type="text/javascript">

	$(function(){ 
		$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
		$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
	}); 
//-->
</script>
</head>
<body>
<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/work/fence?catalog=${fence.cat.id}">栅栏列表</a></li>
		<li class="active"><a href="#">栅栏信息</a></li>
</ul>

	<div class="cs-detial1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
				<tbody>
					<tr>
						<td colspan="4" class="span3" align="center">
							固定资产卡片信息
						</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产名称:</td>
						<td class="span3" align="left">${fence.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${fence.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${fence.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${fence.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${fence.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${fence.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${fence.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${fence.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${fence.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${fence.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${fence.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${fence.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${fence.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${fence.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${fence.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${fence.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${fence.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${fence.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${fence.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${fence.ass.startDate}</td>
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
						<td class="span3" align="left">${fence.lineName}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${fence.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">侧别:</td>
						<td class="span3" align="left">${fence.sideStream}</td>
						<td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left">${fence.startM}</td>
					</tr>
					<tr>
						<td class="span2" align="center">终止里程:</td>
						<td class="span3" align="left">${fence.endM}</td>
						<td class="span2" align="center">栅栏长度:</td>
						<td class="span3" align="left">${fence.fenceLength}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">网片样式:</td>
						<td class="span3" align="left">${fence.netType}</td>
						<td class="span2" align="center">立柱样式:</td>
						<td class="span3" align="left">${fence.postType}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">距外轨距离:</td>
						<td class="span3" align="left">${fence.railDistance}</td>
                        <td class="span2" align="center">埋设位置:</td>
						<td class="span3" align="left">${fence.location}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">栅栏起始桥墩:</td>
						<td class="span3" align="left">${fence.startB}</td>
						<td class="span2" align="center">栅栏终止桥墩:</td>
						<td class="span3" align="left">${fence.endB}</td>
					</tr>
					<tr>
						<td class="span2" align="center">速度区段:</td>
						<td class="span3" align="left">${fence.speed}</td>
						<td class="span2" align="center">是否安设刺丝滚笼:</td>
						<td class="span3" align="left">${fence.flag}</td>
					</tr>
					<tr>
						<td class="span2" align="center">栅栏安设年度:</td>
						<td class="span3" align="left">${fence.builtYear}</td>
						<td class="span2" align="center">栅栏门数量:</td>
						<td class="span3" align="left">${fence.stockadeNum}</td>
					</tr>
					<tr>
						
						<td class="span2" align="center">附注:</td>
						<td class="span3" align="left">${fence.note}</td>
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