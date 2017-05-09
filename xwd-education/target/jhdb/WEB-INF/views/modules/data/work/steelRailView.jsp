<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>钢轨管理</title>
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
</script>
</script>
<body>
<ul class="nav nav-tabs">
		<li ><a href="${ctx}/data/work/steelrail?catalog=${steelRail.cat.id}">钢轨列表</a></li>
		<li class="active"><a href="#">钢轨信息</a></li>
</ul>
<div class="tabbable">
  <ul class="nav nav-tabs2">
    <li class="active"><a href="#tab2" data-toggle="tab">钢轨信息</a></li>
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
						<td class="span3" align="left">${steelRail.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${steelRail.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${steelRail.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${steelRail.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${steelRail.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${steelRail.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${steelRail.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${steelRail.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${steelRail.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${steelRail.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${steelRail.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${steelRail.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${steelRail.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${steelRail.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${steelRail.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${steelRail.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${steelRail.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${steelRail.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${steelRail.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${steelRail.ass.startDate}</td>
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
						<td class="span2" align="center">线名:</td>
						<td class="span3" align="left">${steelRail.lineName}</td>
						<td class="span2" align="center">轨型:</td>
						<td class="span3" align="left">${steelRail.railType}</td>
					</tr>
					<tr>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${steelRail.stream}</td>
						<td class="span2" align="center">接头方式:</td>
						<td class="span3"  align="left">${steelRail.contackType}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">线别:</td>
						<td class="span3" align="left">${steelRail.lineType}</td>
						<td class="span2" align="center">运营状态:</td>
						<td class="span3" align="left">${steelRail.runState}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">起始里程:</td>
						<td class="span3" align="left">${steelRail.startMile}</td>
						<td class="span2" align="center">终止里程:</td>
						<td class="span3" align="left">${steelRail.endMile}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">长链标记:</td>
						<td class="span3" align="left">${steelRail.chainMarker}</td>
						<td class="span2" align="center">单根轨长米:</td>
						<td class="span3" align="left">${steelRail.raillength}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">轨距类型:</td>
						<td class="span3" align="left">${steelRail.gaugeType}</td>
						<td class="span2" align="center">钢种:</td>
						<td class="span3" align="left">${steelRail.steelType}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">生产厂商:</td>
						<td class="span3" align="left">${steelRail.maker}</td>
						<td class="span2" align="center">生产年度:</td>
						<td class="span3" align="left">${steelRail.makerYear}</td>
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