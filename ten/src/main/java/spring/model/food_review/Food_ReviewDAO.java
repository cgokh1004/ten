package spring.model.food_review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Food_ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//서블렛에서 만들면 오토와이어드가 되기때문에 필요없지만, 자바에서는 오토와이어드가 안되기때문, 자바에서 테스트하기 위해서 만들었다.
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public List<Food_ReviewDTO> list(String faddress){
		return mybatis.selectList("food_review.list", faddress);
	}
	
	public int total(String faddress){
		return mybatis.selectOne("food_review.total", faddress);
	}
	
	public int create(Food_ReviewDTO food_reviewDTO) {
		return mybatis.insert("food_review.create", food_reviewDTO);
	}
	
	public int update(Food_ReviewDTO food_reviewDTO) {
		return mybatis.update("food_review.update", food_reviewDTO);
	}
	
	public int delete(int frev_no) {
		return mybatis.delete("food_review.delete", frev_no);
	}
}
