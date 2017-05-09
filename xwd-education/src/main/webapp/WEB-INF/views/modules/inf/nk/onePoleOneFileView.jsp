<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>一杆一档基础数据表</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">.table td i{margin:0 2px;}</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".cs-detial1 tbody").find("tr:odd").css("background-color", "#eff8ff");
			$(".cs-detial1 tbody").find("tr:even").css("background-color", "#fff");
		});
	</script>
</head>

<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/inf/nk/onepoleonefile/list/">一杆一档基础数据表列表</a></li>
		<li class="active"><a href="#">一杆一档基础数据表信息</a></li>
	</ul>
	
  	<div class="cs-detail">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#dddddd"
				class="table table-striped table-bordered table-hover">
			<tbody>
				<tr>
					<td class="span2" align="center">区间(站场):</td>
					<td class="span3" align="left">${onePoleOneFile.block}</td>
					<td class="span2" align="center">部门名称:</td>
					<td class="span3" align="left">${onePoleOneFile.departmentName}</td>
				</tr>
				<tr>
					<td class="span2" align="center">支柱号:</td>
					<td class="span3" align="left">${onePoleOneFile.pole}</td>
					<td class="span2" align="center">设备编码:</td>
					<td class="span3" align="left">${onePoleOneFile.equipCode}</td>
				</tr>
				<tr>
					<td class="span2" align="center">股道号:</td>
					<td class="span3" align="left">${onePoleOneFile.trackNumber}</td>
					<td class="span2" align="center">线路条件:</td>
					<td class="span3" align="left">${onePoleOneFile.line}</td>
				</tr>
				<tr>
					<td class="span2" align="center">路面平面布置:</td>
					<td class="span3" align="left">${onePoleOneFile.levelLayout}</td>
					<td class="span2" align="center">里程:</td>
					<td class="span3" align="left">${onePoleOneFile.mileage}</td>
				</tr>
				<tr>
					<td class="span2" align="center">跨距:</td>
					<td class="span3" align="left">${onePoleOneFile.span}</td>
					<td class="span2" align="center">侧面限界:</td>
					<td class="span3" align="left">${onePoleOneFile.slopeLimit}</td>
				</tr>
				<tr>
					<td class="span2" align="center">外轨超高:</td>
					<td class="span3" align="left">${onePoleOneFile.outHeight}</td>
					<td class="span2" align="center">接触悬挂:</td>
					<td class="span3" align="left">${onePoleOneFile.touchSuspension}</td>
				</tr>
				<tr>
					<td class="span2" align="center">AF线:</td>
					<td class="span3" align="left">${onePoleOneFile.afLine}</td>
					<td class="span2" align="center">PW(回流)线:</td>
					<td class="span3" align="left">${onePoleOneFile.pwLine}</td>
				</tr>
				<tr>
					<td class="span2" align="center">JQ线:</td>
					<td class="span3" align="left">${onePoleOneFile.jqLine}</td>
					<td class="span2" align="center">供电线:</td>
					<td class="span3" align="left">${onePoleOneFile.supplierLine}</td>
				</tr>
				<tr>
					<td class="span2" align="center">吸上线:</td>
					<td class="span3" align="left">${onePoleOneFile.suckLine}</td>
					<td class="span2" align="center">隔离开关:</td>
					<td class="span3" align="left">${onePoleOneFile.insulateSwitch}</td>
				</tr>
				<tr>
					<td class="span2" align="center">避雷器:</td>
					<td class="span3" align="left">${onePoleOneFile.lightProtected}</td>
					<td class="span2" align="center">分段绝缘器:</td>
					<td class="span3" align="left">${onePoleOneFile.segInsulation}</td>
				</tr>
				<tr>
					<td class="span2" align="center">分相绝缘器:</td>
					<td class="span3" align="left">${onePoleOneFile.phaseInsulation}</td>
					<td class="span2" align="center">下锚装置:</td>
					<td class="span3" align="left">${onePoleOneFile.downAnchor}</td>
				</tr>
				<tr>
					<td class="span2" align="center">标志牌:</td>
					<td class="span3" align="left">${onePoleOneFile.brand}</td>
					<td class="span2" align="center">拉出值北京侧:</td>
					<td class="span3" align="left">${onePoleOneFile.pulloutBei}</td>
				</tr>
				<tr>
					<td class="span2" align="center">拉出值中间侧:</td>
					<td class="span3" align="left">${onePoleOneFile.pulloutMiddle}</td>
					<td class="span2" align="center">拉出值上海侧:</td>
					<td class="span3" align="left">${onePoleOneFile.pulloutShang}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设计导高北京侧:</td>
					<td class="span3" align="left">${onePoleOneFile.heightBei}</td>
					<td class="span2" align="center">设计导高中间侧:</td>
					<td class="span3" align="left">${onePoleOneFile.heightMiddle}</td>
				</tr>
				<tr>
					<td class="span2" align="center">设计导高上海侧:</td>
					<td class="span3" align="left">${onePoleOneFile.heightShang}</td>
					<td class="span2" align="center">创建时间:</td>
					<td class="span3" align="left">${onePoleOneFile.createTime}</td>
				</tr>
				<tr>
					<td class="span2" align="center">最后修改时间:</td>
					<td class="span3" align="left">${onePoleOneFile.modifyTime}</td>
					<td class="span2" align="center">NFC编码:</td>
					<td class="span3" align="left">${onePoleOneFile.nfcCode}</td>
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