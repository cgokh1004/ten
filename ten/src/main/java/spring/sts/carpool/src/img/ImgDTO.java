package img; 
 
public class ImgDTO { 
  /** 번호 */ 
  private int imgno; 
  /** 글쓴이 */ 
  private String wname; 
  /** 제목 */ 
  private String title; 
  /** 내용 */ 
  private String content; 
  /** 패스워드 */ 
  private String passwd; 
   /** 그룹 번호 */ 
  private int grpno; 
  /** 답변 차수 */ 
  private int indent; 
  /** 답변 순서 */ 
  private int ansnum;
  /** 이미지파일 */ 
  private String filename;
  
  public int getImgno() {
	return imgno;
}
public void setImgno(int imgno) {
	this.imgno = imgno;
}
public String getWname() {
	return wname;
}
public void setWname(String wname) {
	this.wname = wname;
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
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public int getGrpno() {
	return grpno;
}
public void setGrpno(int grpno) {
	this.grpno = grpno;
}
public int getIndent() {
	return indent;
}
public void setIndent(int indent) {
	this.indent = indent;
}
public int getAnsnum() {
	return ansnum;
}
public void setAnsnum(int ansnum) {
	this.ansnum = ansnum;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
}
  
  