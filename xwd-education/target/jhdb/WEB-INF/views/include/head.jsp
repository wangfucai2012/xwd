<%@ page contentType="text/html;charset=UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="中国铁道科学研究院电子计算技术研究所,北京经纬信息技术公司 程超 @南肖墙">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="http://www.rails.com.cn/ nanxiaoqiang" />
<meta name="renderer" content="webkit">
<!-- meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" / -->
<!-- 下边的开着防缓存，也不知道实际效果好不好 -->
<!-- <meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store"> -->
<link rel="icon" href="../../favicon.ico">

<!--  -->
<!-- Bootstrap core CSS -->
<link
	href="${ctxStatic}/bootstrap/3.3.4/${not empty cookie.theme.value ? 'css_' +cookie.theme.value : 'css'}/bootstrap.min.css"
	rel="stylesheet">




<!-- Bootstrap用IE兼容及警告的js -->
<!--[if lt IE 9]><script src="${ctxStatic}/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="${ctxStatic}/assets/js/ie-emulation-modes-warning.js"></script>
<!-- Bootstrap用的向下兼容IE8的js -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${ctxStatic}/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="${ctxStatic}/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->





<!-- bootstrap建议js放在页面的最后加载 -->
<!-- jquery -->
<script src="${ctxStatic}/jquery/1.11.2/jquery-1.11.2.min.js"
	type="text/javascript"></script>
<script src="${ctx}/static/jquery-migrate/1.2.1/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js"
	type="text/javascript"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="${ctxStatic}/assets/js/ie10-viewport-bug-workaround.js"></script>
<!-- jquery-validation -->
<link
	href="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/jquery-validation/1.11.1/localization/messages_zh.js"
	type="text/javascript"></script>
<!-- 日历插件 -->
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js"
	type="text/javascript"></script>
<!-- mustache -->
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<!-- jquery-migrate -->
<script
	src="${ctxStatic}/jquery-migrate/1.2.1/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>
<!-- jQueryUI -->
<script src="${ctxStatic}/jquery-ui/1.11.4/jquery-ui.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="${ctxStatic}/jquery-ui/1.11.4/jquery-ui.min.css" />
<!-- 自己的js -->
<script src="${ctxStatic}/common/common-ict-web.js"
	type="text/javascript"></script>
<!-- 自己的js -->
<script src="${ctxStatic}/common/BubbleTooltips.js"
	type="text/javascript"></script>
<!-- jbox是否要显示添加？暂时注释 -->
<!--<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css"
	rel="stylesheet" />-->
<!--<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>-->
<!-- jquery-select2 -->
<link href="${ctxStatic}/select2/3.5.2/select2.css" rel="stylesheet" />
<script src="${ctxStatic}/select2/3.5.2/select2.min.js"
	type="text/javascript"></script>
<script src="${ctxStatic}/select2/3.5.2/select2_locale_zh-CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var ctx = '${ctx}', ctxStatic = '${ctxStatic}';
</script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins2/Gray/jbox.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<!-- 通用样式和js -->
<link href="${ctxStatic}/common/jeesite.css" type="text/css"
	rel="stylesheet" />
<script src="${ctxStatic}/common/jeesite.min.js" type="text/javascript"></script>
