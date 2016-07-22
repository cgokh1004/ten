package spring.model.carpool_review;

import spring.model.member.MemberDTO;

public class Carpool_ReviewDTO {
	private int crev_no;  
	private int score;            
	private int carpoolno;
	private String id;       
	private String content;
	private MemberDTO memberDTO;
	
	
	

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public int getCrev_no() {
		return crev_no;
	}
	public void setCrev_no(int crev_no) {
		this.crev_no = crev_no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getCarpoolno() {
		return carpoolno;
	}
	public void setCarpoolno(int carpoolno) {
		this.carpoolno = carpoolno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	} 
	
	
}
