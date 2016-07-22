package spring.model.bus_reply;

public class Bus_replyDTO {
	
	private int rev_no;
	private int busno;              
    private String ID;                 
    private int price;                
    private String content;            
    private String car_num;             
    private String bid_req;            
    private String deal_comp;
    
    
    public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public int getBusno() {
		return busno;
	}
	public void setBusno(int busno) {
		this.busno = busno;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getBid_req() {
		return bid_req;
	}
	public void setBid_req(String bid_req) {
		this.bid_req = bid_req;
	}
	public String getDeal_comp() {
		return deal_comp;
	}
	public void setDeal_comp(String deal_comp) {
		this.deal_comp = deal_comp;
	}

}
