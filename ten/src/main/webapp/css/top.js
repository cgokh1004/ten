jQuery(document).ready(function($) {
	// 이 함수 안에서는 $를 jQuery가 사용
$(function() {
	$("#down").click(function(){
		$("#sign1").slideToggle("nomal"),
		$("#sign2").slideToggle("nomal")
	}),
	$("#down").toggle(function(){
		$(this).attr("src","/ten/images/up.png")
	},function(){
		$(this).attr("src","/ten/images/down.png")
	}),
	$("#button").toggle(function() {
		$("#effect").animate({
			left : '0'
		}, 500);
		$("#menu").animate({
			left : '0'
		}, 500);
		$("body").animate({
			left : '250px'
		}, 500);
		$("#button").animate({
			left : '0px'
		}, 500).css({
			"background-image" : "url('/ten/images/close.png')",
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
		jQuery("body").animate({
			left : '0'
		}, 500);
		jQuery("#button").animate({
			left : '0'
		}, 500).css({
			"background-image" : "url('/ten/images/menu.png')",
			"background-repeat" : "no-repeat",
			"background-position" : "center",
			"background-color" : "#0db14b"
		});
	});
	$("#effect").click(function() {
		$("#button").trigger("click");
	})
});
});