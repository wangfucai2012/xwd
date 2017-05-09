<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>公铁并行管理</title>
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
		<li><a href="${ctx}/data/work/roadrailparallel?catalog=${roadRailParallel.cat.id}">并行列表</a></li>
		<li class="active"><a href="#">并行信息</a></li>
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
						<td class="span3" align="left">${roadRailParallel.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${roadRailParallel.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${roadRailParallel.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${roadRailParallel.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${roadRailParallel.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${roadRailParallel.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${roadRailParallel.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${roadRailParallel.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${roadRailParallel.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${roadRailParallel.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${roadRailParallel.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${roadRailParallel.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${roadRailParallel.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${roadRailParallel.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${roadRailParallel.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${roadRailParallel.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${roadRailParallel.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${roadRailParallel.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${roadRailParallel.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${roadRailParallel.ass.startDate}</td>
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
						<td class="span3" align="left">${roadRailParallel.lineName}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${roadRailParallel.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">侧别:</td>
						<td class="span3" align="left">${roadRailParallel.sideStream}</td>
						<td class="span2" align="center">区间:</td>
						<td class="span3" align="left">${roadRailParallel.interval}</td>
					</tr>
					<tr>
						<td class="span2" align="center">长度:</td>
						<td class="span3" align="left">${roadRailParallel.mipLength}</td>
						<td class="span2" align="center">最大高差:</td>
						<td class="span3" align="left">${roadRailParallel.mixHeight}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left">${roadRailParallel.startM}</td>
						<td class="span2" align="center">终止里程:</td>
						<td class="span3" align="left">${roadRailParallel.endM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">水平距离:</td>
						<td class="span3" align="left">${roadRailParallel.downside}</td>
                        <td class="span2" align="center">路基类型:</td>
						<td class="span3" align="left">${roadRailParallel.subgradeType}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">防护设施类型:</td>
						<td class="span3" align="left">${roadRailParallel.protectLevel}</td>
						<td class="span2" align="center">防撞等级:</td>
						<td class="span3" align="left">${roadRailParallel.fzlevel}</td>
					</tr>
					<tr>
						<td class="span2" align="center">道路类别:</td>
						<td class="span3" align="left">${roadRailParallel.wayType}</td>
						<td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${roadRailParallel.note}</td>
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