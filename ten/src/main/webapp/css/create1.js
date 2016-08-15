function InputCheck(){
		document.frm.c_startv.value = document.frm1.c_startv.value;
		document.frm.c_start.value = document.frm1.c_start.value;
		document.frm.viav.value = document.frm2.viav.value;
		document.frm.via.value= document.frm2.via.value;
		document.frm.c_endv.value= document.frm3.c_endv.value;
		document.frm.c_end.value= document.frm3.c_end.value;
		
		if(document.frm.kind.value==''){
			alert('유형을 선택해주세요');
			return false;
		}
		if(document.frm.c_type.value==''){
			alert('종류를 선택해주세요');
			document.frm.c_type.focus()
			return false;
		}
		if(document.frm.purpose.value==''){
			alert('목적을 간단히 입력해주세요');
			document.frm.purpose.focus()
			return false;
		}
		if(document.frm1.c_start.value==''){
			alert('출발지를 입력해주세요');
			document.frm1.c_start.focus()
			return false;
		}
		if(document.frm1.c_startv.value==''){
			alert('출발지를 검색하시고 검색된 목록에서 출발지를 선택해주세요');
			document.frm1.search1.focus()
			return false;
		}
		if(document.frm2.via.value!=''&&document.frm2.viav.value==''){
			alert('경유지를 검색하시고 검색된 목록에서 경유지를 선택해주세요');
			document.frm2.search2.focus()
			return false;
		}
		if(document.frm3.c_end.value==''){
			alert('목적지를 입력해주세요');
			document.frm3.c_end.focus()
			return false;
		}
		if(document.frm3.c_endv.value==''){
			alert('목적지를 검색하시고 검색된 목록에서 목적지를 선택해주세요');
			document.frm3.search3.focus()
			return false;
		}		
	}
	
	function find(){
			var url = "http://map.daum.net/"
			var start=document.getElementById('c_start').value
			var end=document.getElementById('c_end').value
			
			url=url+"?sName="+start
			url=url+"&eName="+end
			window.open(url,"실제경로검색");
		}
	jQuery(document).ready(function($) {
		// 이 함수 안에서는 $를 jQuery가 사용
		$("#타세요").click(
				function() {
					$("#타세요").css("background-color", "#d0d0ff"), $("#태워주세요")
							.css("background-color", "#eeeeee"), $("#kind")
							.val('타세요')
				});
		$("#태워주세요").click(
				function() {
					$("#태워주세요").css("background-color", "#d0d0ff"), $("#타세요")
							.css("background-color", "#eeeeee"), $("#kind")
							.val('태워주세요')
				});
		
		$("#c_start").focus(function() {
			$(this).val("")
			$("#c_startv").val("")
			$(".map_wrap2").slideUp(), $(".map_wrap3").slideUp()	
			$("#search1").show("blind", { direction: "left" }, 700),
			$("#c_start").animate({width : '68.5%'}, 700),
			$("#search2").hide("blind", { direction: "left" }, 700),
			$("#via").animate({width : '80.5%'}, 700),
			$("#search3").hide("blind", { direction: "left" }, 700),
			$("#c_end").animate({width : '80.5%'}, 700)
		});
		$("#via").focus(function() {
			$(this).val("")
			$("#viav").val("")
			$(".map_wrap1").slideUp(),$(".map_wrap3").slideUp(),
			$("#search1").hide("blind", { direction: "left" }, 700),
			$("#search2").show("blind", { direction: "left" }, 700),
			$("#via").animate({width : '68.5%'}, 700),
			$("#search1").hide("blind", { direction: "left" }, 700),
			$("#c_start").animate({width : '80.5%'}, 700)
			$("#search3").hide("blind", { direction: "left" }, 700),
			$("#c_end").animate({width : '80.5%'}, 700)
		});
		$("#c_end").focus(function() {
			$(this).val("")
			$("#c_endv").val("")
			$(".map_wrap1").slideUp(), $(".map_wrap2").slideUp(),
			$("#search3").show("blind", { direction: "left" }, 700),
			$("#c_end").animate({width : '68.5%'}, 700),
			$("#search1").hide("blind", { direction: "left" }, 700),
			$("#c_start").animate({width : '80.5%'}, 700),
			$("#search2").hide("blind", { direction: "left" }, 700),
			$("#via").animate({width : '80.5%'}, 700);
		});
});