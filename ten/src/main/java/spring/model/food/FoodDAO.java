package spring.model.food;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FoodDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 서블렛에서 만들면 오토와이어드가 되기때문에 필요없지만, 자바에서는 오토와이어드가 안되기때문, 자바에서 테스트하기 위해서 만들었다.
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create(FoodDTO foodDTO) {
		return mybatis.insert("food.create", foodDTO);
	}	
}
