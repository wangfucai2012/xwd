<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-24
  Time: 下午2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>管理系统</title>
</head>
<body>

<ul class="nav nav-tabs">
</ul>

	<form id="inputForm" action="${ctx}/workdataimport/importPier" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择墩台数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>

	<form id="inputForm" action="${ctx}/workdataimport/importBarrier" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择屏障数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importBearingplatform" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择承台数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importCorridor" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择应急疏散通道数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importCulvert" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择涵洞数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importFence" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择栅栏数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importFenceGate" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择栅栏门数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importGrider" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择梁数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importHeightLimitProFrame" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择限高防护架数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importPile" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择桩基数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importPipelines" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择管线数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importPrecisecontnet" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择精密防护网数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importRailwayCrossesRailway" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择铁跨铁数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importRoadRailParallel" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择公铁并行数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSecurityZoneSigns" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择安保区标桩数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSleeper" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择轨道板数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSteelRail" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择钢轨数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSubgrade" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择路基数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSubgradeDrainage" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择路基排水数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importSubgradProtect" method="post" enctype="multipart/form-data">
        <tr>
            <td class="span2">请选择路基防护数据文件:</td>
            <td colspan="3" align="left">
                <input class="multi" type="file" name="pierfile" size="60" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
            </td>
        </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importTunel" method="post" enctype="multipart/form-data">
          <tr>
              <td class="span2">请选择隧道数据文件:</td>
              <td colspan="3" align="left">
                  <input class="multi" type="file" name="pierfile" size="60" />
              </td>
          </tr>
          <tr>
              <td colspan="2">
                  <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
              </td>
          </tr>
	</form>
	
	<form id="inputForm" action="${ctx}/workdataimport/importTestData" method="post" enctype="multipart/form-data">
          <tr>
              <td class="span2">请选择测试数据文件:</td>
              <td colspan="3" align="left">
                  <input class="multi" type="file" name="pierfile" size="60" />
              </td>
          </tr>
          <tr>
              <td colspan="2">
                  <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
              </td>
          </tr>
	</form>

</body>
</html>