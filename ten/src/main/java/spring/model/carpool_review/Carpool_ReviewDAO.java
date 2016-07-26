package spring.model.carpool_review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;
@Component
public class Carpool_ReviewDAO implements DAOMyBatisInter {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	@Override
	public int create(Object dto) throws Exception {
		return mybatis.insert("carpool_review.create", dto);
	}

	@Override
	public List list(Map map) throws Exception {
		return mybatis.selectList("carpool_review.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("carpool_review.read", pk);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("carpool_review.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("carpool_review.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("carpool_review.total", map);
	}

}
