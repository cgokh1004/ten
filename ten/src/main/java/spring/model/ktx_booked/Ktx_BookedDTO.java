package spring.model.ktx_booked;

public class Ktx_BookedDTO {
	
	private int booked_no;
	
	private int ktx_no;
	
	private String appli_id;
	
	private String writer_id;
	
	private int appli_seat;

	public int getBooked_no() {
		return booked_no;
	}

	public void setBooked_no(int booked_no) {
		this.booked_no = booked_no;
	}

	public int getKtx_no() {
		return ktx_no;
	}

	public void setKtx_no(int ktx_no) {
		this.ktx_no = ktx_no;
	}

	public String getAppli_id() {
		return appli_id;
	}

	public void setAppli_id(String appli_id) {
		this.appli_id = appli_id;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public int getAppli_seat() {
		return appli_seat;
	}

	public void setAppli_seat(int appli_seat) {
		this.appli_seat = appli_seat;
	}
	
	
	
}