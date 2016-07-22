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
	
	public int getSulno() {
		return sulno;
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
