package spring.model.carpool;

import spring.model.member.MemberDTO;

public class CarpoolDTO {
	private int carpoolno;
	private String id;         
	private String carpooldate;
	private String c_start;    
	private String c_startv;   
	private String c_end;      
	private String c_endv;     
	private String via;        
	private String viav;       
	private String purpose;    
	private String c_type;     	           
	private String kind;       				
	private String startdate;  
	private int seat;       
	private int price;      
	private String smoke;      				
	private String c_comment;
	private MemberDTO memberDTO;
	
	
	

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
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
	public String getCarpooldate() {
		return carpooldate;
	}
	public void setCarpooldate(String carpooldate) {
		this.carpooldate = carpooldate;
	}
	public String getC_start() {
		return c_start;
	}
	public void setC_start(String c_start) {
		this.c_start = c_start;
	}
	public String getC_startv() {
		return c_startv;
	}
	public void setC_startv(String c_startv) {
		this.c_startv = c_startv;
	}
	public String getC_end() {
		return c_end;
	}
	public void setC_end(String c_end) {
		this.c_end = c_end;
	}
	public String getC_endv() {
		return c_endv;
	}
	public void setC_endv(String c_endv) {
		this.c_endv = c_endv;
	}
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getViav() {
		return viav;
	}
	public void setViav(String viav) {
		this.viav = viav;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	
}
