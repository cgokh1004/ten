package spring.model.sulmunr;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class SulmunrDAO implements DAOMyBatisInter {   

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.insert("sulmunr.create", dto);
	}

	@Override
	public  List<SulmunrDTO> list(Map map, SqlSessionTemplate mybatis) throws Exception {
		 return mybatis.selectList("sulmunr.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulmunr.read", pk);
	}

	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("sulmunr.update", dto);
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("sulmunr.delete", pk);
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulmunr.total", map);
	}

}
