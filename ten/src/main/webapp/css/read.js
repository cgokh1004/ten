function adelete(carpoolno){
	var url = "./delete"
		url = url + "?carpoolno=" + carpoolno
		location.href=url;
}

function find() {
	var url = "http://map.daum.net/"
	var start = $("#c_start").text()
	var end = $("#c_end").text()

	url = url + "?sName=" + start
	url = url + "&eName=" + end
	window.open(url, "실제경로검색");
}
var cnt=0;
function score(score) {
	    cnt+=1;
	if(cnt>1){
		alert("평가는 한번만 하실수 있습니다.")
		return false;
	}
	var url = "../carpool_review/create"
	url = url + "?score=" + score
	url = url + "&carpoolno=" + $("#carpoolno").val()
	window.open(url, "별점 평가",
			"width=500, height=360, left=500, top=200,menubar=no");
}

$("#star1").click(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"), $(this)
					.attr("src", "../images/별1.png"), score(1);
		})
$("#star2").click(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"), $("#star1,#star2").attr("src",
					"../images/별1.png"), score(2);
		})
$("#star3").click(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"), $("#star1,#star2,#star3").attr("src",
					"../images/별1.png"), score(3);
		})
$("#star4").click(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"), $("#star1,#star2,#star3,#star4").attr(
					"src", "../images/별1.png"), score(4);
		})
$("#star5").click(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"),
					$("#star1,#star2,#star3,#star4,#star5").attr("src",
							"../images/별1.png"), score(5);
		})
$("#star1,#star2,#star3,#star4,#star5").dblclick(
		function() {
			$("#star1,#star2,#star3,#star4,#star5").attr("src",
					"../images/별0.png"), score(0);
		});
//댓글관련 시작
function rcheck(tarea) {
	if ($("#id").val() == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/login";
			url = url + "?carpoolno="+$("#carpoolno").val();
			url = url
			+ "&nowPage="+$("#nowPage").val();
			url = url + "&nPage="+$("#nPage").val();
			url = url + "&kind1="+$("#kind1").val();
			url = url + "&kind2="+$("#kind2").val();
			url = url + "&word1="+$("#word1").val();
			url = url + "&word2="+$("#word2").val();
			url = url + "&flag=../carpool/read";
			location.href = url;
		} else {
			tarea.blur();
		}
	}
}

var cnt=0
function rupdate(crep_no, rcontent) {
	var f = document.rform;
	rcontent=rcontent.replace(/<br>/gi,"\r\n")
	rcontent=rcontent.replace(/&nbsp/gi,"\u0020")
	f.content.value = rcontent
	f.crep_no.value = crep_no;
	cnt+=1;
	$("#rsubmit").remove()
	if(cnt==1){
	$("#content").after("<input type='button'value='수정' id='rupdate'>")
	
	$("#rupdate").click(function(){
		if ($("#content").val()== "") {
			alert("댓글 내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		$("#reply").empty();
		$("#crep_no").val(crep_no)
		$.post("./rupdate",$("#rform").serialize(),
				function(data){
			if(data!=''){
				
			$.each(data,function(index,value){
				cnt=0;
				var no=value.crep_no;
				var content=value.content;
			    	content=encodeURIComponent(content)
				var html = '<div class="rlist">'
					html += value.id +"<br>"
					html += "<p>"+value.content+"</p>"
					html += value.crep_date
					if($("#id").val()==value.id){
					html +="<span style='float: right;'>"
					html +="<a href=javascript:rupdate('"
					html +=	no+"','"+content
					html += "')>수정</a>|"
					html +="<a href=javascript:rdelete('"
					html +=	no
					html +="')>삭제</a></span>"	
					}
					$("#reply").append(html)						
			})
				$("#content").val('').focus();
				$("#rupdate").remove()
				$("#content").after("<input type='button' name='rsubmit' id='rsubmit' value='등록'>")

				$("#rsubmit").click(function(){
					if ($("#id").val() == "") {
						if(confirm("로그인후 댓글를 쓰세요")){
							var url = "../member/login";
							url = url + "?carpoolno="+$("#carpoolno").val();
							url = url + "&nowPage="+$("#nowPage").val();
							url = url + "&nPage="+$("#nPage").val();
							url = url + "&kind1="+$("#kind1").val();
							url = url + "&kind2="+$("#kind2").val();
							url = url + "&word1="+$("#word1").val();
							url = url + "&word2="+$("#word2").val();
							url = url + "&flag=../carpool/read";
							location.href = url;
						}else{
							tarea.blur();
						}
					}else{
						if ($("#content").val()== "") {
							alert("댓글 내용을 입력하세요.");
							$("#content").focus();
							return false;
						}
					}
					
					$("#reply").empty();
					$.post("./rcreate",$("#rform").serialize(),
							function(data){
						if(data!=''){
							
							$.each(data,function(index,value){
								cnt=0;
								var no=value.crep_no;
								var content=value.content;
									content=encodeURIComponent(content)
								var html = '<div class="rlist">'
									html += value.id +"<br>"
									html += "<p>"+value.content+"</p>"
									html += value.crep_date
									if($("#id").val()==value.id){
									html +="<span style='float: right;'>"
									html +="<a href=javascript:rupdate('"
									html +=	no+"','"+content
									html += "')>수정</a>|"
									html +="<a href=javascript:rdelete('"
									html +=	value.crep_no
									html +="')>삭제</a></span>"
									}
								$("#reply").append(html)						
							})
							$("#content").val('').focus();
						}
					});
				});

			}
		});
	})}

}
$("#rsubmit").click(function(){
	if ($("#id").val() == "") {
		if(confirm("로그인후 댓글를 쓰세요")){
			var url = "../member/login";
			url = url + "?carpoolno="+$("#carpoolno").val();
			url = url + "&nowPage="+$("#nowPage").val();
			url = url + "&nPage="+$("#nPage").val();
			url = url + "&kind1="+$("#kind1").val();
			url = url + "&kind2="+$("#kind2").val();
			url = url + "&word1="+$("#word1").val();
			url = url + "&word2="+$("#word2").val();
			url = url + "&flag=../carpool/read";
			location.href = url;
		}else{
			tarea.blur();
		}
	}else{
		if ($("#content").val()== "") {
			alert("댓글 내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
	}
	
	$("#reply").empty();
	$.post("./rcreate",$("#rform").serialize(),
			function(data){
		if(data!=''){
			
			$.each(data,function(index,value){
				cnt=0;
				var no=value.crep_no;
				var content=value.content;
					content=encodeURIComponent(content)
				var html = '<div class="rlist">'
					html += value.id +"<br>"
					html += "<p>"+value.content+"</p>"
					html += value.crep_date
					if($("#id").val()==value.id){
					html +="<span style='float: right;'>"
					html +="<a href=javascript:rupdate('"
					html +=	no+"','"+content
					html += "')>수정</a>|"
					html +="<a href=javascript:rdelete('"
					html +=	value.crep_no
					html +="')>삭제</a></span>"
					}
				$("#reply").append(html)						
			})
			$("#content").val('').focus();
		}
	});
});

function rdelete(crep_no) {
	if (confirm("정말삭제 하겠습니까?")) {
		var url = "./rdelete";
		url = url + "?crep_no=" + crep_no;
		url = url + "&carpoolno="+$("#carpoolno").val();
		url = url + "&nowPage="+$("#nowPage").val();
		url = url + "&nPage="+$("#nPage").val();
		url = url + "&kind1="+$("#kind1").val();
		url = url + "&kind2="+$("#kind2").val();
		url = url + "&word1="+$("#word1").val();
		url = url + "&word2="+$("#word2").val();
		location.href = url;
	}
}
//댓글관련 끝
