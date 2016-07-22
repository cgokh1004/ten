package spring.model.carpool_review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class Carpool_ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create(Carpool_ReviewDTO carpool_reviewDTO){
		return mybatis.insert("carpool_review.create", carpool_reviewDTO);
	}
	
	public Carpool_ReviewDTO read(int crev_no){
		return mybatis.selectOne("carpool_review.read", crev_no);
	}
	
	public int update(Carpool_ReviewDTO carpool_reviewDTO){
		return mybatis.update("carpool_review.update", carpool_reviewDTO);
	}
	
	public int delete(int crev_no){
		return mybatis.delete("carpool_review.delete", crev_no);
	}
	
	public List<Carpool_ReviewDTO> list(Map map){
		return mybatis.selectList("carpool_review.list", map);
	}
	
	public int total(String col,String word){
		Map map=new HashMap();
		map.put("col","");
		map.put("word","");
		return mybatis.selectOne("carpool_review.total", map);
	}
}
