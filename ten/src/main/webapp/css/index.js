$(function() {
	// 		카풀
	$("#carpool .circle_div").hover(
			function() {
				$("#carimg").hide()
				$("#carpool .circle_div").css("background-color",
						"rgba(0,0,0,0.4)")
				$(".text1").css("display", "block")
			}, function() {
				$("#carimg").show()
				$("#carpool .circle_div").css("background-color", "white")
				$(".text1").css("display", "none")
			});
	// 		전세버스
	$("#bus .circle_div").hover(function() {
		$("#busimg").hide()
		$("#bus .circle_div").css("background-color", "rgba(0,0,0,0.4)")
		$(".text2").css("display", "block")
	}, function() {
		$("#busimg").show()
		$("#bus .circle_div").css("background-color", "white")
		$(".text2").css("display", "none")
	});
	// 		KTX
	$("#ktx .circle_div").hover(function() {
		$("#ktximg").hide()
		$("#ktx .circle_div").css("background-color", "rgba(0,0,0,0.4)")
		$(".text3").css("display", "block")
	}, function() {
		$("#ktximg").show()
		$("#ktx .circle_div").css("background-color", "white")
		$(".text3").css("display", "none")
	});
	// 	    카쉐어링
	$("#carsharing .circle_div").hover(
			function() {
				$("#shareimg").hide()
				$("#carsharing .circle_div").css("background-color",
						"rgba(0,0,0,0.4)")
				$(".text4").css("display", "block")
			},
			function() {
				$("#shareimg").show()
				$("#carsharing .circle_div").css("background-color",
						"white")
				$(".text4").css("display", "none")
			});
	// 	    맛집
	$("#food").hover(function() {
		$("#foodimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#foodimg").css("background-color", "")
	});
	// 	    여행지
	$("#travel").hover(function() {
		$("#travelimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#travelimg").css("background-color", "")
	});
	// 	    고객센터
	$("#help").hover(function() {
		$("#helpimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#helpimg").css("background-color", "")
	});
	// 	    설문조사
	$("#research").hover(function() {
		$("#researchimg").css("background-color", "rgba(0,0,0,0.4)")
	}, function() {
		$("#researchimg").css("background-color", "")
	});
});