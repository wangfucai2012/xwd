<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html style="overflow-x: hidden; overflow-y: auto;">
<head>
<title>图标选择</title>
<%@include file="/WEB-INF/views/include/head.jsp"%>
<style type="text/css">
.the-icons {
	padding: 25px 10px 15px;
	list-style: none;
}

.the-icons li {
	float: left;
	width: 20%;
	line-height: 25px;
	margin: 2px 5px;
	cursor: pointer;
}

.the-icons i {
	margin: 1px 5px;
}

.the-icons li:hover {
	background-color: #efefef;
}

.the-icons li.active {
	background-color: #0088CC;
	color: #ffffff;
}
.glyphicon {
	font-size:20px;
}
<%--
.glyphicon-class {
	display: block;
	text-align: center;
	word-wrap: break-word;
}
--%>
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#icons li").click(function() {
			$("#icons li").removeClass("active");
			// $("#icons li i").removeClass("glyphicon glyphglyphicon glyphicon-white");
			$(this).addClass("active");
			// $(this).children("i").addClass("glyphicon glyphglyphicon glyphicon-white");
			$("#icon").val($(this).text());
		});
		$("#icons li").each(function() {
			if ($(this).text() == "${value}") {
				$(this).click();
			}
		});
		$("#icons li").dblclick(function() {
			top.$.jBox.getBox().find("button[value='ok']").trigger("click");
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="icon" value="${value}" />
	<ul class="the-icons clearfix" id="icons">
		<li><i class="glyphicon glyphicon-asterisk" aria-hidden="true"></i>asterisk</li>
		<li><i class="glyphicon glyphicon-plus" aria-hidden="true"></i>plus</li>
		<li><i class="glyphicon glyphicon-euro" aria-hidden="true"></i>euro</li>
		<li><i class="glyphicon glyphicon-eur" aria-hidden="true"></i>eur</li>
		<li><i class="glyphicon glyphicon-minus" aria-hidden="true"></i>minus</li>
		<li><i class="glyphicon glyphicon-cloud" aria-hidden="true"></i>cloud</li>
		<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>envelope</li>
		<li><i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>pencil</li>
		<li><i class="glyphicon glyphicon-glass" aria-hidden="true"></i>glass</li>
		<li><i class="glyphicon glyphicon-music" aria-hidden="true"></i>music</li>
		<li><i class="glyphicon glyphicon-search" aria-hidden="true"></i>search</li>
		<li><i class="glyphicon glyphicon-heart" aria-hidden="true"></i>heart</li>
		<li><i class="glyphicon glyphicon-star" aria-hidden="true"></i>star</li>
		<li><i class="glyphicon glyphicon-star-empty" aria-hidden="true"></i>star-empty</li>
		<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i>user</li>
		<li><i class="glyphicon glyphicon-film" aria-hidden="true"></i>film</li>
		<li><i class="glyphicon glyphicon-th-large" aria-hidden="true"></i>th-large</li>
		<li><i class="glyphicon glyphicon-th" aria-hidden="true"></i>th</li>
		<li><i class="glyphicon glyphicon-th-list" aria-hidden="true"></i>th-list</li>
		<li><i class="glyphicon glyphicon-ok" aria-hidden="true"></i>ok</li>
		<li><i class="glyphicon glyphicon-remove" aria-hidden="true"></i>remove</li>
		<li><i class="glyphicon glyphicon-zoom-in" aria-hidden="true"></i>zoom-in</li>
		<li><i class="glyphicon glyphicon-zoom-out" aria-hidden="true"></i>zoom-out</li>
		<li><i class="glyphicon glyphicon-off" aria-hidden="true"></i>off</li>
		<li><i class="glyphicon glyphicon-signal" aria-hidden="true"></i>signal</li>
		<li><i class="glyphicon glyphicon-cog" aria-hidden="true"></i>cog</li>
		<li><i class="glyphicon glyphicon-trash" aria-hidden="true"></i>trash</li>
		<li><i class="glyphicon glyphicon-home" aria-hidden="true"></i>home</li>
		<li><i class="glyphicon glyphicon-file" aria-hidden="true"></i>file</li>
		<li><i class="glyphicon glyphicon-time" aria-hidden="true"></i>time</li>
		<li><i class="glyphicon glyphicon-road" aria-hidden="true"></i>road</li>
		<li><i class="glyphicon glyphicon-download-alt"aria-hidden="true"></i> download-alt</li>
		<li><i class="glyphicon glyphicon-download" aria-hidden="true"></i>download</li>
		<li><i class="glyphicon glyphicon-upload" aria-hidden="true"></i>upload</li>
		<li><i class="glyphicon glyphicon-inbox" aria-hidden="true"></i>inbox</li>
		<li><i class="glyphicon glyphicon-play-circle" aria-hidden="true"></i>play-circle</li>
		<li><i class="glyphicon glyphicon-repeat" aria-hidden="true"></i>repeat</li>
		<li><i class="glyphicon glyphicon-refresh" aria-hidden="true"></i>refresh</li>
		<li><i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>list-alt</li>
		<li><i class="glyphicon glyphicon-lock" aria-hidden="true"></i>
			lock</li>
		<li><i class="glyphicon glyphicon-flag" aria-hidden="true"></i>
			flag</li>
		<li><i class="glyphicon glyphicon-headphones" aria-hidden="true"></i>
			headphones</li>
		<li><i class="glyphicon glyphicon-volume-off" aria-hidden="true"></i>
			volume-off</li>
		<li><i class="glyphicon glyphicon-volume-down" aria-hidden="true"></i>
			volume-down</li>
		<li><i class="glyphicon glyphicon-volume-up" aria-hidden="true"></i>
			volume-up</li>
		<li><i class="glyphicon glyphicon-qrcode" aria-hidden="true"></i>
			qrcode</li>
		<li><i class="glyphicon glyphicon-barcode" aria-hidden="true"></i>
			barcode</li>
		<li><i class="glyphicon glyphicon-tag" aria-hidden="true"></i>
			tag</li>
		<li><i class="glyphicon glyphicon-tags" aria-hidden="true"></i>
			tags</li>
		<li><i class="glyphicon glyphicon-book" aria-hidden="true"></i>
			book</li>
		<li><i class="glyphicon glyphicon-bookmark" aria-hidden="true"></i>
			bookmark</li>
		<li><i class="glyphicon glyphicon-print" aria-hidden="true"></i>
			print</li>
		<li><i class="glyphicon glyphicon-camera" aria-hidden="true"></i>
			camera</li>
		<li><i class="glyphicon glyphicon-font" aria-hidden="true"></i>
			font</li>
		<li><i class="glyphicon glyphicon-bold" aria-hidden="true"></i>
			bold</li>
		<li><i class="glyphicon glyphicon-italic" aria-hidden="true"></i>
			italic</li>
		<li><i class="glyphicon glyphicon-text-height" aria-hidden="true"></i>
			text-height</li>
		<li><i class="glyphicon glyphicon-text-width" aria-hidden="true"></i>
			text-width</li>
		<li><i class="glyphicon glyphicon-align-left" aria-hidden="true"></i>
			align-left</li>
		<li><i class="glyphicon glyphicon-align-center"
			aria-hidden="true"></i> align-center</li>
		<li><i class="glyphicon glyphicon-align-right" aria-hidden="true"></i>
			align-right</li>
		<li><i class="glyphicon glyphicon-align-justify"
			aria-hidden="true"></i> align-justify</li>
		<li><i class="glyphicon glyphicon-list" aria-hidden="true"></i>
			list</li>
		<li><i class="glyphicon glyphicon-indent-left" aria-hidden="true"></i>
			indent-left</li>
		<li><i class="glyphicon glyphicon-indent-right"
			aria-hidden="true"></i> indent-right</li>
		<li><i class="glyphicon glyphicon-facetime-video"
			aria-hidden="true"></i> facetime-video</li>
		<li><i class="glyphicon glyphicon-picture" aria-hidden="true"></i>
			picture</li>
		<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
			map-marker</li>
		<li><i class="glyphicon glyphicon-adjust" aria-hidden="true"></i>
			adjust</li>
		<li><i class="glyphicon glyphicon-tint" aria-hidden="true"></i>
			tint</li>
		<li><i class="glyphicon glyphicon-edit" aria-hidden="true"></i>
			edit</li>
		<li><i class="glyphicon glyphicon-share" aria-hidden="true"></i>
			share</li>
		<li><i class="glyphicon glyphicon-check" aria-hidden="true"></i>
			check</li>
		<li><i class="glyphicon glyphicon-move" aria-hidden="true"></i>
			move</li>
		<li><i class="glyphicon glyphicon-step-backward"
			aria-hidden="true"></i> step-backward</li>
		<li><i class="glyphicon glyphicon-fast-backward"
			aria-hidden="true"></i> fast-backward</li>
		<li><i class="glyphicon glyphicon-backward" aria-hidden="true"></i>
			backward</li>
		<li><i class="glyphicon glyphicon-play" aria-hidden="true"></i>
			play</li>
		<li><i class="glyphicon glyphicon-pause" aria-hidden="true"></i>
			pause</li>
		<li><i class="glyphicon glyphicon-stop" aria-hidden="true"></i>
			stop</li>
		<li><i class="glyphicon glyphicon-forward" aria-hidden="true"></i>
			forward</li>
		<li><i class="glyphicon glyphicon-fast-forward"
			aria-hidden="true"></i> fast-forward</li>
		<li><i class="glyphicon glyphicon-step-forward"
			aria-hidden="true"></i> step-forward</li>
		<li><i class="glyphicon glyphicon-eject" aria-hidden="true"></i>
			eject</li>
		<li><i class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></i> chevron-left</li>
		<li><i class="glyphicon glyphicon-chevron-right"
			aria-hidden="true"></i> chevron-right</li>
		<li><i class="glyphicon glyphicon-plus-sign" aria-hidden="true"></i>
			plus-sign</li>
		<li><i class="glyphicon glyphicon-minus-sign" aria-hidden="true"></i>
			minus-sign</li>
		<li><i class="glyphicon glyphicon-remove-sign" aria-hidden="true"></i>
			remove-sign</li>
		<li><i class="glyphicon glyphicon-ok-sign" aria-hidden="true"></i>
			ok-sign</li>
		<li><i class="glyphicon glyphicon-question-sign"
			aria-hidden="true"></i> question-sign</li>
		<li><i class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>
			info-sign</li>
		<li><i class="glyphicon glyphicon-screenshot" aria-hidden="true"></i>
			screenshot</li>
		<li><i class="glyphicon glyphicon-remove-circle"
			aria-hidden="true"></i> remove-circle</li>

		<li><i class="glyphicon glyphicon-ok-circle" aria-hidden="true"></i>
			ok-circle</li>
		<li><i class="glyphicon glyphicon-ban-circle" aria-hidden="true"></i>
			ban-circle</li>
		<li><i class="glyphicon glyphicon-arrow-left" aria-hidden="true"></i>
			arrow-left</li>
		<li><i class="glyphicon glyphicon-arrow-right" aria-hidden="true"></i>
			arrow-right</li>
		<li><i class="glyphicon glyphicon-arrow-up" aria-hidden="true"></i>
			arrow-up</li>
		<li><i class="glyphicon glyphicon-arrow-down" aria-hidden="true"></i>
			arrow-down</li>
		<li><i class="glyphicon glyphicon-share-alt" aria-hidden="true"></i>
			share-alt</li>
		<li><i class="glyphicon glyphicon-resize-full" aria-hidden="true"></i>
			resize-full</li>
		<li><i class="glyphicon glyphicon-resize-small"
			aria-hidden="true"></i> resize-small</li>
		<li><i class="glyphicon glyphicon-exclamation-sign"
			aria-hidden="true"></i> exclamation-sign</li>
		<li><i class="glyphicon glyphicon-gift" aria-hidden="true"></i>
			gift</li>
		<li><i class="glyphicon glyphicon-leaf" aria-hidden="true"></i>
			leaf</li>
		<li><i class="glyphicon glyphicon-fire" aria-hidden="true"></i>
			fire</li>
		<li><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i>
			eye-open</li>
		<li><i class="glyphicon glyphicon-eye-close" aria-hidden="true"></i>
			eye-close</li>
		<li><i class="glyphicon glyphicon-warning-sign"
			aria-hidden="true"></i> warning-sign</li>
		<li><i class="glyphicon glyphicon-plane" aria-hidden="true"></i>
			plane</li>
		<li><i class="glyphicon glyphicon-calendar" aria-hidden="true"></i>
			calendar</li>
		<li><i class="glyphicon glyphicon-random" aria-hidden="true"></i>
			random</li>
		<li><i class="glyphicon glyphicon-comment" aria-hidden="true"></i>
			comment</li>
		<li><i class="glyphicon glyphicon-magnet" aria-hidden="true"></i>
			magnet</li>
		<li><i class="glyphicon glyphicon-chevron-up" aria-hidden="true"></i>
			chevron-up</li>
		<li><i class="glyphicon glyphicon-chevron-down"
			aria-hidden="true"></i> chevron-down</li>
		<li><i class="glyphicon glyphicon-retweet" aria-hidden="true"></i>
			retweet</li>
		<li><i class="glyphicon glyphicon-shopping-cart"
			aria-hidden="true"></i> shopping-cart</li>
		<li><i class="glyphicon glyphicon-folder-close"
			aria-hidden="true"></i> folder-close</li>
		<li><i class="glyphicon glyphicon-folder-open" aria-hidden="true"></i>
			folder-open</li>
		<li><i class="glyphicon glyphicon-resize-vertical"
			aria-hidden="true"></i> resize-vertical</li>
		<li><i class="glyphicon glyphicon-resize-horizontal"
			aria-hidden="true"></i> resize-horizontal</li>
		<li><i class="glyphicon glyphicon-hdd" aria-hidden="true"></i>
			hdd</li>
		<li><i class="glyphicon glyphicon-bullhorn" aria-hidden="true"></i>
			bullhorn</li>
		<li><i class="glyphicon glyphicon-bell" aria-hidden="true"></i>
			bell</li>
		<li><i class="glyphicon glyphicon-certificate" aria-hidden="true"></i>
			certificate</li>
		<li><i class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></i>
			thumbs-up</li>
		<li><i class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></i>
			thumbs-down</li>
		<li><i class="glyphicon glyphicon-hand-right" aria-hidden="true"></i>
			hand-right</li>
		<li><i class="glyphicon glyphicon-hand-left" aria-hidden="true"></i>
			hand-left</li>
		<li><i class="glyphicon glyphicon-hand-up" aria-hidden="true"></i>
			hand-up</li>
		<li><i class="glyphicon glyphicon-hand-down" aria-hidden="true"></i>
			hand-down</li>
		<li><i class="glyphicon glyphicon-circle-arrow-right"
			aria-hidden="true"></i> circle-arrow-right</li>
		<li><i class="glyphicon glyphicon-circle-arrow-left"
			aria-hidden="true"></i> circle-arrow-left</li>
		<li><i class="glyphicon glyphicon-circle-arrow-up"
			aria-hidden="true"></i> circle-arrow-up</li>
		<li><i class="glyphicon glyphicon-circle-arrow-down"
			aria-hidden="true"></i> circle-arrow-down</li>
		<li><i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
			globe</li>
		<li><i class="glyphicon glyphicon-wrench" aria-hidden="true"></i>
			wrench</li>
		<li><i class="glyphicon glyphicon-tasks" aria-hidden="true"></i>
			tasks</li>
		<li><i class="glyphicon glyphicon-filter" aria-hidden="true"></i>
			filter</li>
		<li><i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i>
			briefcase</li>
		<li><i class="glyphicon glyphicon-fullscreen" aria-hidden="true"></i>
			fullscreen</li>
		<li><i class="glyphicon glyphicon-dashboard" aria-hidden="true"></i>
			dashboard</li>
		<li><i class="glyphicon glyphicon-paperclip" aria-hidden="true"></i>
			paperclip</li>
		<li><i class="glyphicon glyphicon-heart-empty" aria-hidden="true"></i>
			heart-empty</li>
		<li><i class="glyphicon glyphicon-link" aria-hidden="true"></i>
			link</li>
		<li><i class="glyphicon glyphicon-phone" aria-hidden="true"></i>
			phone</li>
		<li><i class="glyphicon glyphicon-pushpin" aria-hidden="true"></i>
			pushpin</li>
		<li><i class="glyphicon glyphicon-usd" aria-hidden="true"></i>
			usd</li>
		<li><i class="glyphicon glyphicon-gbp" aria-hidden="true"></i>
			gbp</li>
		<li><i class="glyphicon glyphicon-sort" aria-hidden="true"></i>
			sort</li>
		<li><i class="glyphicon glyphicon-sort-by-alphabet"
			aria-hidden="true"></i> sort-by-alphabet</li>
		<li><i class="glyphicon glyphicon-sort-by-alphabet-alt"
			aria-hidden="true"></i> sort-by-alphabet-alt</li>
		<li><i class="glyphicon glyphicon-sort-by-order"
			aria-hidden="true"></i> sort-by-order</li>
		<li><i class="glyphicon glyphicon-sort-by-order-alt"
			aria-hidden="true"></i> sort-by-order-alt</li>
		<li><i class="glyphicon glyphicon-sort-by-attributes"
			aria-hidden="true"></i> sort-by-attributes</li>
		<li><i class="glyphicon glyphicon-sort-by-attributes-alt"
			aria-hidden="true"></i> sort-by-attributes-alt</li>
		<li><i class="glyphicon glyphicon-unchecked" aria-hidden="true"></i>
			unchecked</li>
		<li><i class="glyphicon glyphicon-expand" aria-hidden="true"></i>
			expand</li>
		<li><i class="glyphicon glyphicon-collapse-down"
			aria-hidden="true"></i> collapse-down</li>
		<li><i class="glyphicon glyphicon-collapse-up" aria-hidden="true"></i>
			collapse-up</li>
		<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
			log-in</li>
		<li><i class="glyphicon glyphicon-flash" aria-hidden="true"></i>
			flash</li>
		<li><i class="glyphicon glyphicon-log-out" aria-hidden="true"></i>
			log-out</li>
		<li><i class="glyphicon glyphicon-new-window" aria-hidden="true"></i>
			new-window</li>
		<li><i class="glyphicon glyphicon-record" aria-hidden="true"></i>
			record</li>
		<li><i class="glyphicon glyphicon-save" aria-hidden="true"></i>
			save</li>
		<li><i class="glyphicon glyphicon-open" aria-hidden="true"></i>
			open</li>
		<li><i class="glyphicon glyphicon-saved" aria-hidden="true"></i>
			saved</li>
		<li><i class="glyphicon glyphicon-import" aria-hidden="true"></i>
			import</li>
		<li><i class="glyphicon glyphicon-export" aria-hidden="true"></i>
			export</li>
		<li><i class="glyphicon glyphicon-send" aria-hidden="true"></i>
			send</li>
		<li><i class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></i>
			floppy-disk</li>
		<li><i class="glyphicon glyphicon-floppy-saved"
			aria-hidden="true"></i> floppy-saved</li>
		<li><i class="glyphicon glyphicon-floppy-remove"
			aria-hidden="true"></i> floppy-remove</li>
		<li><i class="glyphicon glyphicon-floppy-save" aria-hidden="true"></i>
			floppy-save</li>
		<li><i class="glyphicon glyphicon-floppy-open" aria-hidden="true"></i>
			floppy-open</li>
		<li><i class="glyphicon glyphicon-credit-card" aria-hidden="true"></i>
			credit-card</li>
		<li><i class="glyphicon glyphicon-transfer" aria-hidden="true"></i>
			transfer</li>
		<li><i class="glyphicon glyphicon-cutlery" aria-hidden="true"></i>
			cutlery</li>
		<li><i class="glyphicon glyphicon-header" aria-hidden="true"></i>
			header</li>
		<li><i class="glyphicon glyphicon-compressed" aria-hidden="true"></i>
			compressed</li>
		<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
			earphone</li>
		<li><i class="glyphicon glyphicon-phone-alt" aria-hidden="true"></i>
			phone-alt</li>
		<li><i class="glyphicon glyphicon-tower" aria-hidden="true"></i>
			tower</li>
		<li><i class="glyphicon glyphicon-stats" aria-hidden="true"></i>
			stats</li>

		<li><i class="glyphicon glyphicon-sd-video" aria-hidden="true"></i>
			sd-video</li>

		<li><i class="glyphicon glyphicon-hd-video" aria-hidden="true"></i>
			hd-video</li>

		<li><i class="glyphicon glyphicon-subtitles" aria-hidden="true"></i>
			subtitles</li>

		<li><i class="glyphicon glyphicon-sound-stereo"
			aria-hidden="true"></i> sound-stereo</li>

		<li><i class="glyphicon glyphicon-sound-dolby" aria-hidden="true"></i>
			sound-dolby</li>

		<li><i class="glyphicon glyphicon-sound-5-1" aria-hidden="true"></i>
			sound-5-1</li>

		<li><i class="glyphicon glyphicon-sound-6-1" aria-hidden="true"></i>
			sound-6-1</li>

		<li><i class="glyphicon glyphicon-sound-7-1" aria-hidden="true"></i>
			sound-7-1</li>

		<li><i class="glyphicon glyphicon-copyright-mark"
			aria-hidden="true"></i> copyright-mark</li>

		<li><i class="glyphicon glyphicon-registration-mark"
			aria-hidden="true"></i> registration-mark</li>

		<li><i class="glyphicon glyphicon-cloud-download"
			aria-hidden="true"></i> cloud-download</li>

		<li><i class="glyphicon glyphicon-cloud-upload"
			aria-hidden="true"></i> cloud-upload</li>

		<li><i class="glyphicon glyphicon-tree-conifer"
			aria-hidden="true"></i> tree-conifer</li>

		<li><i class="glyphicon glyphicon-tree-deciduous"
			aria-hidden="true"></i> tree-deciduous</li>

		<li><i class="glyphicon glyphicon-cd" aria-hidden="true"></i>cd</li>

		<li><i class="glyphicon glyphicon-save-file" aria-hidden="true"></i>save-file</li>

		<li><i class="glyphicon glyphicon-open-file" aria-hidden="true"></i>
			open-file</li>

		<li><i class="glyphicon glyphicon-level-up" aria-hidden="true"></i>
			level-up</li>

		<li><i class="glyphicon glyphicon-copy" aria-hidden="true"></i>
			copy</li>

		<li><i class="glyphicon glyphicon-paste" aria-hidden="true"></i>
			paste</li>

		<li><i class="glyphicon glyphicon-alert" aria-hidden="true"></i>
			alert</li>

		<li><i class="glyphicon glyphicon-equalizer" aria-hidden="true"></i>
			equalizer</li>

		<li><i class="glyphicon glyphicon-king" aria-hidden="true"></i>
			king</li>

		<li><i class="glyphicon glyphicon-queen" aria-hidden="true"></i>
			queen</li>

		<li><i class="glyphicon glyphicon-pawn" aria-hidden="true"></i>
			pawn</li>

		<li><i class="glyphicon glyphicon-bishop" aria-hidden="true"></i>
			bishop</li>

		<li><i class="glyphicon glyphicon-knight" aria-hidden="true"></i>
			knight</li>

		<li><i class="glyphicon glyphicon-baby-formula"
			aria-hidden="true"></i> baby-formula</li>

		<li><i class="glyphicon glyphicon-tent" aria-hidden="true"></i>
			tent</li>

		<li><i class="glyphicon glyphicon-blackboard" aria-hidden="true"></i>
			blackboard</li>

		<li><i class="glyphicon glyphicon-bed" aria-hidden="true"></i>
			bed</li>

		<li><i class="glyphicon glyphicon-apple" aria-hidden="true"></i>
			apple</li>

		<li><i class="glyphicon glyphicon-erase" aria-hidden="true"></i>
			erase</li>

		<li><i class="glyphicon glyphicon-hourglass" aria-hidden="true"></i>
			hourglass</li>

		<li><i class="glyphicon glyphicon-lamp" aria-hidden="true"></i>
			lamp</li>

		<li><i class="glyphicon glyphicon-duplicate" aria-hidden="true"></i>
			duplicate</li>

		<li><i class="glyphicon glyphicon-piggy-bank" aria-hidden="true"></i>
			piggy-bank</li>

		<li><i class="glyphicon glyphicon-scissors" aria-hidden="true"></i>
			scissors</li>

		<li><i class="glyphicon glyphicon-bitcoin" aria-hidden="true"></i>
			bitcoin</li>

		<li><i class="glyphicon glyphicon-btc" aria-hidden="true"></i>
			btc</li>

		<li><i class="glyphicon glyphicon-xbt" aria-hidden="true"></i>
			xbt</li>

		<li><i class="glyphicon glyphicon-yen" aria-hidden="true"></i>
			yen</li>

		<li><i class="glyphicon glyphicon-jpy" aria-hidden="true"></i>
			jpy</li>

		<li><i class="glyphicon glyphicon-ruble" aria-hidden="true"></i>
			ruble</li>

		<li><i class="glyphicon glyphicon-rub" aria-hidden="true"></i>
			rub</li>

		<li><i class="glyphicon glyphicon-scale" aria-hidden="true"></i>
			scale</li>

		<li><i class="glyphicon glyphicon-ice-lolly" aria-hidden="true"></i>
			ice-lolly</li>

		<li><i class="glyphicon glyphicon-ice-lolly-tasted"
			aria-hidden="true"></i> ice-lolly-tasted</li>

		<li><i class="glyphicon glyphicon-education" aria-hidden="true"></i>
			education</li>

		<li><i class="glyphicon glyphicon-option-horizontal"
			aria-hidden="true"></i> option-horizontal</li>

		<li><i class="glyphicon glyphicon-option-vertical"
			aria-hidden="true"></i> option-vertical</li>

		<li><i class="glyphicon glyphicon-menu-hamburger"
			aria-hidden="true"></i> menu-hamburger</li>

		<li><i class="glyphicon glyphicon-modal-window"
			aria-hidden="true"></i> modal-window</li>
		<li><i class="glyphicon glyphicon-oil" aria-hidden="true"></i>
			oil</li>
		<li><i class="glyphicon glyphicon-grain" aria-hidden="true"></i>
			grain</li>
		<li><i class="glyphicon glyphicon-sunglasses" aria-hidden="true"></i>
			sunglasses</li>
		<li><i class="glyphicon glyphicon-text-size" aria-hidden="true"></i>
			text-size</li>
		<li><i class="glyphicon glyphicon-text-color" aria-hidden="true"></i>
			text-color</li>
		<li><i class="glyphicon glyphicon-text-background"
			aria-hidden="true"></i> text-background</li>
		<li><i class="glyphicon glyphicon-object-align-top"
			aria-hidden="true"></i> object-align-top</li>
		<li><i class="glyphicon glyphicon-object-align-bottom"
			aria-hidden="true"></i> object-align-bottom</li>
		<li><i class="glyphicon glyphicon-object-align-horizontal"
			aria-hidden="true"></i> object-align-horizontal</li>
		<li><i class="glyphicon glyphicon-object-align-left"
			aria-hidden="true"></i> object-align-left</li>
		<li><i class="glyphicon glyphicon-object-align-vertical"
			aria-hidden="true"></i> object-align-vertical</li>
		<li><i class="glyphicon glyphicon-object-align-right"
			aria-hidden="true"></i> object-align-right</li>
		<li><i class="glyphicon glyphicon-triangle-right"
			aria-hidden="true"></i> triangle-right</li>
		<li><i class="glyphicon glyphicon-triangle-left"
			aria-hidden="true"></i> triangle-left</li>
		<li><i class="glyphicon glyphicon-triangle-bottom"
			aria-hidden="true"></i> triangle-bottom</li>
		<li><i class="glyphicon glyphicon-triangle-top"
			aria-hidden="true"></i> triangle-top</li>
		<li><i class="glyphicon glyphicon-console" aria-hidden="true"></i>
			console</li>
		<li><i class="glyphicon glyphicon-superscript" aria-hidden="true"></i>
			superscript</li>
		<li><i class="glyphicon glyphicon-subscript" aria-hidden="true"></i>
			subscript</li>
		<li><i class="glyphicon glyphicon-menu-left" aria-hidden="true"></i>
			menu-left</li>
		<li><i class="glyphicon glyphicon-menu-right" aria-hidden="true"></i>
			menu-right</li>
		<li><i class="glyphicon glyphicon-menu-down" aria-hidden="true"></i>
			menu-down</li>
		<li><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i>
			menu-up</li>
	</ul>
</body>