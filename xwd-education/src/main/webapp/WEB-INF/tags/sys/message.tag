<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="msgcontent" type="java.lang.String" required="true" description="消息内容"%>
<%@ attribute name="msgtype" type="java.lang.String" description="消息类型：info(blue)、success(green)、warning(yellow)、danger(red)"%>
<script type="text/javascript">top.$.jBox.closeTip();</script>
<c:if test="${not empty msgcontent}">
	<c:if test="${not empty msgtype}"><c:set var="ctype" value="${msgtype}"/></c:if><c:if test="${empty msgtype}"><c:set var="ctype" value="${fn:indexOf(msgcontent,'失败') eq -1?'success':'danger'}"/></c:if>
	<div id="messageBox" class="alert alert-${ctype}" role="alert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>${msgcontent}</div> 
	<script type="text/javascript">if(!top.$.jBox.tip.mess){top.$.jBox.tip.mess=1;top.$.jBox.tip("${msgcontent}","${ctype}",{persistent:true,opacity:0});$("#messageBox").show();}</script>
</c:if>