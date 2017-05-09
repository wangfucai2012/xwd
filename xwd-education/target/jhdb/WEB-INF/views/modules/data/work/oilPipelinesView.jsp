<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>油气管线管理</title>
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
		<li><a href="${ctx}/data/work/oilpipelines?catalog=${oilPipelines.cat.id}">油管线列表</a></li>
		<li class="active"><a href="#">油管线信息</a></li>
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
						<td class="span3" align="left">${oilPipelines.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${oilPipelines.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${oilPipelines.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${oilPipelines.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${oilPipelines.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${oilPipelines.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${oilPipelines.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${oilPipelines.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${oilPipelines.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${oilPipelines.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${oilPipelines.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${oilPipelines.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${oilPipelines.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${oilPipelines.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${oilPipelines.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${oilPipelines.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${oilPipelines.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${oilPipelines.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${oilPipelines.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${oilPipelines.ass.startDate}</td>
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
						<td class="span2" align="center">线别:</td>
						<td class="span3" align="left">${oilPipelines.lineType}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${oilPipelines.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">墩号:</td>
						<td class="span3" align="left">${oilPipelines.dNumber}</td>
						<td class="span2" align="center">桥涵孔跨式样/路基:</td>
						<td class="span3" align="left">${oilPipelines.subgrade}</td>
					</tr>
					<tr>
						<td class="span2" align="center">管线中心里程:</td>
						<td class="span3" align="left">${oilPipelines.centerM}</td>
						<td class="span2" align="center">输送介质:</td>
						<td class="span3" align="left">${oilPipelines.medium}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">通过方式:</td>
						<td class="span3" align="left">${oilPipelines.throughWay}</td>
						<td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${oilPipelines.note}</td>
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