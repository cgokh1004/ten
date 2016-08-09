package spring.model.tra_reply;

public class Tra_ReplyDTO {

	private int treply_no;       
    private int tra_no;          
    private String trep_date;        
    private String id;            
    private String content;
	
    
    public int getTreply_no() {
		return treply_no;
	}
	public void setTreply_no(int treply_no) {
		this.treply_no = treply_no;
	}
	public int getTra_no() {
		return tra_no;
	}
	public void setTra_no(int tra_no) {
		this.tra_no = tra_no;
	}
	public String getTrep_date() {
		return trep_date;
	}
	public void setTrep_date(String trep_date) {
		this.trep_date = trep_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}              
	
}
