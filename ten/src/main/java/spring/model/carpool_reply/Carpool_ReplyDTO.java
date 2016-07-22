package spring.model.carpool_reply;

import spring.model.member.MemberDTO;

public class Carpool_ReplyDTO {
	private int crep_no;  
	private String crep_date;
	private String content;  
	private String id;       
	private int carpoolno;
	private MemberDTO memberDTO;
	
	

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public int getCrep_no() {
		return crep_no;
	}
	public void setCrep_no(int crep_no) {
		this.crep_no = crep_no;
	}
	public String getCrep_date() {
		return crep_date;
	}
	public void setCrep_date(String crep_date) {
		this.crep_date = crep_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCarpoolno() {
		return carpoolno;
	}
	public void setCarpoolno(int carpoolno) {
		this.carpoolno = carpoolno;
	}
	
	
}
