package spring.model.qquestion;

public class QquestionDTO {
	private int qqno;
	private String title;
	private String content;
	private int viewcnt;
	private String qqdate;
	
	public int getQqno() {
		return qqno;
	}
	public void setQqno(int qqno) {
		this.qqno = qqno;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	public String getQqdate() {
		return qqdate;
	}
	public void setQqdate(String qqdate) {
		this.qqdate = qqdate;
	}
}
