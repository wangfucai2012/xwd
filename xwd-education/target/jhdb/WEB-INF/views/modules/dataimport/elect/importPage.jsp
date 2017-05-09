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

<form action="${ctx}/electDataimport/importGsu" method="post" enctype="multipart/form-data">
            <tr>
                <td class="span2">请选择变压器数据文件:</td>
                <td colspan="3" align="left">
                    <input class="multi" type="file" name="pierfile" size="60" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input class="btn btn-primary" type="submit" value="保 存"/>
                </td>
            </tr>
    <br />
</form>


<form action="${ctx}/electDataimport/importGaoyaPlat" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择高压柜数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>


<form action="${ctx}/electDataimport/importSwitcheq" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择断路器数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importSubstation" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择变电所数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importLoadSwitch" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择隔离开关数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importSwitcheq2" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择负荷开关数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>


<form action="${ctx}/electDataimport/importVoltTransformer" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择电压互感器数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>


<form action="${ctx}/electDataimport/importCurrentTransformer" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择电流互感器数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importGsu" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择牵引变压器数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importSurgearrester" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择避雷器数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>


<form action="${ctx}/electDataimport/importSurgearrester" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择避雷针数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importComautoeq" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择综合自动化装置数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importTelecontroeq" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择远动装置数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importBasicNetBar" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择基础网杆数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importAnchor" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择锚断数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importSuppleLine" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择供电线数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importReturnLine" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择回流线数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importContactWire" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">请选择接触线数据文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importUpdateAnchor" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">锚断数据更新文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importTerminalBox" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">端子箱文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importDcAcDisc" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">直流、交流屏文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

<form action="${ctx}/electDataimport/importPowerSupplyEq" method="post" enctype="multipart/form-data">
    <tr>
        <td class="span2">供电公用类文件:</td>
        <td colspan="3" align="left">
            <input class="multi" type="file" name="pierfile" size="60" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input class="btn btn-primary" type="submit" value="保 存"/>
        </td>
    </tr>
    <br />
</form>

</body>
</html>