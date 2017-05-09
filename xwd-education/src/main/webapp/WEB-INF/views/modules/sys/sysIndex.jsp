<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="zh-CN">
<head>
<title>${fns:getConfig('productName')}</title>
<meta name="decorator" content="blank" />
<style type="text/css">
body {
    padding-top: 50px;
}
</style>
<link href="${ctxStatic}/common/navbar/css/fixed-navbar.css"
	rel="stylesheet">
<!-- link href="${ctxStatic}/common/footer/css/footer.css" rel="stylesheet"> -->


<script type="text/javascript">
	$(document).ready(function() {
		$("#menu a.menu").click(function() {
			$("#menu li.menu").removeClass("active");
			$(this).parent().addClass("active");
			if (!$("#openClose").hasClass("close")) {
				$("#openClose").click();
			}
		});
		// checkRole();
	});
	function checkRole() {
		alert($("#check1").value());

	}
	$(function(){
		setInterval(scanTodayTask, 900000);//15分钟进行一次任务扫描
		//提示框关闭时触发
		$('#message').on('hidden.bs.modal', function() {
			offAudio();
		}).bind("mouseover",function(){
			offAudio();
		});
	});
	
	/**
	*扫描今日任务
	*/
	function scanTodayTask() {
		$.ajax({
			type : "POST",
			url : "${ctx}/duty/workingItems/task/scanTipTodayTask",
			success : function(taskList) {
				var bodyHtml = "";
				if(taskList != "") {
					$.each(taskList,function(i){
						var task = taskList[i];
						var id = task.id;
						var name = task.name;
						var content = task.content;
						bodyHtml += "<tr id="+id+">";
						bodyHtml += "<td>"+name+"</td>" + "<td>"+content+"</td>" + "<td>"
						   + "<a href='#' onclick='unTip("+id+")'>不在提醒</a></td>";
						bodyHtml += "</tr>";
					});
					$("#bodyId").html(bodyHtml);
					if($("#message").is(":hidden")) {
						onAudio();
						$("#showModalButton").trigger("click");
					}
				}
			}
		});
	}
	
	/**
	*根据消息id使其不在被提示
	*/
	function unTip(taskId) {
		$.ajax({
	  		  type: "POST",
	 		  url: "${ctx}/duty/workingItems/task/unTip/?taskId="+taskId,
	 		  async: false,
	   		  success: function(msg){
				$("#"+taskId).remove();
				if($("#bodyId").html()=="") {
					$("#closeBtnId").trigger("click");
				}
	   		  }
		}); 
	}
	
	/**
	*关闭提示音
	*/
	function offAudio() {
		var messageAudio = document.getElementById("messageAudio");
		var paused = messageAudio.paused;
		if(!paused) {
			messageAudio.pause();//关闭播放提示音
		}
	}
	
	/**
	*开启提示音
	*/
	function onAudio() {
		var messageAudio = document.getElementById("messageAudio");
		var paused = messageAudio.paused;
		if(paused) {
			messageAudio.play();//播放提示音
		}
	}
</script>
</head>
<body>
	<div id="main">
		<!-- Fixed navbar -->
		<nav id="header" class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<!-- <div class="container">-->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">${fns:getConfig('productName')}</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav" id="menu">
						<c:set var="firstMenu" value="true" />
						<c:forEach items="${fns:getFirstMenuList(fns:getConfig('site.code'))}" var="menu"
							varStatus="idxStatus">
							<c:if test="${menu.parent.id eq '1' && menu.isShow eq '1'}">
								<li class="menu ${firstMenu ? ' active' : ''}"><a
									class="menu" href="${ctx}/sys/menu/tree?parentId=${menu.id}"
									target="menuFrame">${menu.name}</a></li>
								<c:if test="${firstMenu}">
									<c:set var="firstMenuId" value="${menu.id}" />
								</c:if>
								<c:set var="firstMenu" value="false" />
							</c:if>
						</c:forEach>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">
							<i class="glyphicon glyphicon-user" aria-hidden="true"></i>
							您好，<shiro:principal/><span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${ctx}/sys/user/info" target="mainFrame"><i
										class="icon-user"></i>&nbsp; 个人信息</a></li>
								<li><a href="${ctx}/sys/user/modifyPwd" target="mainFrame"><i
										class="icon-lock"></i>&nbsp; 修改密码</a></li>
								<li class="divider"></li>
								<li><a href="${fns:getConfig('shiro.logout.cas.url')}" title="退出登录">&nbsp; 退出</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
		<div class="container-fluid">
			<div id="content" class="row-fluid">
				<div id="left">
					<iframe id="menuFrame" name="menuFrame"
						src="${ctx}/sys/menu/tree?parentId=${firstMenuId}"
						style="overflow: visible;" scrolling="yes" frameborder="no"
						width="100%" height="650"></iframe>
				</div>
				<div id="openClose" class="close">&nbsp;</div>
				<div id="right">
					<iframe id="mainFrame" name="mainFrame" src=""
						style="overflow: visible;" scrolling="yes" frameborder="no"
						width="100%" height="650"></iframe>
				</div>
			</div>
		</div>
		<!-- Fixed navbar end -->
	</div>
	<script type="text/javascript"> 
		var leftWidth = "180"; // 左侧窗口大小
		function wSize(){
			var minHeight = 500, minWidth = 980;
			var strs=getWindowSize().toString().split(",");
			$("#menuFrame, #mainFrame, #openClose").height((strs[0]<minHeight?minHeight:strs[0])-$("#header").height());
			$("#openClose").height($("#openClose").height()-5);
			if(strs[1]<minWidth){
				$("#main").css("width",minWidth-10);
				$("html,body").css({"overflow":"auto","overflow-x":"auto","overflow-y":"auto"});
			}else{
				$("#main").css("width","auto");
				$("html,body").css({"overflow":"hidden","overflow-x":"hidden","overflow-y":"hidden"});
			}
			$("#right").width($("#content").width()-$("#left").width()-$("#openClose").width()-5);
		}
	</script>
	<script src="${ctxStatic}/common/wsize.min.js" type="text/javascript"></script>
	<audio id="messageAudio" src="${ctxStatic}/assets/qq.mp3" loop="true"></audio>
	<button class="btn btn-default glyphicon glyphicon-cog" id="showModalButton"
			data-toggle="modal" data-target="#message" style="display: none;"></button>
		<div class="modal fade" id="message" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新任务</h4>
				</div>
				<div class="modal-body">
				   <form id="taskForm">
					<table id="" class="table table-striped table-bordered table-hover">
						<thead>
						   <tr>
						     <th>
						     	名称
						     </th>
						     <th>
						     	工作内容
						     </th>
						     <th>
						     	操作
						     </th>
						   </tr>
						</thead>
						<tbody id="bodyId">
						</tbody>
					</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="closeBtnId" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>