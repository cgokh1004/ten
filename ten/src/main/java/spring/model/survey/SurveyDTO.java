package spring.model.survey;

import java.util.List;

public class SurveyDTO {
	
	private int sulno;
	/**설문지일련번호 */ 
	private String askcontent;
	  /**질문내용 */ 
	private String sulgroupname;
	  /**설문지이름(첫설문, 둘째설문, 셋째설문 등).... */ 
	private String sulstate;
	/**설문지 진행,완료 상태(설문진행중/완료 구분).....*/ 
	private int chono;
	//sulmunr테이블의 join을 통해서 가지고 옴.......항목보기번호	
	private String chocontent;
   //sulmunr테이블의 join을 통해서 가지고 옴.......항목보기내용	
	
	private List sulmunrdtoList; //1:N 
	
	public List getSulmunrdtoList() {
		return sulmunrdtoList;
	}
	public void setSulmunrdtoList(List sulmunrdtoList) {
		this.sulmunrdtoList = sulmunrdtoList;
	}
	public int getChono() {
		return chono;
	}
	public void setChono(int chono) {
		this.chono = chono;
	}
	public String getChocontent() {
		return chocontent;
	}
	public void setChocontent(String chocontent) {
		this.chocontent = chocontent;
	}
	public String getSulstate() {
		return sulstate;
	}
	public void setSulstate(String sulstate) {
		this.sulstate = sulstate;
	}	
	  public int getSulno() {
		return sulno;
	}
	public void setSulno(int sulno) {
		this.sulno = sulno;
	}
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

	
}
