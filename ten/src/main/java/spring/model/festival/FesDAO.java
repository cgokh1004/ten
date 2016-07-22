package spring.model.festival;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FesDAO {

	@Autowired 
	private SqlSessionTemplate mybatis;
	
	
	public void setMybatis(SqlSessionTemplate mybatis){
		this.mybatis=mybatis;
	}
		
	
	public int create(FesDTO dto){
		return mybatis.insert("festival.create", dto) ;
	}
	
	
	public FesDTO read(int fes_no){
		
		return mybatis.selectOne("festival.read", fes_no);
	}
	
	
	public int update(FesDTO dto){
		return mybatis.update("festival.update",dto);
	}
		
	public int delete(int fes_no){
				
		return mybatis.delete("festival.delete",fes_no);
	}

	public List<FesDTO> list(Map map){
		
		return mybatis.selectList("festival.list", map);
	}
	
	public int total(String col, String word){
		
			Map map = new HashMap();
			map.put("col", col);
			map.put("word", word);
					
		return mybatis.selectOne("total",map);
	}
}
