package spring.model.travel;

import org.springframework.web.multipart.MultipartFile;

public class TraDTO {

	private int tra_no;
	private String tdate;
	private String location;
	private String title;
	private String filename;
	private String content;
	private int viewcnt;
	private MultipartFile fnameMF;
	
	
	
	public MultipartFile getFnameMF() {
		return fnameMF;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
	public int getTra_no() {
		return tra_no;
	}
	public void setTra_no(int tra_no) {
		this.tra_no = tra_no;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
