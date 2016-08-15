jQuery(document).ready(function($) {
	// 이 함수 안에서는 $를 jQuery가 사용
$('.datetimepicker').appendDtpicker({'locale':'ko',defalutDate : new Date() });
});
function InputCheck(){
	if($("#startdate").val()==''){
		alert("출발일시를 입력해주세요")
		$("#startdate").focus()
		return false;
	}
	if($("#seat").val()==''){
		alert("인원수를 입력해주세요")
		$("#seat").focus()
		return false;
	}
	if($.isNumeric($("#seat").val())==false){
		alert("숫자를 입력해주세요")
		$("#seat").focus()
		return false;
	}
	if($("#price").val()==''){
		alert("1인당 금액을 입력해주세요")
		$("#price").focus()
		return false;
	}
	if($.isNumeric($("#price").val())==false){
		alert("숫자를 입력해주세요")
		$("#price").focus()
		return false;
	}
}