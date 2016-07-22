package spring.model.festival;

public class FesDTO {
	
	private int fes_no;
	private String fdate;
	private String title;
	private String location;
	private String filename;
	private String content;
	private int viewcnt;
	public int getFes_no() {
		return fes_no;
	}
	public void setFes_no(int fes_no) {
		this.fes_no = fes_no;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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

	
	
	
}
