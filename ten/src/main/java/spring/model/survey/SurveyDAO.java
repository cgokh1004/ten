package spring.model.survey;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.GroupLayout.SequentialGroup;

import org.mybatis.spring.SqlSessionTemplate;


import spring.model.ten.DAOMyBatisInter;


public class SurveyDAO implements DAOMyBatisInter {
  
	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.insert("survey.create", dto);
	}

	@Override
	public List<SurveyDTO> list(Map map, SqlSessionTemplate mybatis) throws Exception {
		 return mybatis.selectList("survey.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("survey.oneToMany", pk);
	}

	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("survey.update", dto);
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("survey.delete", pk);
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {	 	
		return mybatis.selectOne("survey.total", map);
	}

}
