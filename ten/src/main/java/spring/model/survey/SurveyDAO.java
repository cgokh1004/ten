package spring.model.survey;

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
 
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("survey.create", dto);
	}

	@Override
	public List<SurveyDTO> list(Map map) throws Exception {
		 return mybatis.selectList("survey.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("survey.oneToMany", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("survey.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("survey.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("survey.total", map);
	}

}
