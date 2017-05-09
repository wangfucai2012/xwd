<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>桥面管理</title>
<style type="text/css">.table td i{margin:0 2px;}</style>
	<script type="text/javascript" src="${ctx}/static/jquery-fancybox/1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/static/jquery-fancybox/1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/jquery-fancybox/1.3.4/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<link rel="stylesheet" href="${ctx}/static/jquery-fancybox/1.3.4/style.css" />
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
			$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
		});
	</script>

<meta name="decorator" content="default"/>
</head>
<body>
<ul class="nav nav-tabs">
		<li><a href="${ctx}/data/work/grider?catalog=${grider.cat.id}">梁面列表</a></li>
		<li class="active"><a href="#">梁面信息</a></li>
</ul>
<div class="tabbable">
  <ul class="nav nav-tabs2">
    <li class="active"><a href="#tab2" data-toggle="tab">梁面信息</a></li>
    <li><a href="#tab1" data-toggle="tab">所属桥梁</a></li>
    <li><a href="#tab3" data-toggle="tab">所属固资</a></li>
  </ul>
  <div class="cs-detial1"> <!-- Only required for left/right tabs -->
    <div class="tab-content">
           <div class="tab-pane " id="tab3">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td class="span3" align="center">固定资产名称:</td>
						<td class="span3" align="left">${grider.bridge.ass.name}</td>
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${grider.bridge.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${grider.bridge.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${grider.bridge.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${grider.bridge.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${grider.bridge.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${grider.bridge.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${grider.bridge.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${grider.bridge.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${grider.bridge.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${grider.bridge.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${grider.bridge.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${grider.bridge.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${grider.bridge.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${grider.bridge.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${grider.bridge.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${grider.bridge.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${grider.bridge.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${grider.bridge.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${grider.bridge.ass.startDate}</td>
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
			<div class="tab-pane active" id="tab2">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td class="span3" align="center">桥梁名称:</td>
						<td class="span3" align="left">${grider.bridgename}</td>
						<td class="span3" align="center">所属墩身:</td>
						<td class="span3" align="left">${grider.pier.type}</td>
					</tr>
					<tr>
					     <td class="span3" align="center">梁面分类:</td>
						<td class="span3" align="left">${grider.type}</td>
						<td class="span3" align="center">梁长:</td>
						<td class="span3" align="left">${grider.length}</td>
						
					</tr>
					<tr>
					    <td class="span3" align="center">缝宽:</td>
						<td class="span3" align="left">${grider.sildwidth}</td>
					    <td class="span3" align="center">梁宽:</td>
						<td class="span3" align="left">${grider.width}</td>
						
					</tr>
					<tr>
					    <td class="span3" align="center">梁标高:</td>
						<td class="span3" align="left">${grider.height}</td>
					    <td class="span3" align="center">梁圬工方:</td>
						<td class="span3" align="left">${grider.loss}</td>
						
					</tr>
					<tr>
					    <td class="span3" align="center">起始里程:</td>
						<td class="span3" align="left">${grider.startM}</td>
					    <td class="span3" align="center">终点里程:</td>
						<td class="span3" align="left">${grider.endM}</td>
						
					</tr>
					<tr>
					    <td class="span3" align="center">中心里程:</td>
						<td class="span3" align="left">${grider.centerM}</td>
						<td class="span3" align="center">跨度:</td>
						<td class="span3" align="left">${grider.spans}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">换梁年代:</td>
						<td class="span3" align="left">${grider.changeYear}</td>
						<td class="span3" align="center">梁式样:</td>
						<td class="span3" align="left">${grider.pattern}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">梁式样代码:</td>
						<td class="span3" align="left">${grider.patternCode}</td>
						<td class="span3" align="center">梁底高:</td>
						<td class="span3" align="left">${grider.baseHeight}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">孔别:</td>
						<td class="span3" align="left">${grider.hole}</td>
						<td class="span3" align="center">枕铺设年度:</td>
						<td class="span3" align="left">${grider.layYear}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">定型图号:</td>
						<td class="span3" align="left">${grider.drawNo}</td>
						<td class="span3" align="center">设计限界:</td>
						<td class="span3" align="left">${grider.designLimits}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">梁种类:</td>
						<td class="span3" align="left">${grider.kinds}</td>
						<td class="span3" align="center">净孔:</td>
						<td class="span3" align="left">${grider.clearHole}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">梁重:</td>
						<td class="span3" align="left">${grider.weight}</td>
						<td class="span3" align="center">体积:</td>
						<td class="span3" align="left">${grider.volume}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">主梁中心距:</td>
						<td class="span3" align="left">${grider.maincenterSpace}</td>
						<td class="span3" align="center">纵梁中心距:</td>
						<td class="span3" align="left">${grider.ordinatecenterSpace}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">纵梁高:</td>
						<td class="span3" align="left">${grider.ordinateHeight}</td>
						<td class="span3" align="center">设计活载:</td>
						<td class="span3" align="left">${grider.desliveload}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">承载系数:</td>
						<td class="span3" align="left">${grider.carryCoefficient}</td>
						<td class="span3" align="center">控制部位:</td>
						<td class="span3" align="left">${grider.controlPostion}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">钢梁涂装年:</td>
						<td class="span3" align="left">${grider.paintingYear}</td>
						<td class="span3" align="center">挠度:</td>
						<td class="span3" align="left">${grider.bend}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">扣件类型:</td>
						<td class="span3" align="left">${grider.fastenerType}</td>
						<td class="span3" align="center">扣件数量:</td>
						<td class="span3" align="left">${grider.fastenerNum}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">轨枕类型:</td>
						<td class="span3" align="left">${grider.plateType}</td>
						<td class="span3" align="center">轨枕数量:</td>
						<td class="span3" align="left">${grider.plateNum}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">钢轨类型:</td>
						<td class="span3" align="left">${grider.steelrailType}</td>
						<td class="span3" align="center">钢梁振幅超限加固:</td>
						<td class="span3" align="left">${grider.glzfcxjg}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">混凝土梁横隔板数:</td>
						<td class="span3" align="left">${grider.rcbulkNum}</td>
						<td class="span3" align="center">混凝土梁横隔板连接:</td>
						<td class="span3" align="left">${grider.rcbulkJoin}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">梁端限位装置:</td>
						<td class="span3" align="left">${grider.limitEq}</td>
						<td class="span3" align="center">混凝土并置梁加固:</td>
						<td class="span3" align="left">${grider.rcbzljg}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">道碴槽宽度:</td>
						<td class="span3" align="left">${grider.dzcwidth}</td>
						<td class="span3" align="center">圬工梁跨中道碴厚度:</td>
						<td class="span3" align="left">${grider.thickness}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">人行道材质:</td>
						<td class="span3" align="left">${grider.footwalkMaterial}</td>
						<td class="span3" align="center">人行道宽:</td>
						<td class="span3" align="left">${grider.footwalkWidth}</td>
					</tr>
					<tr>
					    <td class="span3" align="center">固定检查设备:</td>
						<td class="span3" align="left">${grider.fixcheckEq}</td>
						<td class="span3" align="center">公铁两用:</td>
						<td class="span3" align="left">${grider.gtly}</td>
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
			<div class="tab-pane " id="tab1">
			<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="1" bgcolor="#dddddd">
				<tbody>
					<tr>
						<td class="span3" align="center">所属路局:</td>
						<td class="span3" align="left">济南局</td>
						
						<td class="span3" align="center">线路名称:</td>
						<td class="span3" align="left">${grider.bridge.lineName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">桥编号:</td>
						<td class="span3" align="left">${grider.bridge.bridgeNo}</td>
						
						<td class="span3" align="center">桥名:</td>
						<td class="span3" align="left">${grider.bridge.bridgeName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">中心里程:</td>
						<td class="span3" align="left">${grider.bridge.centerM}</td>
						
						<td class="span3" align="center">长度:</td>
						<td class="span3" align="left">${grider.bridge.length}</td>
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
  </div>	
	
			</div>
		</div>
			
</body>
</html>