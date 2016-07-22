package spring.model.carpool;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class CarpoolDAO implements DAOMyBatisInter {

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
			return mybatis.insert("carpool.create", dto);
	}

	@Override
	public List list(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectList("carpool.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("carpool.read", pk);
	}

	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("carpool.update", dto);
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("carpool.delete", pk);
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("carpool.total", map);
	}

}
