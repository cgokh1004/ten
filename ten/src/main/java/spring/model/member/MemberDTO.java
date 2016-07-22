package spring.model.member;

import java.util.List;

import spring.model.carpool.CarpoolDTO;

public class MemberDTO {
	private String id;             
	private String gender;         	               
	private String mem_type;       	               
	private String name;           
	private int certi_num;    	               
	private int phone_certi;    
	private int addr_certi;     
	private int sns_certi;      
	private int mail_certi;                    
	private int passport_certi;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMem_type() {
		return mem_type;
	}
	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCerti_num() {
		return certi_num;
	}
	public void setCerti_num(int certi_num) {
		this.certi_num = certi_num;
	}
	public int getPhone_certi() {
		return phone_certi;
	}
	public void setPhone_certi(int phone_certi) {
		this.phone_certi = phone_certi;
	}
	public int getAddr_certi() {
		return addr_certi;
	}
	public void setAddr_certi(int addr_certi) {
		this.addr_certi = addr_certi;
	}
	public int getSns_certi() {
		return sns_certi;
	}
	public void setSns_certi(int sns_certi) {
		this.sns_certi = sns_certi;
	}
	public int getMail_certi() {
		return mail_certi;
	}
	public void setMail_certi(int mail_certi) {
		this.mail_certi = mail_certi;
	}
	public int getPassport_certi() {
		return passport_certi;
	}
	public void setPassport_certi(int passport_certi) {
		this.passport_certi = passport_certi;
	}
	
	
}
