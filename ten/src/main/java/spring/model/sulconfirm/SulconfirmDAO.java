package spring.model.sulconfirm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.survey.SurveyDTO;


	@Component
	public class SulconfirmDAO {
		@Autowired
		private SqlSessionTemplate mybatis; 
		
		public void setMybatis(SqlSessionTemplate mybatis) {
			this.mybatis = mybatis;	
		}
		public int create(SulconfirmDTO dto) {
			
			return mybatis.insert("sulconfirm.create", dto);
		}
	    public int update(SulconfirmDTO dto) {
			
			return mybatis.update("sulconfirm.update", dto);
		}
	    public SulconfirmDTO read(int sulno) {
	    	return mybatis.selectOne("sulconfirm.read", sulno);
	    }
		public int delete(int sulno){
			return mybatis.delete("sulconfirm.delete", sulno);
		}
	    public int total(String col, String word){
				
			 	Map map = new HashMap();
			 	map.put("col", col);
			 	map.put("word", word);
			 	
				return mybatis.selectOne("sulconfirm.total", map);
			}
	    public List<SulconfirmDTO> list(Map map){
		 	   
	 	   return mybatis.selectList("sulconfirm.list", map);
	 	 }
	    
	}

