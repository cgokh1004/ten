package spring.model.sulconfirm;

public class SulconfirmDTO {
	
	private int confirmno;
	/** 설문확인 일련번호*/
	private String ID;
	/** 회원아이디(FK)*/
	private int sulno;
	/**설문지일련번호(FK) */ 
	private int selno;
	/** 설문항목선택번호*/	
	private String askcontent;
	/**질문내용 */ 
	private String sulgroupname;
	/**설문지이름(첫설문, 둘째설문, 셋째설문 등).... */ 
	
	  public String getAskcontent() {
		return askcontent;
	}
	public void setAskcontent(String askcontent) {
		this.askcontent = askcontent;
	}
	public String getSulgroupname() {
		return sulgroupname;
	}
	public void setSulgroupname(String sulgroupname) {
		this.sulgroupname = sulgroupname;
	}

	
	
	public int getConfirmno() {
		return confirmno;
	}
	public void setConfirmno(int confirmno) {
		this.confirmno = confirmno;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getSulno() {
		return sulno;
	}
	public void setSulno(int sulno) {
		this.sulno = sulno;
	}
	public int getSelno() {
		return selno;
	}
	public void setSelno(int selno) {
		this.selno = selno;
	}

	
	 
	
}
