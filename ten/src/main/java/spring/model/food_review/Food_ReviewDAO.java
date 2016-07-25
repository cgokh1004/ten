package spring.model.food_review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;

@Component
public class Food_ReviewDAO implements DAOMyBatisInter {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//서블렛에서 만들면 오토와이어드가 되기때문에 필요없지만, 자바에서는 오토와이어드가 안되기때문, 자바에서 테스트하기 위해서 만들었다.
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}	
	
	@Override
	public int create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.insert("food_review.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectList("food_review.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.update("food_review.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.delete("food_review.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mybatis.selectOne("food_review.total", map);
	}

}
