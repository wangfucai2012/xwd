<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公跨铁管理</title>
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
		<li><a href="${ctx}/data/work/highwaycrossesrailroad?catalog=${highwayCrossesRailroad.cat.id}">公跨铁列表</a></li>
		<li class="active"><a href="#">公跨铁信息</a></li>
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
						<td class="span3" align="left">${highwayCrossesRailroad.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${highwayCrossesRailroad.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${highwayCrossesRailroad.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ass.startDate}</td>
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
						<td class="span3" align="left">${highwayCrossesRailroad.lineName}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">铁路里程:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.mile}</td>
						<td class="span2" align="center">桥涵孔跨式样:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.otype}</td>
					</tr>
					<tr>
						<td class="span2" align="center">孔别:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.ostream}</td>
						<td class="span2" align="center">跨度:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.span}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">上跨桥宽:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.bridgeWide}</td>
						<td class="span2" align="center">上行:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.upside}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">下行:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.downside}</td>
                        <td class="span2" align="center">建成年度:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.builtYear}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">所在道路等级:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.roadLevel}</td>
						<td class="span2" align="center">所在道路名称:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.roadName}</td>
					</tr>
					<tr>
						<td class="span2" align="center">管理部门:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.manDepartment}</td>
						<td class="span2" align="center">防护桩:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.protection}</td>
					</tr>
					<tr>
						<td class="span2" align="center">防撞设施高度:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.fzHeight}</td>
						<td class="span2" align="center">防撞设施类型:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.fzType}</td>
					</tr>
					<tr>
						<td class="span2" align="center">防护网高度:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.protectNetHeight}</td>
						<td class="span2" align="center">水平长度(m)左:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.lengthLeft}</td>
					</tr>
					<tr>
						<td class="span2" align="center">水平长度(m)右:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.lengthRight}</td>
						<td class="span2" align="center">限制通行车辆总重:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.weight}</td>
					</tr>
					<tr>
						<td class="span2" align="center">限制速度:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.limitSpeed}</td>
						<td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${highwayCrossesRailroad.note}</td>
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