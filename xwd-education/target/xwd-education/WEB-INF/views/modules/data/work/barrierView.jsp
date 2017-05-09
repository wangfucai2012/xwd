<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>隔离网管理</title>
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
		<li ><a href="${ctx}/data/work/barrier?catalog=${barrier.led.id}">屏障列表</a></li>
		<li class="active"><a href="#">屏障信息</a></li>
</ul>
<div class="tabbable">
  <ul class="nav nav-tabs2">
    <li class="active"><a href="#tab2" data-toggle="tab">屏障信息</a></li>
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
						<td class="span3" align="left">${barrier.ass.name}</td>
						
						<td class="span3" align="center">编号:</td>
						<td class="span3" align="left">${barrier.ass.assetCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">卡  片  号:</td>
						<td class="span3"  colspan="3" align="left">${barrier.ass.cardCode}</td>
					</tr>
					<tr>
						<td class="span3" align="center">计量单位:</td>
						<td class="span3" align="left">${barrier.ass.unit}</td>
						
						<td class="span3" align="center">数量:</td>
						<td class="span3" align="left">${barrier.ass.assetNum}</td>
					</tr>
					<tr>
						<td class="span3" align="center">规格型号:</td>
						<td class="span3" align="left">${barrier.ass.specification}</td>
						
						<td class="span3" align="center">技术证书号:</td>
						<td class="span3" align="left">${barrier.ass.certificateNo}</td>
					</tr>
					<tr>
						<td class="span3" align="center">固定资产入账价值:</td>
						<td class="span3" align="left">${barrier.ass.orgAssetValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${barrier.ass.orgFabricateValue}</td>
					</tr>
					<tr>
						<td class="span3" align="center">重估后原值:</td>
						<td class="span3" align="left">${barrier.ass.reValue}</td>
						
						<td class="span3" align="center">其中：安装费:</td>
						<td class="span3" align="left">${barrier.ass.reFabricate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">建造单位:</td>
						<td class="span3" align="left">${barrier.ass.constructCompany}</td>
						
						<td class="span3" align="center">建造年月:</td>
						<td class="span3" align="left">${barrier.ass.constructDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">出厂编号:</td>
						<td class="span3" align="left">${barrier.ass.constructNo}</td>
						
						<td class="span3" align="center">交付使用日期:</td>
						<td class="span3" align="left">${barrier.ass.deliveryDate}</td>
					</tr>
					<tr>
						<td class="span3" align="center">预计使用年限:</td>
						<td class="span3" colspan="3" align="left">${barrier.ass.expectUsingTime}</td>
						
					</tr>
					<tr>
						<td class="span3" align="center">预计净残值:</td>
						<td class="span3" align="left">${barrier.ass.expectsalvage}</td>
						
						<td class="span3" align="center">使用状态:</td>
						<td class="span3" align="left">${barrier.ass.usingState}</td>
					</tr>
					<tr>
						<td class="span3" align="center">折  旧  率:</td>
						<td class="span3" align="left">${barrier.ass.depreciation}</td>
						
						<td class="span3" align="center">起始日期:</td>
						<td class="span3" align="left">${barrier.ass.startDate}</td>
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
						<td class="span2" align="center">车间:</td>
						<td class="span3" align="left">${barrier.department}</td>
						<td class="span2" align="center">线名:</td>
						<td class="span3" align="left">${barrier.lineName}</td>
					</tr>
					<tr>
						<td class="span2" align="center">行别:</td>
						<td class="span3" align="left">${barrier.stream}</td>
						<td class="span2" align="center">屏障长度:</td>
						<td class="span3" align="left">${barrier.length}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">屏障高度:</td>
						<td class="span3" align="left">${barrier.height}</td>
						<td class="span2" align="center">屏障起里程:</td>
						<td class="span3" align="left">${barrier.startM}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">屏障止里程:</td>
						<td class="span3" align="left">${barrier.endM}</td>
						<td class="span2" align="center">位置:</td>
						<td class="span3" align="left">${barrier.locate}</td>
					</tr>
					<tr>
					    <td class="span2" align="center">备注:</td>
						<td class="span3" align="left">${barrier.remark}</td>
						<td class="span2" align="center"></td>
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