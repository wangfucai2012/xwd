<%--
  Created by IntelliJ IDEA.
  User: nemo
  Date: 16-5-23
  Time: 下午3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>左树右表</title>
    <meta name="decorator" content="default"/>
</head>
<body>
<div id="content" class="row-fluid">
    <div id="left" style="color:#000;background:#fff url(${ctx}/static/design/images/main-bg.jpg) repeat-x bottom">
        <iframe id="leftTreeFrame" name="leftTreeFrame" src="${ctx}/sys/catalog/catalogTreePage?type=${type}&p=${p}&level=${level}" style="overflow:visible;"
                scrolling="yes" frameborder="no" width="100%" ></iframe>
    </div>
    <div id="openClose" class="close">&nbsp;</div>
    <div id="right">
        <iframe id="rightMainFrame" name="rightMainFrame" src="${ctx}/data/work/bridge?catalog=${cat.id}" style="overflow: visible;"
                scrolling="yes" frameborder="no"	width="100%" ></iframe>
    </div>
</div>
<script type="text/javascript">
    var leftWidth = "200"; // 左侧窗口大小
    function wSize(){
        var strs=getWindowSize().toString().split(",");
        $("#leftTreeFrame, #rightMainFrame, #openClose").height(strs[0]-5);
        $("#right").width($("body").width()-$("#left").width()-$("#openClose").width()-5);
    }
</script>
<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
</body>
</html>
