package spring.model.sulconfirm;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import spring.model.ten.DAOMyBatisInter;

public class SulconfirmDAO implements DAOMyBatisInter {

	@Override
	public int create(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.insert("sulconfirm.create", dto);
	}

	@Override
	public List<SulconfirmDTO> list(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectList("sulconfirm.list", map);
	}

	@Override
	public Object read(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return null;
	}
	
	public Object read1(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulconfirm.read1", pk);
	}
	public Object read2(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulconfirm.read2", pk);
	}
	


	@Override
	public int update(Object dto, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.update("sulconfirm.update", dto);
	}

	@Override
	public int delete(Object pk, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.delete("sulconfirm.delete", pk);
	}

	@Override
	public int total(Map map, SqlSessionTemplate mybatis) throws Exception {
		return mybatis.selectOne("sulconfirm.total", map);
	}

}
