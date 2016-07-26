package spring.model.sulmunr;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;

@Component
public class SulmunrDAO implements DAOMyBatisInter {
  @Autowired
   private SqlSessionTemplate mybatis;
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("sulmunr.create", dto);
	}

	@Override
	public List<SulmunrDTO> list(Map map) throws Exception {
		 return mybatis.selectList("sulmunr.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("sulmunr.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("sulmunr.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("sulmunr.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("sulmunr.total", map);
	}

}
