<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>墩身管理</title>
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
		<li ><a href="${ctx}/data/work/pier?catalog=${pier.cat.id}">墩身列表</a></li>
		<li class="active"><a href="#">墩身信息</a></li>
</ul>
<div class="tabbable">
  <ul class="nav nav-tabs2">
    <li class="active"><a href="#tab2" data-toggle="tab">墩身信息</a></li>
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
						<td class="span3" align="left">${pier.bridge.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${pier.bridge.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${pier.bridge.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${pier.bridge.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${pier.bridge.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${pier.bridge.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${pier.bridge.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${pier.bridge.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pier.bridge.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${pier.bridge.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pier.bridge.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${pier.bridge.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${pier.bridge.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${pier.bridge.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${pier.bridge.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${pier.bridge.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${pier.bridge.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${pier.bridge.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${pier.bridge.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${pier.bridge.ass.startDate}</td>
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
						<td class="span2" align="center">桥梁名称:</td>
						<td class="span3" align="left">${pier.bridge.bridgeName}</td>
						<td class="span2" align="center">墩台号:</td>
						<td class="span3" align="left">${pier.pnumber}</td>
					</tr>
					<tr>
						<td class="span2" align="center">墩身类型:</td>
						<td class="span3" align="left">${pier.type}</td>
						<td class="span2" align="center">墩身长宽高:</td>
						<td class="span3" align="left">${pier.hwd}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">是否空心:</td>
						<td class="span3" align="left">${pier.hollow}</td>
						<td class="span2" align="center">空心宽度:</td>
						<td class="span3" align="left">${pier.hwidth}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">墩身圬工方:</td>
						<td class="span3" align="left">${pier.loss}</td>
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left">${pier.centerM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">孔别:</td>
						<td class="span3" align="left">${pier.hole}</td>
						<td class="span2" align="center">墩顶高:</td>
						<td class="span3" align="left">${pier.topHeight}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">墩基底高:</td>
						<td class="span3" align="left">${pier.baseHeight}</td>
						<td class="span2" align="center">墩台定型图号:</td>
						<td class="span3" align="left">${pier.drawNo}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">最大冲刷线:</td>
						<td class="span3" align="left">${pier.maxScourline}</td>
						<td class="span2" align="center">墩材质:</td>
						<td class="span3" align="left">${pier.material}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">墩基础式样:</td>
						<td class="span3" align="left">${pier.baseType}</td>
						<td class="span2" align="center">墩基础材质:</td>
						<td class="span3" align="left">${pier.basematerial}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">墩基底地质:</td>
						<td class="span3" align="left" >${pier.baseGeology}</td>
						<td class="span2" align="center"></td>
						<td class="span3" align="left" ></td>
					</tr>
					<!--  <tr>
					  	<td class="span2" colspan="4" align="center">
						<div style="overflow-x:scroll; width: 100%;height: 300px;">
						<c:forEach items="${pier.imgAttach}" var="imagefile">
					 		 <img src="${ctx}/sys/attachment/downloadImage?id=${imagefile.id}" style="width: 450px; height: 300px;"/>
						</c:forEach>
				</div>
				</td>
					</tr>  -->
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
						<td class="span3" align="left">${pier.bridge.lineName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">桥编号:</td>
						<td class="span3" align="left">${pier.bridge.bridgeNo}</td>
						
						<td class="span3" align="center">桥名:</td>
						<td class="span3" align="left">${pier.bridge.bridgeName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">中心里程:</td>
						<td class="span3" align="left">${pier.bridge.centerM}</td>
						
						<td class="span3" align="center">长度:</td>
						<td class="span3" align="left">${pier.bridge.length}</td>
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