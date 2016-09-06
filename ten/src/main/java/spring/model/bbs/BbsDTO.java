package spring.model.bbs; 
 
public class BbsDTO { 
  /** 번호 */ 
  private int bbsno; 
  /** 글쓴이 */ 
  private String wname; 
  /** 제목 */ 
  private String title; 
  /** 내용 */ 
  private String content; 
  /** 패스워드 */ 
  private String passwd; 
  /** 조회수 */ 
  private int viewcnt; 
  /** 등록일 */ 
  private String wdate; 
  /** 그룹 번호 */ 
  private int grpno; 
  /** 답변 차수 */ 
  private int indent; 
  /** 답변 순서 */ 
  private int ansnum;
  private int refnum;
  
  public int getRefnum() {
	return refnum;
}
public void setRefnum(int refnum) {
	this.refnum = refnum;
}
public int getBbsno() {
    return bbsno;
  }
  public void setBbsno(int bbsno) {
    this.bbsno = bbsno;
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
  public int getViewcnt() {
    return viewcnt;
  }
  public void setViewcnt(int viewcnt) {
    this.viewcnt = viewcnt;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
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
   
  
   
} 