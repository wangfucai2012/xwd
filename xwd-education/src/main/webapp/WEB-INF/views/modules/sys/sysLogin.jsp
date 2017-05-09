<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-CN">
<head>
<title>${fns:getConfig('productName')}登录</title>
<meta name="decorator" content="default" />
<!-- Custom styles for this template -->
<link href="${ctxStatic}/common/login/css/signin.css" rel="stylesheet">
<link href="${ctxStatic}/common/footer/css/footer.css" rel="stylesheet">
<script src="${ctxStatic}/backstretch/2.0.4/jquery.backstretch.min.js"></script>
<!-- 
<link rel="stylesheet" href="${ctxStatic}/common/typica-login.css">

-->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/*$.backstretch([ "${ctxStatic}/images/bg1.jpg",
								"${ctxStatic}/images/bg2.jpg",
								"${ctxStatic}/images/bg3.jpg" ], {
							duration : 10000,
							fade : 2000
						});*/

						$("#loginForm")
								.validate(
										{
											rules : {
												validateCode : {
													remote : "${pageContext.request.contextPath}/servlet/validateCodeServlet"
												}
											},
											messages : {
												username : {
													required : "请填写用户名."
												},
												password : {
													required : "请填写密码."
												},
												validateCode : {
													remote : "验证码不正确.",
													required : "请填写验证码."
												}
											},
											errorLabelContainer : "#messageBox",
											errorPlacement : function(error,
													element) {
												error.appendTo($("#loginError")
														.parent());
											}
										});
					});
	// 如果在框架中，则跳转刷新上级页面
	if (self.frameElement && self.frameElement.tagName == "IFRAME") {
		parent.location.reload();
	}
</script>
</head>
<body>
	<div class="container">
		<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
		<%
			String error = (String) request
					.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
		%><div id="messageBox"
			class="alert alert-danger <%=error == null ? "hide" : ""%> alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong><%=error == null ? "" : "用户或密码错误, 请重试."%></strong>
		</div>
		<form class="form-signin" id="loginForm" action="${ctx}/login"
			method="post">
			<h2 class="form-signin-heading">系统登录</h2>
			<label for="username" class="sr-only">登录名</label><input type="text"
				id="username" name="username" class="form-control"
				value="${username}" placeholder="登录名" required autofocus><label
				for="password" class="sr-only">密码</label> <input
				type="password" id="password" name="password" class="form-control"
				placeholder="密码" required>
			<div class="checkbox">
				<label> <input type="checkbox" id="rememberMe"
					name="rememberMe"><span style="color: #08c;">记住我</span>
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">登
				录</button>
		</form>
	</div>
	<!-- /container -->
	<footer class="footer">
		<div class="container">
			<p>
				Copyright &copy;
				2012-${fns:getConfig('copyrightYear')}${fns:getConfig('productName')}
				- Powered By <a href="${fns:getConfig('companysite')}"
					target="_blank">${fns:getConfig('powerBy')}</a> ${fns:getConfig('version')}
			</p>
		</div>
	</footer>
</body>
</html>