package spring.model.carpool_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class Carpool_ReplyDAO implements DAOMyBatisInter {

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.insert("carpool_reply.create", dto);
	}

	@Override
	public List list(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectList("carpool_reply.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("carpool_reply.read", pk);

	}

	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("carpool_reply.update", dto);

	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("carpool_reply.delete", pk);

	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("carpool_reply.total", map);
	}

}
