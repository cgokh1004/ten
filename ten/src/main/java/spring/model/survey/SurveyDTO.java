package spring.model.survey;

import java.util.List;

public class SurveyDTO {
	
	private int sulno;
	/**설문지일련번호 */ 
	private String askcontent;
	  /**질문내용 */ 
	private String sulgroupname;
	  /**설문지이름(첫설문, 둘째설문, 셋째설문 등).... */ 
	private List sulmunrList; //1:N 
	


	  public List getSulmunrList() {
		return sulmunrList;
	}
	public void setSulmunrList(List sulmunrList) {
		this.sulmunrList = sulmunrList;
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
