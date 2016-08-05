package spring.model.sulmunr;

public class SulmunrDTO {
	
	private int sulmunrno;
	/**설문항목일련번호*/
	private int chono;
	/**설문항목선택번호*/
	private String chocontent;
	/**설문항목내용*/
	private int sulno;
	/**설문지일련번호(FK) */ 
	private int thenumber;
	/** 설문번호선택자수*/	
	private int theratio;
	/**설문번호선택자수비율*/
	
	public int getTheratio() {
		return theratio;
	}
	public void setTheratio(int theratio) {
		this.theratio = theratio;
	}
	
	public int getSulno() {
		return sulno;
	}
	public int getThenumber() {
		return thenumber;
	}
	public void setThenumber(int thenumber) {
		this.thenumber = thenumber;
	}
	public void setSulno(int sulno) {
		this.sulno = sulno;
	}
	
	public int getSulmunrno() {
		return sulmunrno;
	}
	public void setSulmunrno(int sulmunrno) {
		this.sulmunrno = sulmunrno;
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

}
