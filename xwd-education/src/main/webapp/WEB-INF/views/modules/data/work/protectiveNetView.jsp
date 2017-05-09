<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>防护网管理</title>
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
		<li><a href="${ctx}/data/work/protectivenet?catalog=${protectiveNet.cat.id}">防护网列表</a></li>
		<li class="active"><a href="#">防护网信息</a></li>
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
						<td class="span3" align="left">${protectiveNet.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${protectiveNet.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${protectiveNet.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${protectiveNet.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${protectiveNet.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${protectiveNet.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${protectiveNet.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${protectiveNet.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${protectiveNet.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${protectiveNet.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${protectiveNet.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${protectiveNet.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${protectiveNet.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${protectiveNet.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${protectiveNet.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${protectiveNet.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${protectiveNet.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${protectiveNet.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${protectiveNet.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${protectiveNet.ass.startDate}</td>
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
						<td class="span3" align="left">${protectiveNet.lineType}</td>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${protectiveNet.stream}</td>
					</tr>
					<tr>
						<td class="span2" align="center">侧别:</td>
						<td class="span3" align="left">${protectiveNet.sideStream}</td>
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left">${protectiveNet.middleM}</td>
					</tr>
					<tr>
						<td class="span2" align="center">总长度:</td>
						<td class="span3" align="left">${protectiveNet.length}</td>
						<td class="span2" align="center">生产日期:</td>
						<td class="span3" align="left">${protectiveNet.produceDate}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left">${protectiveNet.startM}</td>
						<td class="span2" align="center">终止里程:</td>
						<td class="span3" align="left">${protectiveNet.endM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">材质:</td>
						<td class="span3" align="left">${protectiveNet.material}</td>
                        <td class="span2" align="center">制作单位:</td>
						<td class="span3" align="left">${protectiveNet.madeCompany}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">柱间距:</td>
						<td class="span3" align="left">${protectiveNet.columnSpace}</td>
						<td class="span2" align="center">防护网规格:</td>
						<td class="span3" align="left">${protectiveNet.specification}</td>
					</tr>
					<tr>
						<td class="span2" align="center">竣工日期:</td>
						<td class="span3" align="left">${protectiveNet.endDate}</td>
						<td class="span2" align="center">与栅栏间距:</td>
						<td class="span3" align="left">${protectiveNet.fenceSpan}</td>
					</tr>
					<tr>
						<td class="span2" align="center">位置:</td>
						<td class="span3" align="left">${protectiveNet.position}</td>
						<td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${protectiveNet.note}</td>
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