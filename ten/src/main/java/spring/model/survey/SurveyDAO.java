package spring.model.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;

@Component
public class SurveyDAO implements DAOMyBatisInter {
	
 @Autowired
   private SqlSessionTemplate mybatis;
 
public void setMybatis(SqlSessionTemplate mybatis) {
	this.mybatis = mybatis;
}

	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("survey.create", dto);
	}

	@Override
	public List<SurveyDTO> list(Map map) throws Exception {
		 return mybatis.selectList("survey.list", map);
	}
	
	public List readlist(String pk) {
		return mybatis.selectList("survey.oneToManyList", pk);
		}
	
	public List resultreadlist(String pk) {
		return mybatis.selectList("survey.resultoneToManyList", pk);
		}
	
	
	@Override
	public Object read(Object pk) throws Exception {		
		return mybatis.selectOne("survey.oneToMany", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("survey.update", dto);
	}
	
	public int sulstateno(Object pk) throws Exception {
		return mybatis.update("survey.sulstateno", pk);
	}
	
	public int sulstateyes(Object pk) throws Exception {
		return mybatis.update("survey.sulstateyes", pk);
	}
	
	public int surveyupdate(Object dto) throws Exception {
		return mybatis.update("survey.surveyupdate", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("survey.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {		
		// TODO Auto-generated method stub
			return 0;
	}
	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mybatis.selectOne("survey.total", map);
	}
	
	public int recentlykey(Object dto) throws Exception {
		return mybatis.selectOne("survey.recentlykey", dto);
	}
}