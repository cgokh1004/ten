package spring.model.sulconfirm;

public class SulconfirmDTO {
	
	private int confirmno;
	/** 설문확인 일련번호*/
	private String id;
	/** 회원아이디(FK)*/
	private int sulno;
	/**설문지일련번호(FK) */ 
	private int selno;
	/** 설문항목선택번호*/	

	
	public int getConfirmno() {
		return confirmno;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setConfirmno(int confirmno) {
		this.confirmno = confirmno;
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
