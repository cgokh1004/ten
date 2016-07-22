package spring.model.travel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TraDAO {

	@Autowired
	private SqlSessionTemplate mybatis;	

	public void setMybatis(SqlSessionTemplate mybatis){
		this.mybatis=mybatis;
	}

	public int create(TraDTO dto){
		return mybatis.insert("travel.create", dto);
	}
	
	public TraDTO read(int tra_no){
		return mybatis.selectOne("travel.read", tra_no);
	}
	
	public int update(TraDTO dto){
		return mybatis.update("travel.update", dto);
	}
	
	public int delete(int tra_no){
		return mybatis.delete("travel.delete", tra_no);
	}
	
	public List<TraDTO> list(Map map){
		return mybatis.selectList("travel.list",map);
	}
	
	public int total(String col, String word){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		
		return mybatis.selectOne("travel.total",map);
	}
}
