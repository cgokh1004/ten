package spring.model.carpool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.model.member.MemberDTO;

@Component
public class CarpoolDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public int create(CarpoolDTO carpoolDTO){
		return mybatis.insert("carpool.create", carpoolDTO);
	}
	
	public CarpoolDTO read(int carpoolno){
		return mybatis.selectOne("carpool.read", carpoolno);
	}
	
	public int update(CarpoolDTO carpoolDTO){
		return mybatis.update("carpool.update", carpoolDTO);
	}
	
	public int delete(int carpoolno){
		return mybatis.delete("carpool.delete", carpoolno);
	}
	
	public List<CarpoolDTO> list(Map map){
		return mybatis.selectList("carpool.list", map);
	}
	
	public int total(String col,String word){
		Map map=new HashMap();
		map.put("col","");
		map.put("word","");
		return mybatis.selectOne("carpool.total", map);
	}
}
