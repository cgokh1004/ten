package spring.model.schedule;
public class SchedulerVO {
	
	private int event_id;
	/**플래너 일련번호 */ 
	private String event_name;  
	/**플래너 글제목*/ 
	private String start_date;  
	/**플래너 시작일 */ 
	private String end_date;
	/**플래너 종료일 */ 
	private String id;
	/**회원 아이디(FK) */
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		//System.out.println("event_id:"+event_id);
		this.event_id = event_id;
	}
	public String getEvent_name() {
		//System.out.println("event_name:get "+ event_name );
		return event_name;
	}
	public void setEvent_name(String event_name) {
		//System.out.println("event_name:"+event_name);
		this.event_name = event_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		//System.out.println("start_date:"+start_date);
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		//System.out.println("end_date:"+end_date);
		this.end_date = end_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		//System.out.println("id:"+id);
		this.id = id;
	} 
	

}