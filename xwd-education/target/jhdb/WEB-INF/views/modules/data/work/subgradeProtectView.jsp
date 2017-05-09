<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>路基防护管理</title>
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
<form:hidden path="subgradeProtect.cat.id"/>
<ul class="nav nav-tabs">
		<li ><a href="${ctx}/data/work/subgradeprotect?catalog=${subgradeProtect.cat.id}">防护列表</a></li>
		<li class="active" ><a href="#">防护信息</a></li>
	</ul>
	<div class="tabbable">
  <ul class="nav nav-tabs2">
    <li class="active"><a href="#tab2" data-toggle="tab">防护信息</a></li>
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
						<td class="span3" align="left">${subgradeProtect.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${subgradeProtect.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${subgradeProtect.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${subgradeProtect.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${subgradeProtect.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${subgradeProtect.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${subgradeProtect.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${subgradeProtect.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${subgradeProtect.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${subgradeProtect.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${subgradeProtect.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${subgradeProtect.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${subgradeProtect.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${subgradeProtect.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${subgradeProtect.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${subgradeProtect.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${subgradeProtect.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${subgradeProtect.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${subgradeProtect.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${subgradeProtect.ass.startDate}</td>
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
						<td class="span3" align="center">线名:</td>
						<td class="span3" align="left">${subgradeProtect.lineName}</td>
						
						<td class="span3" align="center">行别:</td>
						<td class="span3" align="left">${subgradeProtect.stream}</td>
					</tr>
					<tr>
						<td class="span3" align="center">起点里程:</td>
						<td class="span3" align="left">${subgradeProtect.startM}</td>
						
						<td class="span3" align="center">终点里程:</td>
						<td class="span3" align="left">${subgradeProtect.endM}</td>
					</tr>
					<tr>
						<td class="span3" align="center">长度:</td>
						<td class="span3" align="left">${subgradeProtect.length}</td>
						
						<td class="span3" align="center">路基形式:</td>
						<td class="span3" align="left">${subgradeProtect.type}</td>
					</tr>
					<tr>
						<td class="span3" align="center">加固形式:</td>
						<td class="span3" align="left">${subgradeProtect.reinforce}</td>
						
						<td class="span3" align="center">最大坡长:</td>
						<td class="span3" align="left">${subgradeProtect.slopeL}</td>
					</tr>
					<tr>
						<td class="span3" align="center">最大坡长里程:</td>
						<td class="span3" align="left">${subgradeProtect.slopeM}</td>
						
						<td class="span3" align="center"></td>
						<td class="span3" align="left"></td>
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
