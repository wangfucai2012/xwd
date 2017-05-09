<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>桩基管理</title>
<meta name="decorator" content="default"/>
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
</head>
<body>
<ul class="nav nav-tabs">
		<li ><a href="${ctx}/data/work/pile?catalog=${pile.cat.id}">桩基列表</a></li>
		<li class="active"><a href="#">桩基信息</a></li>
</ul>
<div class="tabbable">
	<ul class="nav nav-tabs2">
	    <li class="active"><a href="#tab2" data-toggle="tab">桩基信息</a></li>
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
						<td class="span3" align="left">${pile.bridge.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${pile.bridge.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${pile.bridge.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${pile.bridge.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${pile.bridge.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${pile.bridge.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${pile.bridge.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${pile.bridge.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pile.bridge.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${pile.bridge.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${pile.bridge.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${pile.bridge.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${pile.bridge.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${pile.bridge.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${pile.bridge.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${pile.bridge.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${pile.bridge.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${pile.bridge.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${pile.bridge.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${pile.bridge.ass.startDate}</td>
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
						<td class="span3" align="left">${pile.bridgename}</td>
						<td class="span2" align="center">所在墩身:</td>
						<td class="span3" align="left">${pile.pier.pnumber}</td>
						
					</tr>
					<tr>
					    <td class="span2" align="center">钻孔数:</td>
						<td class="span3" align="left">${pile.pnumber}</td>
						<td class="span2" align="center">钻孔直径:</td>
						<td class="span3" align="left">${pile.diaM}</td>
						
					</tr>
					<tr>
					    <td class="span2" align="center">钻孔长:</td>
						<td class="span3" align="left">${pile.dlength}</td>
						<td class="span2" align="center">桩基排列:</td>
						<td class="span3" align="left">${pile.array}</td>
						
					</tr>
					<tr>
					    <td class="span2" align="center">桩基圬工方:</td>
						<td class="span3" align="left">${pile.loss}</td>
						<td class="span2" align="center">中心里程:</td>
						<td class="span3" align="left">${pile.centerM}</td>
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
						<td class="span3" align="left">${pile.bridge.lineName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">桥编号:</td>
						<td class="span3" align="left">${pile.bridge.bridgeNo}</td>
						
						<td class="span3" align="center">桥名:</td>
						<td class="span3" align="left">${pile.bridge.bridgeName}</td>
					</tr>
					<tr>
						<td class="span3" align="center">中心里程:</td>
						<td class="span3" align="left">${pile.bridge.centerM}</td>
						
						<td class="span3" align="center">长度:</td>
						<td class="span3" align="left">${pile.bridge.length}</td>
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