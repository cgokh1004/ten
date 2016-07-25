package spring.model.carpool_booked;

import spring.model.carpool.CarpoolDTO;
import spring.model.member.MemberDTO;

public class Carpool_BookedDTO {
	private int booked_no;
	private int carpoolno; 
	private String appli_id;  
	private String writer_id; 
	private String kind;                
	private String type;               
	private int appli_seat;
	private MemberDTO memberDTO;
	private CarpoolDTO carpoolDTO;
	
	
	public int getBooked_no() {
		return booked_no;
	}
	public void setBooked_no(int booked_no) {
		this.booked_no = booked_no;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public CarpoolDTO getCarpoolDTO() {
		return carpoolDTO;
	}
	public void setCarpoolDTO(CarpoolDTO carpoolDTO) {
		this.carpoolDTO = carpoolDTO;
	}
	public int getCarpoolno() {
		return carpoolno;
	}
	public void setCarpoolno(int carpoolno) {
		this.carpoolno = carpoolno;
	}
	public String getAppli_id() {
		return appli_id;
	}
	public void setAppli_id(String appli_id) {
		this.appli_id = appli_id;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAppli_seat() {
		return appli_seat;
	}
	public void setAppli_seat(int appli_seat) {
		this.appli_seat = appli_seat;
	}
	
	
}
