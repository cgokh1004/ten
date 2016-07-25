package spring.model.ncomment;

public class NcommentDTO {
	private int comno;
	private String content;
    private String wdate;
    private int noticeno;
    private String id;
    
    public int getComno() {
		return comno;
	}
	public void setComno(int comno) {
		this.comno = comno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
