package spring.model.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class SurveyDAO {
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;	
	}
	public int create(SurveyDTO dto) {
		
		return mybatis.insert("survey.create", dto);
	}
    public int update(SurveyDTO dto) {
		
		return mybatis.update("survey.update", dto);
	}
    public SurveyDTO read(int sulno) {
    	return mybatis.selectOne("survey.read", sulno);
    }
	public int delete(int sulno){
		return mybatis.delete("survey.delete", sulno);
	}
    public int total(String col, String word){
			
		 	Map map = new HashMap();
		 	map.put("col", col);
		 	map.put("word", word);
		 	
			return mybatis.selectOne("survey.total", map);
		}
    public List<SurveyDTO> list(Map map){
	 	   
 	   return mybatis.selectList("survey.list", map);
 	 }
    
}
