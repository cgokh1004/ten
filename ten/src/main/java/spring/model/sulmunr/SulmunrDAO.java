package spring.model.sulmunr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.survey.SurveyDTO;




@Component
public class SulmunrDAO {
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;	
	}
	public int create(SulmunrDTO dto) {
		
		return mybatis.insert("sulmunr.create", dto);
	}
	 public int update(SulmunrDTO dto) {
			
			return mybatis.update("sulmunr.update", dto);
		}
	 public SulmunrDTO read(int sulmunrno) {
	    	return mybatis.selectOne("sulmunr.read", sulmunrno);
	    }
		public int delete(int sulmunrno){
			return mybatis.delete("sulmunr.delete", sulmunrno);
		}
	    public int total(String col, String word){
				
			 	Map map = new HashMap();
			 	map.put("col", col);
			 	map.put("word", word);
			 	
				return mybatis.selectOne("sulmunr.total", map);
			}
	    public List<SulmunrDTO> list(Map map){
		 	   
	 	   return mybatis.selectList("sulmunr.list", map);
	 	 }
}
