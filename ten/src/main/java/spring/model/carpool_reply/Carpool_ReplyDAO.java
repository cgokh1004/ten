package spring.model.carpool_reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;
@Component
public class Carpool_ReplyDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("carpool_reply.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("carpool_reply.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("carpool_reply.read", pk);

	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("carpool_reply.update", dto);

	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("carpool_reply.delete", pk);

	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("carpool_reply.total", map);
	}

}
