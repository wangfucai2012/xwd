<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>铁跨铁管理</title>
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
		<li><a href="${ctx}/data/work/railwaycrossesrailway?catalog=${railwayCrossesRailway.cat.id}">铁跨铁列表</a></li>
		<li class="active"><a href="#">铁跨铁信息</a></li>
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
						<td class="span3" align="left">${railwayCrossesRailway.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${railwayCrossesRailway.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${railwayCrossesRailway.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${railwayCrossesRailway.ass.startDate}</td>
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
						<td class="span3" align="left">${railwayCrossesRailway.lineName}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${railwayCrossesRailway.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">桥名:</td>
						<td class="span3" align="left">${railwayCrossesRailway.bridgeName}</td>
						<td class="span2" align="center">桥中心里程:</td>
						<td class="span3" align="left">${railwayCrossesRailway.centerM}</td>
					</tr>
					<tr>
						<td class="span2" align="center">孔跨式样:</td>
						<td class="span3" align="left">${railwayCrossesRailway.otype}</td>
						<td class="span2" align="center">区间:</td>
						<td class="span3" align="left">${railwayCrossesRailway.interval}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">桥下线名:</td>
						<td class="span3" align="left">${railwayCrossesRailway.downRoadName}</td>
						<td class="span2" align="center">桥下里程:</td>
						<td class="span3" align="left">${railwayCrossesRailway.downRoadM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">穿越桥孔:</td>
						<td class="span3" align="left">${railwayCrossesRailway.throughO}</td>
                        <td class="span2" align="center">穿越桥孔中心里程:</td>
						<td class="span3" align="left">${railwayCrossesRailway.throughOMiddleM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">桥下线路区间:</td>
						<td class="span3" align="left">${railwayCrossesRailway.downRoadInterval}</td>
						<td class="span2" align="center">备注（设备单位）:</td>
						<td class="span3" align="left">${railwayCrossesRailway.note}</td>
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