<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>菜单导航</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
		body {
			padding-top:5px;
		}
	</style>
	<script type="text/javascript"> 
		$(document).ready(function() {
			$(".accordion-heading a").click(function(){
				$('.accordion-toggle i').removeClass('glyphicon glyphicon-chevron-down');
				$('.accordion-toggle i').addClass('glyphicon glyphicon-chevron-right');
				if(!$($(this).attr('href')).hasClass('in')){
					$(this).children('i').removeClass('glyphicon glyphicon-chevron-right');
					$(this).children('i').addClass('glyphicon glyphicon-chevron-down');
				}
			});
			$(".accordion-body a").click(function(){
				$("#menu li").removeClass("active");
				// $("#menu li i").removeClass("glyphicon glyphicon-white");
				$(this).parent().addClass("active");
				// $(this).children("i").addClass("glyphicon glyphicon-white");
			});
			$(".accordion-body a:first i").click();
			
			// 新版本的
			$(".panel-title a").click(function(){
				$('.panel-title i').removeClass('glyphicon glyphicon-chevron-down');
				$('.panel-title i').addClass('glyphicon glyphicon-chevron-right');
				if(!$($(this).attr('href')).hasClass('in')){
					$(this).children('i').removeClass('glyphicon glyphicon-chevron-right');
					$(this).children('i').addClass('glyphicon glyphicon-chevron-down');
				}
			});
			$(".list-group a").click(function(){
				$("#accordion a").removeClass("active");
				// $("#menu li i").removeClass("glyphicon glyphicon-white");
				$(this).addClass("active");
				// $(this).children("i").addClass("glyphicon glyphicon-white");
			});
			$(".list-group a:first i").click();
		});
	</script>
</head>
<body style="background-color: transparent;">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"><c:set var="menuList" value="${fns:getMenuList()}"/><c:set var="firstMenu" value="true"/><c:forEach items="${menuList}" var="menu" varStatus="idxStatus"><c:if test="${menu.parent.id eq (not empty param.parentId?param.parentId:1)&&menu.isShow eq 1}">
		<div class="panel panel-default">
    		<div class="panel-heading" role="tab" id="heading${menu.id}">
    			<h4 class="panel-title">
    				<a data-toggle="collapse" data-parent="#accordion" href="#collapse${menu.id}" aria-expanded="true" aria-controls="collapse${menu.id}">
    					<i class="glyphicon glyphicon-chevron-${not empty firstMenu && firstMenu ? 'down' : 'right'}"></i>&nbsp;&nbsp;${menu.name}
    				</a>
    			</h4>
    		</div>
    		<div id="collapse${menu.id}" class="panel-collapse collapse ${firstMenu?'in':''}" role="tabpanel" aria-labelledby="heading${menu.id}">
      			<%-- <div class="panel-body"> --%>
      				<div class="list-group"><c:forEach items="${menuList}" var="menuChild"><c:if test="${menuChild.parent.id eq menu.id&&menuChild.isShow eq 1}">
      					<a href="${fn:indexOf(menuChild.href, '://') eq -1?ctx:''}${not empty menuChild.href?menuChild.href:'/404'}" class="list-group-item" target="${not empty menuChild.target?menuChild.target:'mainFrame'}">
      						<i class="glyphicon glyphicon-${not empty menuChild.icon?menuChild.icon:'circle-arrow-right'}"></i>&nbsp;${menuChild.name}
      					</a><c:set var="firstMenu" value="false"/></c:if></c:forEach>
      				</div>
      			<%-- </div> --%>
      		</div>
    	</div></c:if></c:forEach>
	</div>
</body>
</html>
