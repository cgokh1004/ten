package spring.model.request;

public class RequestDTO {
	
	private int rev_no;
	private String ID;
    private String coID;
    private String req_date;
    private String accept;
    
    public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getCoID() {
		return coID;
	}
	public void setCoID(String coID) {
		this.coID = coID;
	}
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	public String getAccept() {
		return accept;
	}
	public void setAccept(String accept) {
		this.accept = accept;
	}


}
