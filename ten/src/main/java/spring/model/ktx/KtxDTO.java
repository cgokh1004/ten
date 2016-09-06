package spring.model.ktx;

public class KtxDTO {

	private int ktx_no  ;
	private String id      ;
	private String s_point ;
	private String s_address;
	private String r_point ;
	private String r_address;
	private String purpose ;
	private String s_date  ;
	private int seat    ;
	private int price   ;
	private String content ;
	private String reg_date;
	private int apply_seat   ;
	
	
	
	public int getApply_seat() {
		return apply_seat;
	}
	public void setApply_seat(int apply_seat) {
		this.apply_seat = apply_seat;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getR_address() {
		return r_address;
	}
	public void setR_address(String r_address) {
		this.r_address = r_address;
	}
	public int getKtx_no() {
		return ktx_no;
	}
	public void setKtx_no(int ktx_no) {
		this.ktx_no = ktx_no;
	}
	public String getS_point() {
		return s_point;
	}
	public void setS_point(String s_point) {
		this.s_point = s_point;
	}
	public String getR_point() {
		return r_point;
	}
	public void setR_point(String r_point) {
		this.r_point = r_point;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
