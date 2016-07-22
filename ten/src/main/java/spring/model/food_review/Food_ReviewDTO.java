package spring.model.food_review;

import spring.model.food.FoodDTO;

public class Food_ReviewDTO {
	private int frev_no;
	private int score;
	private String faddress;
	private String content;             
	private String fooddate;
	private String id;
	private FoodDTO fooddto;
	
	public FoodDTO getFooddto() {
		return fooddto;
	}
	public void setFooddto(FoodDTO fooddto) {
		this.fooddto = fooddto;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    
	public int getFrev_no() {
		return frev_no;
	}
	public void setFrev_no(int frev_no) {
		this.frev_no = frev_no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getFaddress() {
		return faddress;
	}
	public void setFaddress(String faddress) {
		this.faddress = faddress;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFooddate() {
		return fooddate;
	}
	public void setFooddate(String fooddate) {
		this.fooddate = fooddate;
	}
}
