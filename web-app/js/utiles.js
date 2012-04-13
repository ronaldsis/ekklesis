// ocultamos el top-panel
 $(function() {
		temp = $("#top-panel").height();
		$("#top-panel").animate({
			height : 10
		}, 700, function() {
			$("#dock-control").css("background-position", "0px -32px");
			$("#top-panel>div,#top-panel>ul").hide();
		});})
