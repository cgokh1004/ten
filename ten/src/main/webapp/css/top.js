$(function() {
	$("#button").toggle(function() {
		$("#effect").animate({
			left : '0'
		}, 500);
		$("#menu").animate({
			left : '0'
		}, 500);
		$("#content").animate({
			left : '250px'
		}, 500);
		$("#button").animate({
			left : '250px'
		}, 500).css({
			"background-image" : "url('../image/close.png')",
			"background-repeat" : "no-repeat",
			"background-position" : "center",
			"background-color" : "#0db14b"
		});
	}, function() {
		jQuery("#effect").animate({
			left : '-100%'
		}, 500);
		jQuery("#menu").animate({
			left : '-250px'
		}, 500);
		jQuery("#content").animate({
			left : '0'
		}, 500);
		jQuery("#button").animate({
			left : '0'
		}, 500).css({
			"background-image" : "url('../image/menu.png')",
			"background-repeat" : "no-repeat",
			"background-position" : "center",
			"background-color" : "#0db14b"
		});
	});
	$("#effect").click(function() {
		$("#button").trigger("click");
	})
});