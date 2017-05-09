<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>管线管理</title>
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
		<li><a href="${ctx}/data/work/pipelines?catalog=${pipeLines.cat.id}">管线列表</a></li>
		<li class="active"><a href="#">管线信息</a></li>
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
						<td class="span3" align="left">${pipeLines.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${pipeLines.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${pipeLines.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${pipeLines.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${pipeLines.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${pipeLines.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${pipeLines.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${pipeLines.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pipeLines.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${pipeLines.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pipeLines.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${pipeLines.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${pipeLines.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${pipeLines.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${pipeLines.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${pipeLines.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${pipeLines.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${pipeLines.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${pipeLines.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${pipeLines.ass.startDate}</td>
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
						<td class="span3" align="left">${pipeLines.lineType}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${pipeLines.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">孔别:</td>
						<td class="span3" align="left">${pipeLines.oType}</td>
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left">${pipeLines.centerM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">桥涵孔跨式样/路基:</td>
						<td class="span3" align="left">${pipeLines.subgrade}</td>
						<td class="span2" align="center"> 管线名称:</td>
						<td class="span3" align="left">${pipeLines.lineName}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">通过方式:</td>
						<td class="span3" align="left">${pipeLines.throughWay}</td>
                        <td class="span2" align="center">管线主要参数:</td>
						<td class="span3" align="left">${pipeLines.lineparam}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">管线埋深（自然地面下）m:</td>
						<td class="span3" align="left">${pipeLines.depth}</td>
						<td class="span2" align="center">类型:</td>
						<td class="span3" align="left">${pipeLines.type}</td>
					</tr>
					<tr>
						<td class="span2" align="center">横截面（长×宽、直径）米:</td>
						<td class="span3" align="left">${pipeLines.section}</td>
						<td class="span2" align="center">出口距坡脚水平距离/米 :</td>
						<td class="span3" align="left">${pipeLines.horizontalDistance}</td>
					</tr>
					<tr>
						<td class="span2" align="center">距轨顶垂直距离/米:</td>
						<td class="span3" align="left">${pipeLines.verticalDistance}</td>
						<td class="span2" align="center">管线使用年限:</td>
						<td class="span3" align="left">${pipeLines.useYears}</td>
					</tr>
					<tr>
						<td class="span2" align="center">报废时处理办法:</td>
						<td class="span3" align="left">${pipeLines.scrapProcessing}</td>
						<td class="span2" align="center">目前保护设施技术状态:</td>
						<td class="span3" align="left">${pipeLines.protectStatus}</td>
					</tr>
					<tr>
						<td class="span2" align="center">申请单位:</td>
						<td class="span3" align="left">${pipeLines.applyDivision}</td>
						<td class="span2" align="center">产权单位:</td>
						<td class="span3" align="left">${pipeLines.equityDivision}</td>
					</tr>
					<tr>
						<td class="span2" align="center">管线养护维修单位:</td>
						<td class="span3" align="left">${pipeLines.repairDivision}</td>
						<td class="span2" align="center">目前保护设施技术状态:</td>
						<td class="span3" align="left">${pipeLines.protectStatus}</td>
					</tr>
					<tr>
						<td class="span2" align="center">施工单位:</td>
						<td class="span3" align="left">${pipeLines.workDivision}</td>
						<td class="span2" align="center">审批单位:</td>
						<td class="span3" align="left">${pipeLines.examineDivision}</td>
					</tr>
					<tr>
						<td class="span2" align="center">审批时间:</td>
						<td class="span3" align="left">${pipeLines.examineTime}</td>
						<td class="span2" align="center">工务段经办人:</td>
						<td class="span3" align="left">${pipeLines.agent}</td>
					</tr>
					<tr>
						<td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${pipeLines.note}</td>
					
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