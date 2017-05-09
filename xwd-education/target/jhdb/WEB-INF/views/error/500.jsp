<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.springside.modules.beanvalidator.BeanValidators"%>
<%@ page import="java.lang.StackTraceElement"%>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%response.setStatus(200);%>
<%
	Throwable ex = null;
	if (exception != null)
		ex = exception;
	if (request.getAttribute("javax.servlet.error.exception") != null)
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	//记录日志
	if (ex!=null){
		Logger logger = LoggerFactory.getLogger("500.jsp");
		logger.error(ex.getMessage(), ex);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>500 - 系统内部错误</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
	<div class="panel panel-danger">
  <div class="panel-heading"><h1 class="text-danger"><i class="glyphicon glyphicon-warning-sign"
			aria-hidden="true"></i>
			系统发生内部错误.</h1></div>
  <div class="panel-body">
  	<h3>错误信息：<i class="glyphicon glyphicon-wrench"
			aria-hidden="true"></i></h3><p>
		<%
			if (ex!=null){
				if (ex instanceof javax.validation.ConstraintViolationException){
					for (String s : BeanValidators.extractPropertyAndMessageAsList((javax.validation.ConstraintViolationException)ex, ": ")){
						out.print(s+"<br/>");
					}
				}else{
					out.print("<h4>" + ex + "</h4><br/>");
					StackTraceElement[] stacks = ex.getStackTrace();
					for(StackTraceElement s: stacks){
						out.print("&nbsp;&nbsp;at&nbsp;&nbsp;" + s + "<br/>");
			        }
				}
			}
		%>
		</p>
  </div>
  <div class="panel-footer"><a href="javascript:" onclick="history.go(-1);" class="btn btn-default">
  <i class="glyphicon glyphicon-arrow-left" aria-hidden="true"></i> 返回上一页</a></div>
</div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>