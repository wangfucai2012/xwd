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

<form id="inputForm" action="${ctx}/commdataimport/importBaseStation" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择基站数据文件:</td>
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

<form id="inputForm" action="${ctx}/commdataimport/importIronTower" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择铁塔数据文件:</td>
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

<form id="inputForm" action="${ctx}/commdataimport/importCameraLocation" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择摄像头数据文件:</td>
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

<form id="inputForm" action="${ctx}/commdataimport/importCableSpliceClosureLocation" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择光缆接头盒位置数据文件:</td>
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

<form id="inputForm" action="${ctx}/commdataimport/importEquipmentCabinet" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择机柜数据文件:</td>
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

<form id="inputForm" action="${ctx}/commdataimport/importCommunicationEq" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择通信设备通用类(基站内设备)数据文件:</td>
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