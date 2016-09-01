package spring.model.carpool;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import spring.model.ten.DAOMyBatisInter;
@Component
public class CarpoolDAO implements DAOMyBatisInter {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	@Override
	public int create(Object dto) throws Exception {
			return mybatis.insert("carpool.create", dto);
	}

	@Override
	public List<CarpoolDTO> list(Map map) throws Exception {
		return mybatis.selectList("carpool.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mybatis.selectOne("carpool.read", pk);
	}
	
	public List<CarpoolDTO> read_id(Map map) throws Exception {
		return mybatis.selectList("carpool.read_id", map);
	}
	public int now_seat(Map map) throws Exception {
		return mybatis.update("carpool.now_seat", map);
	}

	@Override
	public int update(Object dto) throws Exception {
		return mybatis.update("carpool.update", dto);
	}

	@Override
	public int delete(Object pk) throws Exception {
		return mybatis.delete("carpool.delete", pk);
	}

	@Override
	public int total(Map map) throws Exception {
		return mybatis.selectOne("carpool.total", map);
	}
	
	public int total_id(String id) throws Exception {
		return mybatis.selectOne("carpool.total_id", id);
	}

}
